import requests
import json

URL = "https://www.datos.gov.co/resource/2vxy-7tvy.json?$limit=1"

resp = requests.get(URL)
resp.raise_for_status()
data = resp.json()

print("Cantidad de registros recibidos:", len(data))
if data:
    print("Campos del primer registro:")
    print(json.dumps(data[0], indent=2, ensure_ascii=False))
