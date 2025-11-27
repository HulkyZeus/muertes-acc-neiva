#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Script de carga y normalización de datos para la base `muertes_acc_neiva`.

Este módulo:
- Descarga registros desde el portal de Datos Abiertos de Colombia
  (dataset: muertes por accidentes de tránsito en Neiva).
- Normaliza campos clave (fecha, hora, día de la semana, comuna, clase de accidente,
  características de la víctima).
- Inserta los registros en la tabla `muertes_accidentes` de PostgreSQL, incluyendo:
    - Campos derivados (año, mes).
    - El JSON original como `fuente_raw` para trazabilidad/auditoría.

Uso típico (desde consola):

    python cargar_datos_neiva.py

Al ejecutarse como script, descarga los datos y los inserta en la base de datos.
"""


import requests
import psycopg2
from psycopg2.extras import Json
from datetime import datetime

# Parámetros de conexión a la base de datos PostgreSQL
DB_NAME = "muertes_acc_neiva"
DB_USER = "neiva_user"
DB_PASSWORD = "neiva123"
DB_HOST = "localhost"
DB_PORT = 5432

# Endpoint del conjunto de datos en datos.gov.co (límite ampliado a 50.000 registros)
DATA_URL = "https://www.datos.gov.co/resource/2vxy-7tvy.json?$limit=50000"


def get_db_connection():
    """
    Crea y retorna una conexión nueva a la base de datos PostgreSQL.

    Returns:
        psycopg2.extensions.connection: Objeto de conexión activo.
    """
    return psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
    )


def descargar_datos():
    """
    Descarga los registros desde el portal de Datos Abiertos.

    Utiliza `DATA_URL` como fuente y asume que la respuesta es un arreglo JSON.

    Returns:
        list[dict]: Lista de registros (cada uno como diccionario) si la descarga es exitosa.

    Raises:
        requests.HTTPError: Si la respuesta HTTP no es exitosa (4xx o 5xx).
    """
    print("Descargando datos desde Datos Abiertos…")
    r = requests.get(DATA_URL)
    r.raise_for_status()
    data = r.json()
    print(f"Registros descargados: {len(data)}")
    return data


def parse_fecha(fecha_str: str):
    """
    Convierte fecha_del_hecho (string ISO) a:
    - datetime completo
    - año (int)
    - mes (int)

        Ejemplo de entrada:
        "2012-01-01T00:00:00.000"

    Args:
        fecha_str (str): Fecha del hecho en formato ISO (o None).

    Returns:
        tuple:
            - datetime or None: Fecha completa del hecho.
            - int or None: Año del hecho.
            - int or None: Mes del hecho.
    """
    if not fecha_str:
        return None, None, None
    try:
        # Ejemplo: "2012-01-01T00:00:00.000"
        dt = datetime.fromisoformat(fecha_str.replace("Z", ""))
        return dt, dt.year, dt.month
    except Exception:
        return None, None, None


def parse_hora(hora_str: str):
    """
    Convierte hora_del_hecho_hh_mm (ej. '1899-12-31T05:05:00.000') a TIME.
    Solo nos interesa la hora:minuto:segundo.

    Args:
        hora_str (str): Hora en formato ISO (o None).

    Returns:
        datetime.time or None: Hora del hecho o None si no se puede parsear.
    """
    if not hora_str:
        return None
    try:
        dt = datetime.fromisoformat(hora_str.replace("Z", ""))
        return dt.time()
    except Exception:
        return None

def normalizar_dia_semana(t: str) -> str:
    """
    Normaliza el valor del día de la semana a una forma canónica con mayúscula inicial.

    Mapea variantes en minúsculas y sin tilde a su forma estándar (ej. "miercoles" -> "Miércoles").

    Args:
        t (str): Texto original del día de la semana.

    Returns:
        str or None: Día normalizado o None si la entrada es vacía.
    """
    if not t:
        return None
    t_low = t.strip().lower()
    mapa = {
        "domingo": "Domingo",
        "lunes": "Lunes",
        "martes": "Martes",
        "miercoles": "Miércoles",
        "miércoles": "Miércoles",
        "jueves": "Jueves",
        "viernes": "Viernes",
        "sabado": "Sábado",
        "sábado": "Sábado",
    }
    return mapa.get(t_low, t)


def normalizar_comuna(t: str) -> str:
    """
    Normaliza el nombre de la comuna o corregimiento.

    Por ahora solo unifica el caso de 'Río Las Ceibas', pero se puede ampliar
    con más reglas de normalización.

    Args:
        t (str): Texto original de la comuna/corregimiento.

    Returns:
        str or None: Nombre normalizado o None si la entrada es vacía.
    """
    if not t:
        return None
    t_strip = t.strip()
    t_low = t_strip.lower()

    if "las ceibas" in t_low:
        return "Río Las Ceibas"

    return t_strip


def normalizar_caracteristica_victima(t: str) -> str:
    """
    Normaliza las características de la víctima a categorías homogéneas.

    Agrupa descripciones libres en etiquetas como:
        - "Conductor de moto"
        - "Conductor de vehículo"
        - "Pasajero de moto"
        - "Pasajero de vehículo"
        - "Peatón"

    Args:
        t (str): Texto libre original de la característica de la víctima.

    Returns:
        str or None: Descripción normalizada o None si la entrada es vacía.
    """
    if not t:
        return None
    s = t.strip().lower()

    if "conductor" in s and "moto" in s:
        return "Conductor de moto"
    if "conductor" in s and ("vehiculo" in s or "vehículo" in s):
        return "Conductor de vehículo"
    if "pasajero" in s and "moto" in s:
        return "Pasajero de moto"
    if "pasajero" in s and ("vehiculo" in s or "vehículo" in s):
        return "Pasajero de vehículo"
    if "peaton" in s or "peatón" in s:
        return "Peatón"

    return t.strip()


def insertar_registros(registros):
    """
    Inserta en la tabla `muertes_accidentes` los registros ya descargados y normalizados.

    Para cada registro:
        - Se parsean fecha y hora.
        - Se normalizan día de la semana, comuna, clase de accidente y características.
        - Se calcula año y mes.
        - Se almacena el JSON completo en `fuente_raw` para trazabilidad.

    Args:
        registros (list[dict]): Lista de registros tal como se reciben desde Datos Abiertos.
    """
    conn = get_db_connection()
    cur = conn.cursor()

    sql = """
        INSERT INTO muertes_accidentes (
            id_registro,
            fecha_del_hecho,
            dia_de_la_semana,
            hora_del_hecho,
            comuna_corregimiento,
            tipo_de_via_de_hechos,
            clase_de_accidente,
            genero,
            edad,
            caracteristicas_de_la_victima,
            vehiculo_de_la_victima,
            vehiculo_2_de_la_contraparte,
            vehiculo_3_de_la_contraparte,
            vehiculo_4_de_la_contraparte,
            ano,
            mes,
            fuente_raw
        )
        VALUES (
            %(id_registro)s,
            %(fecha_del_hecho)s,
            %(dia_de_la_semana)s,
            %(hora_del_hecho)s,
            %(comuna_corregimiento)s,
            %(tipo_de_via_de_hechos)s,
            %(clase_de_accidente)s,
            %(genero)s,
            %(edad)s,
            %(caracteristicas_de_la_victima)s,
            %(vehiculo_de_la_victima)s,
            %(vehiculo_2_de_la_contraparte)s,
            %(vehiculo_3_de_la_contraparte)s,
            %(vehiculo_4_de_la_contraparte)s,
            %(ano)s,
            %(mes)s,
            %(fuente_raw)s
        );
    """

    count = 0
    for r in registros:
        # Fecha principal
        fecha_del_hecho_raw = r.get("fecha_del_hecho")
        fecha_del_hecho, ano, mes = parse_fecha(fecha_del_hecho_raw)

        # Hora
        hora_raw = r.get("hora_del_hecho_hh_mm")
        hora_del_hecho = parse_hora(hora_raw)

        # Edad
        edad_raw = r.get("edad", "")
        try:
            edad = int(edad_raw)
        except (TypeError, ValueError):
            edad = None

        fila = {
            "id_registro": r.get("id"),
            "fecha_del_hecho": fecha_del_hecho,
            "dia_de_la_semana": normalizar_dia_semana(r.get("dia_de_la_semana")),
            "hora_del_hecho": hora_del_hecho,
            "comuna_corregimiento": normalizar_comuna(r.get("comuna_corregimiento")),
            "tipo_de_via_de_hechos": r.get("tipo_de_via_de_hechos"),
            "clase_de_accidente": normalizar_clase_accidente(r.get("clase_de_accidente")),
            "genero": r.get("genero"),
            "edad": edad,
            "caracteristicas_de_la_victima": normalizar_caracteristica_victima(r.get("caracter_sticas_de_la_victima")),
            "vehiculo_de_la_victima": r.get("vehiculo_de_la_victima"),
            "vehiculo_2_de_la_contraparte": r.get("vehiculo_2_de_la_contraparte"),
            "vehiculo_3_de_la_contraparte": r.get("vehiculo_3_de_la_contraparte"),
            "vehiculo_4_de_la_contraparte": r.get("vehiculo_4_de_la_contraparte"),
            "ano": ano,
            "mes": mes,
            "fuente_raw": Json(r),
        }

        cur.execute(sql, fila)
        count += 1
        if count % 100 == 0:
            print(f"Registros insertados: {count}")

    conn.commit()
    cur.close()
    conn.close()
    print(f"✅ Inserción finalizada. Total registros insertados: {count}")

def normalizar_clase_accidente(texto: str) -> str:
    """
    Normaliza la descripción de la clase de accidente a categorías predefinidas.

    Ejemplos de mapeo:
        - "colision ... objeto móvil" -> "Colisión con objeto móvil"
        - "colision ... objeto fijo"  -> "Colisión con objeto fijo"
        - "caida de ocupante"        -> "Caída de ocupante"
        - "peaton atropellado"       -> "Peatón atropellado"
        - "ciclista atropellado"     -> "Ciclista atropellado"
        - "otra clase de accidente"  -> "Otra clase de accidente"
        - "sin dato/sin datos"       -> "Sin dato"

    Args:
        texto (str): Descripción original de la clase de accidente.

    Returns:
        str or None: Cadena normalizada o None si la entrada es vacía.
    """
    if not texto:
        return None

    t = texto.strip().lower()

    # Colisión con objeto móvil
    if "colision" in t or "colisión" in t:
        if "objeto" in t and "mov" in t:
            return "Colisión con objeto móvil"
        if "objeto" in t and "fijo" in t:
            return "Colisión con objeto fijo"

    # Caída de ocupante
    if "caida de ocupante" in t or "caída de ocupante" in t:
        return "Caída de ocupante"

    # Peatón atropellado
    if "peatón atropellado" in t or "peaton atropellado" in t:
        return "Peatón atropellado"

    # Ciclista atropellado
    if "ciclista atropellado" in t:
        return "Ciclista atropellado"

    # Otra clase de accidente
    if "otra clase de accidente" in t:
        return "Otra clase de accidente"

    # Sin dato
    if t in ("sin dato", "sin datos"):
        return "Sin dato"

    # Si no se reconoce, se deja igual
    return texto


if __name__ == "__main__":
    # Punto de entrada cuando se ejecuta el script directamente.
    # Descarga los datos desde Datos Abiertos y los inserta en la base.
    data = descargar_datos()
    if data:
        insertar_registros(data)
    else:
        print("No se recibieron registros.")
