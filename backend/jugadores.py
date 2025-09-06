from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from typing import List
from sqlalchemy.orm import Session

from backend.database import SessionLocal
from backend.models import Jugador as JugadorDB

router = APIRouter()

class Jugador(BaseModel):
    id: int
    nombre: str
    posicion: str
    dorsal: int
    goles: int = 0
    class Config:
        orm_mode = True

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/", response_model=List[Jugador])
def listar_jugadores(db: Session = Depends(get_db)):
    return db.query(JugadorDB).all()

@router.get("/{jugador_id}", response_model=Jugador)
def obtener_jugador(jugador_id: int, db: Session = Depends(get_db)):
    jugador = db.query(JugadorDB).filter(JugadorDB.id == jugador_id).first()
    if not jugador:
        raise HTTPException(status_code=404, detail="Jugador no encontrado")
    return jugador

@router.post("/", response_model=Jugador)
def agregar_jugador(jugador: Jugador, db: Session = Depends(get_db)):
    existe = db.query(JugadorDB).filter(
        (JugadorDB.id == jugador.id) | (JugadorDB.dorsal == jugador.dorsal)
    ).first()
    if existe:
        raise HTTPException(status_code=400, detail="ID o dorsal ya existe")
    nuevo = JugadorDB(**jugador.dict())
    db.add(nuevo)
    db.commit()
    db.refresh(nuevo)
    return nuevo

@router.put("/{jugador_id}", response_model=Jugador)
def actualizar_jugador(jugador_id: int, datos: Jugador, db: Session = Depends(get_db)):
    jugador = db.query(JugadorDB).filter(JugadorDB.id == jugador_id).first()
    if not jugador:
        raise HTTPException(status_code=404, detail="Jugador no encontrado")
    for key, value in datos.dict().items():
        setattr(jugador, key, value)
    db.commit()
    db.refresh(jugador)
    return jugador

@router.delete("/{jugador_id}")
def eliminar_jugador(jugador_id: int, db: Session = Depends(get_db)):
    jugador = db.query(JugadorDB).filter(JugadorDB.id == jugador_id).first()
    if not jugador:
        raise HTTPException(status_code=404, detail="Jugador no encontrado")
    db.delete(jugador)
    db.commit()
    return {"message": "Jugador eliminado"}

@router.post("/{jugador_id}/gol")
def registrar_gol(jugador_id: int, db: Session = Depends(get_db)):
    jugador = db.query(JugadorDB).filter(JugadorDB.id == jugador_id).first()
    if not jugador:
        raise HTTPException(status_code=404, detail="Jugador no encontrado")
    jugador.goles += 1
    db.commit()
    db.refresh(jugador)
    return {"message": f"Gol registrado para {jugador.nombre}", "total_goles": jugador.goles}
