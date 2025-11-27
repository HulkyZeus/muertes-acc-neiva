#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Archivo WSGI para desplegar el backend Flask del proyecto
"Muertes Accidentes Tránsito del municipio de Neiva" en un servidor Apache
mediante el módulo mod_wsgi.

Este archivo actúa como *punto de entrada del servidor web*, permitiendo que
Apache invoque la aplicación Flask como un WSGI application estándar.

No se usa en modo desarrollo (cuando se ejecuta `python app.py`), sino
exclusivamente cuando el proyecto corre en producción a través de Apache.
"""

import sys
import logging

# Configura logging básico para capturar errores desde Apache
logging.basicConfig(stream=sys.stderr)

# Agrega el directorio del backend al sys.path para que Python pueda encontrar app.py
# (Este path debe apuntar exactamente a la carpeta donde está app.py)
sys.path.insert(0, '/home/mjgaar/proyecto_neiva/backend')

# Importa la aplicación Flask y la expone como 'application', nombre requerido por WSGI
from app import app as application
