"""
Script auxiliar para inspeccionar la estructura del dataset de Datos Abiertos
(2vxy-7tvy: Muertes por accidentes de tránsito - Municipio de Neiva).

Este módulo realiza una petición HTTP al API de datos.gov.co, solicitando solo
1 registro (`$limit=1`), con el fin de imprimir en consola:
    - La cantidad de registros recibidos (1 si la API responde correctamente)
    - La estructura completa del primer registro (campos y valores)

Su propósito principal es:
    ✔ Identificar rápidamente los nombres exactos de los campos del dataset
    ✔ Verificar cambios en los atributos publicados por la API
    ✔ Apoyar el proceso de mapeo y normalización de campos en los scripts del backend

Uso típico:
    python ver_campos_neiva.py

Salida esperada:
    Cantidad de registros recibidos: 1
    Campos del primer registro:
    { ... estructura JSON completa ... }
"""
import requests
import json

# Endpoint con límite 1 para inspección rápida
URL = "https://www.datos.gov.co/resource/2vxy-7tvy.json?$limit=1"

# Realizar petición al API
resp = requests.get(URL)
resp.raise_for_status() # Genera error si ocurre un 4xx o 5xx
data = resp.json()

print("Cantidad de registros recibidos:", len(data))
if data:
    print("Campos del primer registro:")
    print(json.dumps(data[0], indent=2, ensure_ascii=False))
