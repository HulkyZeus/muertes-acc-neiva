from flask import Flask, jsonify, request, send_file, session
from flask_cors import CORS
import psycopg2
import pandas as pd
import os
from io import BytesIO
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet 
from reportlab.lib import colors
from werkzeug.security import check_password_hash


app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
app.config["SECRET_KEY"] = os.environ.get(
    "FLASK_SECRET_KEY",
    "dev-secret-key-cambia-esto-por-otro-string"
)

CORS(
    app,
    supports_credentials=True,
    resources={
        r"/api/*": {
            "origins": [
                "http://192.168.64.2:5173",
                "http://localhost:5173",
            ]
        }
    }
)
def get_db_connection():
    conn = psycopg2.connect(
        dbname="muertes_acc_neiva",
        user="neiva_user",
        password="neiva123",
        host="localhost",
        port=5432,
    )
    return conn
@app.get("/")
def index():
    return {
        "status": "ok",
        "message": "Backend Flask funcionando en Ubuntu Server 🚀"
    }
@app.get("/api/test-db")
def test_db():
    """
    Endpoint general: verifica conexión y devuelve conteo de usuarios y accidentes.
    """
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Conteo de usuarios
        cur.execute("SELECT COUNT(*) FROM usuarios;")
        total_usuarios = cur.fetchone()[0]

        # Conteo de accidentes
        cur.execute("SELECT COUNT(*) FROM muertes_accidentes;")
        total_accidentes = cur.fetchone()[0]

        cur.close()
        conn.close()

        return jsonify({
            "db_status": "ok",
            "total_usuarios": total_usuarios,
            "total_accidentes": total_accidentes
        })
    except Exception as e:
        return jsonify({
            "db_status": "error",
            "details": str(e)
        }), 500
@app.get("/api/test-usuarios")
def test_usuarios():

    """
    Endpoint específico para probar la tabla 'usuarios'.
    """
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        cur.execute("SELECT COUNT(*) FROM usuarios;")
        total_usuarios = cur.fetchone()[0]

        cur.close()
        conn.close()

        return jsonify({
            "db_status": "ok",
            "total_usuarios": total_usuarios
        })
    except Exception as e:
        return jsonify({
            "db_status": "error",
            "details": str(e)
        }), 500


    data = request.get_json() or {}
    correo = data.get("email")
    password = data.get("password")

    if not correo or not password:
        return jsonify({"error": "missing_fields"}), 400

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT id, nombre, correo, password_hash, rol
        FROM usuarios
        WHERE correo = %s
    """, (correo,))
    row = cur.fetchone()

    cur.close()
    conn.close()

    if not row:
        return jsonify({"error": "email_not_found"}), 404

    id, nombre, correo, password_hash, rol = row

    # Validación contraseña
    if not check_password_hash(password_hash, password):
        return jsonify({"error": "invalid_password"}), 401

    # Guardar sesión (Flask session)
    session["id"] = id
    session["rol"] = rol

    return jsonify({
        "message": "login_ok",
        "user": {
            "id": id,
            "nombre": nombre,
            "correo": correo_db,
            "rol": rol
        }
    }), 200
@app.get("/api/test-accidentes")
def test_accidentes():
    """
    Endpoint específico para probar la tabla 'muertes_accidentes'.
    """
    try:
        conn = get_db_connection()
        cur = conn.cursor()

        cur.execute("SELECT COUNT(*) FROM muertes_accidentes;")
        total_accidentes = cur.fetchone()[0]

        cur.close()
        conn.close()

        return jsonify({
            "db_status": "ok",
            "total_accidentes": total_accidentes
        })
    except Exception as e:
        return jsonify({
            "db_status": "error",
            "details": str(e)
        }), 500

@app.post("/api/login")
def login():
    data = request.get_json() or {}
    correo = data.get("email")
    password = data.get("password")

    if not correo or not password:
        return jsonify({"error": "missing_fields"}), 400

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT id, nombre, correo, password_hash, rol
        FROM usuarios
        WHERE correo = %s
    """, (correo,))
    row = cur.fetchone()

    cur.close()
    conn.close()

    if not row:
        return jsonify({"error": "email_not_found"}), 404

    user_id, nombre, correo_db, password_hash, rol = row

    if not check_password_hash(password_hash, password):
        return jsonify({"error": "invalid_password"}), 401

    # 👇 Aquí se guarda la sesión
    session["id"] = user_id
    session["rol"] = rol

    print("SESSION AL HACER LOGIN:", dict(session))  # para depurar en consola

    return jsonify({
        "message": "login_ok",
        "user": {
            "id": user_id,
            "nombre": nombre,
            "correo": correo_db,
            "rol": rol
        }
    }), 200

@app.post("/api/logout")
def logout():
    # Elimina toda la sesión
    session.clear()

    return jsonify({
        "message": "logout_ok"
    }), 200

def require_login():
    print("SESSION EN require_login:", dict(session))
    return "id" in session


@app.get("/api/accidentes")
def listar_accidentes():
    """
    Lista de accidentes con todos los filtros opcionales:
    - anio (ano)
    - comuna (comuna_corregimiento)
    - genero
    - clase (clase_de_accidente)
    - fecha_desde (Formato: YYYY-MM-DD)
    - fecha_hasta (Formato: YYYY-MM-DD)
    - limite (limit de registros, por defecto 100)
    """
   
    comuna = request.args.get("comuna_corregimiento")
    tipo_via = request.args.get("tipo_via")
    fecha_desde = request.args.get("fecha_desde")
    fecha_hasta = request.args.get("fecha_hasta")

    condiciones = []
    params = []

    # Construcción de condiciones (Solo se añaden si el parámetro existe)
    
    if comuna:
        condiciones.append("comuna_corregimiento = %s")
        params.append(comuna)

    if tipo_via:
        condiciones.append("tipo_de_via_de_hechos = %s")
        params.append(tipo_via)


    if fecha_desde:
        condiciones.append("fecha_del_hecho >= %s")
        params.append(fecha_desde)

    if fecha_hasta:
        condiciones.append("fecha_del_hecho <= %s")
        params.append(fecha_hasta)


    query = """
        SELECT
            id,
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
            vehiculo_4_de_la_contraparte
        FROM muertes_accidentes
    """

    if condiciones:
        query += " WHERE " + " AND ".join(condiciones)

    query += " ORDER BY fecha_del_hecho ASC "

    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(query, params)
    rows = cur.fetchall()
    cur.close()
    conn.close()

    # Convertir a lista de diccionarios
    columnas = [
        "id",
        "fecha_del_hecho",
        "dia_de_la_semana",
        "hora_del_hecho",
        "comuna_corregimiento",
        "tipo_de_via_de_hechos",
        "clase_de_accidente",
        "genero",
        "edad",
        "caracteristicas_de_la_victima",
        "vehiculo_de_la_victima",
        "vehiculo_2_de_la_contraparte",
        "vehiculo_3_de_la_contraparte",
        "vehiculo_4_de_la_contraparte",
    ]

    resultados = []
    for row in rows:
        item = {}
        for col, val in zip(columnas, row):
            # Convertir datetime/time a string para que sea JSON serializable
            if hasattr(val, "isoformat"):
                item[col] = val.isoformat()
            else:
                item[col] = val
        resultados.append(item)

    return jsonify({
        "total": len(resultados),
        "items": resultados
    })

@app.get("/api/estadisticas/por-anio")
def estadisticas_por_anio():
    """
    Devuelve total de accidentes por año (ano).
    """
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT 
            EXTRACT(YEAR FROM fecha_del_hecho) AS ano, 
            COUNT(*) AS total
        FROM 
            muertes_accidentes
        GROUP BY 
            ano
        ORDER BY 
            ano;
    """)
    rows = cur.fetchall()
    cur.close()
    conn.close()

    data = [{"ano": r[0], "total": r[1]} for r in rows]
    return jsonify(data)
@app.get("/api/estadisticas/por-comuna")
def estadisticas_por_comuna():
    """
    Devuelve total de accidentes por comuna_corregimiento.
    """
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT
            comuna_corregimiento,
            COUNT(*) AS total
        FROM muertes_accidentes
        GROUP BY comuna_corregimiento
        ORDER BY comuna_corregimiento;
    """)
    rows = cur.fetchall()
    cur.close()
    conn.close()

    data = [
        {"comuna_corregimiento": r[0], "total": r[1]}
        for r in rows
        if r[0] is not None
    ]
    return jsonify(data)
@app.get("/api/estadisticas/por-clase-accidente")
def estadisticas_por_clase():
    """
    Devuelve total de accidentes por clase_de_accidente.
    """
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT
            clase_de_accidente,
            COUNT(*) AS total
        FROM muertes_accidentes
        GROUP BY clase_de_accidente
        ORDER BY total DESC;
    """)
    rows = cur.fetchall()
    cur.close()
    conn.close()

    data = [
        {"clase_de_accidente": r[0], "total": r[1]}
        for r in rows
        if r[0] is not None
    ]
    return jsonify(data)
@app.delete("/api/accidentes/<int:accidente_id>")
def eliminar_accidente(accidente_id):
    """
    Elimina un accidente por su id.
    Respuestas:
    - 204 No Content: eliminado correctamente
    - 404 Not Found: no existe el id
    - 500 Internal Server Error: fallo del servidor
    """
    if require_login():
        return jsonify({"error": "not_authenticated"}), 401
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        # Usamos RETURNING para saber si se eliminó alguna fila
        cur.execute("DELETE FROM muertes_accidentes WHERE id = %s RETURNING id;", (accidente_id,))
        deleted = cur.fetchone()
        if deleted is None:
            # no existe
            cur.close()
            conn.close()
            return jsonify({"status": "not_found", "message": f"Registro con id {accidente_id} no encontrado."}), 404

        # commit y cerrar
        conn.commit()
        cur.close()
        conn.close()
        # 204 es común para DELETE exitoso sin cuerpo; puedes devolver 200 con JSON si prefieres
        return ('', 204)
    except Exception as e:
        # loguea el error y devuelve 500
        # en producción evita devolver detalles internos
        try:
            if 'cur' in locals() and not cur.closed:
                cur.close() 
            if 'conn' in locals():
                conn.close()
        except:
            pass
        return jsonify({"status": "error", "details": str(e)}), 500

@app.post("/api/accidentes")
def crear_accidente():
    """
    Crea un nuevo registro de accidente en la tabla muertes_accidentes.
    Espera un JSON con los campos:
    - fecha_del_hecho (YYYY-MM-DD)
    - dia_de_la_semana
    - hora_del_hecho (HH:MM o HH:MM:SS)
    - comuna_corregimiento
    - tipo_de_via_de_hechos
    - clase_de_accidente
    - genero
    - edad
    - caracteristicas_de_la_victima
    - vehiculo_de_la_victima
    - vehiculo_2_de_la_contraparte (opcional)
    - vehiculo_3_de_la_contraparte (opcional)
    - vehiculo_4_de_la_contraparte (opcional)
    """
    data = request.get_json() or {}

    campos_obligatorios = [
        "fecha_del_hecho",
        "dia_de_la_semana",
        "hora_del_hecho",
        "comuna_corregimiento",
        "tipo_de_via_de_hechos",
        "clase_de_accidente",
        "genero",
        "edad",
        "caracteristicas_de_la_victima",
        "vehiculo_de_la_victima"
    ]

    for campo in campos_obligatorios:
        if campo not in data or data[campo] in (None, ""):
            return jsonify({"error": f"Falta el campo obligatorio: {campo}"}), 400

    # Valores opcionales (pueden venir vacíos)
    v2 = data.get("vehiculo_2_de_la_contraparte") or None
    v3 = data.get("vehiculo_3_de_la_contraparte") or None
    v4 = data.get("vehiculo_4_de_la_contraparte") or None

    try:
        conn = get_db_connection()
        cur = conn.cursor()

        query = """
            INSERT INTO muertes_accidentes (
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
                vehiculo_4_de_la_contraparte
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING id;
        """

        params = (
            data["fecha_del_hecho"],
            data["dia_de_la_semana"],
            data["hora_del_hecho"],
            data["comuna_corregimiento"],
            data["tipo_de_via_de_hechos"],
            data["clase_de_accidente"],
            data["genero"],
            int(data["edad"]),
            data["caracteristicas_de_la_victima"],
            data["vehiculo_de_la_victima"],
            v2,
            v3,
            v4,
        )

        cur.execute(query, params)
        nuevo_id = cur.fetchone()[0]
        conn.commit()
        cur.close()
        conn.close()

        return jsonify({
            "id": nuevo_id,
            "message": "Accidente creado correctamente"
        }), 201

    except Exception as e:
        # Si tienes trigger que exige id_usuario, aquí verás el error
        print("Error al insertar accidente:", e)
        return jsonify({"error": "Error interno al crear el accidente"}), 500
@app.put("/api/accidentes/<int:accidente_id>")
def actualizar_accidente(accidente_id):
    """
    Actualiza un registro de accidente en la tabla muertes_accidentes.

    Espera un JSON con los campos:
    - fecha_del_hecho (YYYY-MM-DD)
    - dia_de_la_semana
    - hora_del_hecho (HH:MM o HH:MM:SS)
    - comuna_corregimiento
    - tipo_de_via_de_hechos
    - clase_de_accidente
    - genero
    - edad
    - caracteristicas_de_la_victima
    - vehiculo_de_la_victima
    - vehiculo_2_de_la_contraparte
    - vehiculo_3_de_la_contraparte
    - vehiculo_4_de_la_contraparte
    """
    data = request.get_json() or {}

    campos_obligatorios = [
        "fecha_del_hecho",
        "dia_de_la_semana",
        "hora_del_hecho",
        "comuna_corregimiento",
        "tipo_de_via_de_hechos",
        "clase_de_accidente",
        "genero",
        "edad",
        "caracteristicas_de_la_victima",
        "vehiculo_de_la_victima",
        "vehiculo_2_de_la_contraparte",
        "vehiculo_3_de_la_contraparte",
        "vehiculo_4_de_la_contraparte",
    ]

    # Validación básica de campos obligatorios
    for campo in campos_obligatorios:
        if campo not in data or data[campo] in (None, ""):
            return jsonify({"error": f"Falta el campo obligatorio: {campo}"}), 400

    try:
        conn = get_db_connection()
        cur = conn.cursor()

        query = """
            UPDATE muertes_accidentes
            SET
                fecha_del_hecho = %s,
                dia_de_la_semana = %s,
                hora_del_hecho = %s,
                comuna_corregimiento = %s,
                tipo_de_via_de_hechos = %s,
                clase_de_accidente = %s,
                genero = %s,
                edad = %s,
                caracteristicas_de_la_victima = %s,
                vehiculo_de_la_victima = %s,
                vehiculo_2_de_la_contraparte = %s,
                vehiculo_3_de_la_contraparte = %s,
                vehiculo_4_de_la_contraparte = %s
            WHERE id = %s
            RETURNING id;
        """

        params = (
            data["fecha_del_hecho"],          # YYYY-MM-DD (str)
            data["dia_de_la_semana"],         # str
            data["hora_del_hecho"],           # HH:MM o HH:MM:SS (str)
            data["comuna_corregimiento"],     # str o número según tu diseño
            data["tipo_de_via_de_hechos"],    # str
            data["clase_de_accidente"],       # str
            data["genero"],                   # str
            int(data["edad"]),                # int
            data["caracteristicas_de_la_victima"],
            data["vehiculo_de_la_victima"],
            data["vehiculo_2_de_la_contraparte"],
            data["vehiculo_3_de_la_contraparte"],
            data["vehiculo_4_de_la_contraparte"],
            accidente_id,
        )

        cur.execute(query, params)
        fila = cur.fetchone()

        # Si no se actualizó ninguna fila => id no existe
        if not fila:
            conn.rollback()
            cur.close()
            conn.close()
            return jsonify({"error": "Accidente no encontrado"}), 404

        conn.commit()
        cur.close()
        conn.close()

        return jsonify({
            "id": fila[0],
            "message": "Accidente actualizado correctamente"
        }), 200

    except Exception as e:
        print("Error al actualizar accidente:", e)
        # Si usas triggers que exigen id_usuario, aquí verías el error
        return jsonify({"error": "Error interno al actualizar el accidente"}), 500
# --- Función de Utilidad ---
def obtener_datos_accidentes(filtros):
    # Asume que 'filtros' es un diccionario con todos los query params
    
    condiciones = []
    params = []
    print
    
    if filtros.get('fecha_desde'):
        print("Filtro fecha_desde:", filtros['fecha_desde'])
        condiciones.append("fecha_del_hecho >= %s")
        params.append(filtros['fecha_desde'])

    if filtros.get('fecha_hasta'):
        print("Filtro fecha_hasta:", filtros['fecha_hasta'])
        condiciones.append("fecha_del_hecho <= %s")
        params.append(filtros['fecha_hasta'])
    
    if filtros.get('comuna_corregimiento'):
        condiciones.append("comuna_corregimiento = %s")
        params.append(filtros['comuna_corregimiento'])

    if filtros.get('tipo_via'):
        condiciones.append("tipo_de_via_de_hechos = %s")
        params.append(filtros['tipo_via'])



    # A diferencia de la API GET, NO aplicamos LÍMITE para exportación, 
    # queremos todos los datos que cumplen los filtros.
    query = """
        SELECT
            id,
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
            vehiculo_4_de_la_contraparte
        FROM muertes_accidentes
    """

    if condiciones:
        query += " WHERE " + " AND ".join(condiciones)

    query += " ORDER BY fecha_del_hecho ASC" # No LIMI
    # Ejecución de la consulta...
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(query, params)
    rows = cur.fetchall()
    
    # ... (Lógica para obtener las columnas y convertir 'rows' a 'resultados' list[dict]) ...
    # Convertir a lista de diccionarios
    columnas = [
        "id",
        "fecha_del_hecho",
        "dia_de_la_semana",
        "hora_del_hecho",
        "comuna_corregimiento",
        "tipo_de_via_de_hechos",
        "clase_de_accidente",
        "genero",
        "edad",
        "caracteristicas_de_la_victima",
        "vehiculo_de_la_victima",
        "vehiculo_2_de_la_contraparte",
        "vehiculo_3_de_la_contraparte",
        "vehiculo_4_de_la_contraparte",
    ]

    resultados = []
    for row in rows:
        item = {}
        for col, val in zip(columnas, row):
            # Convertir datetime/time a string para que sea JSON serializable
            if hasattr(val, "isoformat"):
                item[col] = val.isoformat()
            else:
                item[col] = val
        resultados.append(item)

    cur.close()
    conn.close()
    return resultados # Debe devolver una lista de diccionarios

TITULO_REPORTE = "Muertes Accidentes Tránsito del municipio de Neiva"

def formatear_filtros(filtros: dict) -> list[tuple]:
    """Convierte los parámetros de filtro de la URL a una lista de tuplas legible."""
    filtros_legibles = []
    
    # Mapeo de nombres técnicos a nombres legibles en español
    nombre_mapeo = {
        'anio': 'Año',
        'comuna_corregimiento': 'Comuna/Corregimiento',
        'tipo_via': 'Tipo de Vía',
        'genero': 'Género',
        'clase': 'Clase de Accidente',
        'fecha_desde': 'Fecha Desde',
        'fecha_hasta': 'Fecha Hasta',
    }
    
    for key, value in filtros.items():
        # Excluir los parámetros de control (formato, limite)
        if key in nombre_mapeo and value and key not in ['formato', 'limite']:
            filtros_legibles.append((nombre_mapeo.get(key, key.capitalize()), str(value)))
            
    return filtros_legibles
@app.get("/api/exportar")
def exportar_datos():
    formato = request.args.get("formato", "").lower()
    
    # Obtener todos los filtros de la URL como un diccionario
    filtros = request.args.to_dict(flat=True)
    
    # 1. Obtener los datos (la función obtener_datos_accidentes debe manejar los filtros)
    # NOTA: Asegúrate de que obtener_datos_accidentes esté definida y devuelva list[dict]
    datos = obtener_datos_accidentes(filtros)
    
    if not datos:
        return jsonify({"error": "No hay datos para exportar con los filtros proporcionados."}), 404

    # --- LÓGICA DE EXPORTACIÓN ---

    if formato == "excel":
        
        output = BytesIO()
        with pd.ExcelWriter(output, engine='xlsxwriter') as writer:
            
            # --- Hoja 1: Metadatos y Filtros ---
            filtros_legibles = formatear_filtros(filtros)
            
            metadata = [
                ["Título del Reporte", TITULO_REPORTE],
                ["Fecha de Exportación", pd.Timestamp.now().strftime("%Y-%m-%d %H:%M:%S")],
                ["", ""]
            ]
            if filtros_legibles:
                metadata.append(["Filtros Aplicados:", ""])
                metadata.extend(filtros_legibles)

            df_metadata = pd.DataFrame(metadata, columns=["Propiedad", "Valor"])
            df_metadata.to_excel(writer, sheet_name='Metadatos', index=False)
            
            # --- Hoja 2: Datos de Accidentes ---
            df = pd.DataFrame(datos)
            
            # ❗ Renombrar columnas: quitar '_' y capitalizar
            column_mapping = {col: col.replace('_', ' ').title() for col in df.columns}
            df = df.rename(columns=column_mapping)
            
            df.to_excel(writer, index=False, sheet_name='Registros')
        
        output.seek(0)

        return send_file(
            output,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            download_name='accidentes_neiva_exportado.xlsx', 
            as_attachment=True 
        )

    elif formato == "pdf":
        
        pdf_buffer = generar_pdf(datos, filtros) 
        
        return send_file(
            pdf_buffer,
            mimetype='application/pdf',
            download_name='accidentes_neiva_exportado.pdf',
            as_attachment=True
        )

    else:
        return jsonify({"error": "Formato no soportado. Use 'excel' o 'pdf'."}), 400
    formato = request.args.get("formato", "").lower()
    
    # Recolectar todos los filtros de la URL para pasarlos a la función de datos
    filtros = dict(request.args)
    
    # 1. Obtener los datos sin límites
    datos = obtener_datos_accidentes(filtros)
    if not datos:
        return jsonify({"error": "No hay datos para exportar con los filtros proporcionados."}), 404

    # --- LÓGICA DE EXPORTACIÓN ---

    if formato == "excel":
        # Usar Pandas para la conversión
        df = pd.DataFrame(datos)
        output = BytesIO()
        writer = pd.ExcelWriter(output, engine='xlsxwriter')
        df.to_excel(writer, index=False, sheet_name='Accidentes')
        writer.close() # o writer.save() dependiendo de la versión
        output.seek(0)

       
        return send_file(
            output,
            mimetype='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            download_name='accidentes.xlsx', # El nombre del archivo que verá el usuario
            as_attachment=True # Indica al navegador que la respuesta es un archivo para descargar
        )

    elif formato == "pdf":
        pdf_buffer = generar_pdf(datos) 
        
        # ❗ Devolver el archivo PDF
        return send_file(
            pdf_buffer,
            mimetype='application/pdf',
            download_name='accidentes.pdf',
            as_attachment=True
        )

    else:
        return jsonify({"error": "Formato no soportado. Use 'excel' o 'pdf'."}), 400

def generar_pdf(datos, filtros_aplicados):
    buffer = BytesIO()
    # Definición del documento PDF
    doc = SimpleDocTemplate(buffer, pagesize=letter,
                            title=TITULO_REPORTE,
                            topMargin=50, bottomMargin=50)
    styles = getSampleStyleSheet()
    elements = []
    
    # 1. TÍTULO DEL DOCUMENTO
    elements.append(Paragraph(f'<font size=16>{TITULO_REPORTE}</font>', styles['Title']))
    elements.append(Spacer(1, 12))

    # 2. FILTROS APLICADOS (Metadatos)
    filtros_legibles = formatear_filtros(filtros_aplicados)
    if filtros_legibles:
        elements.append(Paragraph('<font size=12><b>Filtros Aplicados:</b></font>', styles['Heading3']))
        
        # Crear tabla para los filtros
        filtro_data = [('Filtro', 'Valor')]
        filtro_data.extend(filtros_legibles)
        
        filtro_table = Table(filtro_data, colWidths=[150, 300])
        filtro_style = TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.Color(0.8, 0.8, 0.8)),
            ('GRID', (0, 0), (-1, -1), 1, colors.Color(0.5, 0.5, 0.5)),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTSIZE', (0, 0), (-1, -1), 10),
        ])
        filtro_table.setStyle(filtro_style)
        elements.append(filtro_table)
        elements.append(Spacer(1, 18))
        
    # 3. DATOS DE LA TABLA
    elements.append(Paragraph('<font size=12><b>Detalle de Registros:</b></font>', styles['Heading3']))
    
    columnas_a_incluir = [
        'fecha_del_hecho', 'tipo_de_via_de_hechos', 'comuna_corregimiento', 
        'clase_de_accidente', 'genero', 'edad'
    ]
    
    # Cabeceras sin guion bajo
    cabeceras = [col.replace('_', ' ').title() for col in columnas_a_incluir]
    
    # Datos de la tabla
    data_table = [cabeceras]
    for item in datos:
        # Asegurarse de que solo las columnas seleccionadas se añaden
        row = [str(item.get(col, 'N/A')) for col in columnas_a_incluir]
        data_table.append(row)

    # Crear tabla de datos
    table = Table(data_table)
    # Estilo de la tabla de datos
    style = TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.Color(0.2, 0.2, 0.2)),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 6),
        ('GRID', (0, 0), (-1, -1), 0.5, colors.black),
        ('FONTSIZE', (0, 0), (-1, -1), 8),
    ])
    table.setStyle(style)
    elements.append(table)
    
    # Construir el PDF
    doc.build(elements)
    buffer.seek(0)
    return buffer
if __name__ == "__main__":
    # Solo para modo desarrollo
    app.run(host="0.0.0.0", port=5000, debug=True)
