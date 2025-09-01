"""
aqui va todo el codigo de la autenticacion, login, registro, etc.
jwt, oauth2, etc.
SECRET_KEY, ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES ETC... 
utilizaremos .env donde estan las variables de entorno 
"""

from dotenv import load_dotenv
import os

load_dotenv()  # Cargar variables de entorno desde el archivo .env
