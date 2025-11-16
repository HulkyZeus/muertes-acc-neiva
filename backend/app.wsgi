#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import logging

logging.basicConfig(stream=sys.stderr)

# Agregar el backend al path
sys.path.insert(0, '/home/mjgaar/proyecto_neiva/backend')

from app import app as application
