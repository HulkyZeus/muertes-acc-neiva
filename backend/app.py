from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

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
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT COUNT(*) FROM usuarios;")
        total = cur.fetchone()[0]
        cur.close()
        conn.close()
        return jsonify({
            "db_status": "ok",
            "total_usuarios": total
        })
    except Exception as e:
        return jsonify({
            "db_status": "error",
            "details": str(e)
        }), 500

if __name__ == "__main__":
    # Solo para modo desarrollo
    app.run(host="0.0.0.0", port=5000, debug=True)
