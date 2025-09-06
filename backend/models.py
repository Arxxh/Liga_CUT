from sqlalchemy import Column, Integer, String
from .database import Base

class Equipo(Base):
    __tablename__ = "equipos"
    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String, unique=True, nullable=False)
    num_jugadores = Column(Integer, nullable=False)
    logo = Column(String)

class Jugador(Base):
    __tablename__ = "jugadores"
    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String, nullable=False)
    posicion = Column(String, nullable=False)
    dorsal = Column(Integer, nullable=False, unique=True)
    goles = Column(Integer, default=0)
