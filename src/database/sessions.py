# Liga_CUT/src/database/session.py
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Carga variables del .env (está en la raíz del microservicio)
load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")
if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL no está definida en el .env")

engine = create_engine(DATABASE_URL, future=True)
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)


# Dependencia para FastAPI
def get_db():
    """Dependency para FastAPI. 
    podemos exportar esta función y usarla en los endpoints como una dependiencia
    para tener acceso a la sesión de la base de datos.
    """
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
