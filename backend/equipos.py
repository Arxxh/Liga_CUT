from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from typing import List
from sqlalchemy.orm import Session

from backend.database import SessionLocal
from backend.models import Equipo as EquipoDB

router = APIRouter()

# Modelo Pydantic para validación
class Equipo(BaseModel):
    id: int
    nombre: str
    num_jugadores: int
    logo: str

    class Config:
        orm_mode = True  # <-- Esto lo agregamos para que funcione bien con SQLAlchemy

# Dependencia para obtener la sesión
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Listar equipos
@router.get("/", response_model=List[Equipo])
def listar_equipos(db: Session = Depends(get_db)):
    return db.query(EquipoDB).all()

# Obtener equipo por ID
@router.get("/{equipo_id}", response_model=Equipo)
def obtener_equipo(equipo_id: int, db: Session = Depends(get_db)):
    equipo = db.query(EquipoDB).filter(EquipoDB.id == equipo_id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")
    return equipo

# Agregar equipo
@router.post("/", response_model=Equipo)
def agregar_equipo(equipo: Equipo, db: Session = Depends(get_db)):
    existente = db.query(EquipoDB).filter(
        (EquipoDB.id == equipo.id) | (EquipoDB.nombre == equipo.nombre)
    ).first()
    if existente:
        raise HTTPException(status_code=400, detail="ID o nombre ya existe")
    nuevo = EquipoDB(**equipo.dict())
    db.add(nuevo)
    db.commit()
    db.refresh(nuevo)
    return nuevo

# Actualizar equipo
@router.put("/{equipo_id}", response_model=Equipo)
def actualizar_equipo(equipo_id: int, datos: Equipo, db: Session = Depends(get_db)):
    equipo = db.query(EquipoDB).filter(EquipoDB.id == equipo_id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")
    for key, value in datos.dict().items():
        setattr(equipo, key, value)
    db.commit()
    db.refresh(equipo)
    return equipo

# Eliminar equipo
@router.delete("/{equipo_id}")
def eliminar_equipo(equipo_id: int, db: Session = Depends(get_db)):
    equipo = db.query(EquipoDB).filter(EquipoDB.id == equipo_id).first()
    if not equipo:
        raise HTTPException(status_code=404, detail="Equipo no encontrado")
    db.delete(equipo)
    db.commit()
    return {"message": "Equipo Eliminado"}
