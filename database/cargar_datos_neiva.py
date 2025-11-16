#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import psycopg2
from psycopg2.extras import Json
from datetime import datetime

DB_NAME = "muertes_acc_neiva"
DB_USER = "neiva_user"
DB_PASSWORD = "neiva123"
DB_HOST = "localhost"
DB_PORT = 5432

DATA_URL = "https://www.datos.gov.co/resource/2vxy-7tvy.json?$limit=50000"


def get_db_connection():
    return psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT,
    )


def descargar_datos():
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
    """
    if not hora_str:
        return None
    try:
        dt = datetime.fromisoformat(hora_str.replace("Z", ""))
        return dt.time()
    except Exception:
        return None

def normalizar_dia_semana(t: str) -> str:
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
    if not t:
        return None
    t_strip = t.strip()
    t_low = t_strip.lower()

    if "las ceibas" in t_low:
        return "Río Las Ceibas"

    return t_strip


def normalizar_caracteristica_victima(t: str) -> str:
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
            "tipo_de_via_de_hechos": r.get("tipo_de_via_de_hechos")
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
    data = descargar_datos()
    if data:
        insertar_registros(data)
    else:
        print("No se recibieron registros.")
