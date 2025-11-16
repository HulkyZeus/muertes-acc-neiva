from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
CORS(app)

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


@app.get("/api/accidentes")
def listar_accidentes():
    """
    Lista de accidentes con filtros opcionales:
    - anio (ano)
    - comuna (comuna_corregimiento)
    - genero
    - clase (clase_de_accidente)
    - limite (limit de registros, por defecto 100)
    """
    anio = request.args.get("anio")
    comuna = request.args.get("comuna")
    genero = request.args.get("genero")
    clase = request.args.get("clase")
    limite = request.args.get("limite", default=100, type=int)

    condiciones = []
    params = []

    if anio:
        condiciones.append("ano = %s")
        params.append(int(anio))

    if comuna:
        condiciones.append("comuna_corregimiento = %s")
        params.append(comuna)

    if genero:
        condiciones.append("genero = %s")
        params.append(genero)

    if clase:
        condiciones.append("clase_de_accidente = %s")
        params.append(clase)

    query = """
        SELECT
            id,
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
            vehiculo_de_la_victima
        FROM muertes_accidentes
    """

    if condiciones:
        query += " WHERE " + " AND ".join(condiciones)

    query += " ORDER BY fecha_del_hecho ASC LIMIT %s"
    params.append(limite)

    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(query, params)
    rows = cur.fetchall()
    cur.close()
    conn.close()

    # Convertir a lista de diccionarios
    columnas = [
        "id",
        "id_registro",
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
        SELECT ano, COUNT(*) AS total
        FROM muertes_accidentes
        GROUP BY ano
        ORDER BY ano;
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




if __name__ == "__main__":
    # Solo para modo desarrollo
    app.run(host="0.0.0.0", port=5000, debug=True)
