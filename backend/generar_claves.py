"""
Script auxiliar para generar hashes seguros de contraseñas utilizando
`werkzeug.security.generate_password_hash`.

Este archivo NO forma parte de los endpoints del backend. Se usa únicamente
para crear los hashes que se insertarán manualmente en la tabla `usuarios`
(o en los scripts SQL de carga de datos).

Ejemplo de uso:
    python generar_claves.py

Esto imprimirá en consola los hashes correspondientes a las contraseñas
predefinidas, listos para copiar y pegar en la base de datos.

Motivación:
    - Nunca se deben almacenar contraseñas en texto plano.
    - El backend utiliza `check_password_hash` para validarlas durante el login.
"""
from werkzeug.security import generate_password_hash

# Generar hashes de algunas contraseñas base para usuarios del sistema
print("admin123  =>", generate_password_hash("admin123"))
print("consulta  =>", generate_password_hash("consulta"))
print("usuario1  =>", generate_password_hash("usuario1"))
