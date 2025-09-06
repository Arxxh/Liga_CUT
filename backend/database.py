from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# URL de conexión correcta
SQLALCHEMY_DATABASE_URL = "postgresql+psycopg2://postgres:oswaldo@localhost:5432/liga_cut"

# Crear motor de conexión
engine = create_engine(SQLALCHEMY_DATABASE_URL)

# Crear sesión
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Base para modelos
Base = declarative_base()
