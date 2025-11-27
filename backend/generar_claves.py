from werkzeug.security import generate_password_hash

print("admin123  =>", generate_password_hash("admin123"))
print("consulta  =>", generate_password_hash("consulta"))
print("usuario1  =>", generate_password_hash("usuario1"))
