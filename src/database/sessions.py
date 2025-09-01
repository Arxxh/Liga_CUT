# Liga_CUT/src/database/session.py
import os
from dotenv import load_dotenv
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession


# Carga variables del .env (está en la raíz del microservicio)
load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL_ASYNC")
if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL no está definida en el .env")

engine = create_async_engine(DATABASE_URL, future=True, echo=False)
SessionLocal = async_sessionmaker(bind=engine, class_=AsyncSession, expire_on_commit=False)


# Dependencia para FastAPI
async def get_db():
    """Dependency para FastAPI. 
    podemos exportar esta función y usarla en los endpoints como una dependiencia
    para tener acceso a la sesión de la base de datos.

    Nueva dependencia que se convierte en una función asíncrona.
    """
    async with SessionLocal() as session:
        yield session
