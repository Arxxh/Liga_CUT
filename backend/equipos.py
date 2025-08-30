from  fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List

router = APIRouter()

#MODSLEO DEL EQUIPO

class Equipo(BaseModel):
    id: int
    nombre: str
    num_jugadores: int
    logo: str 


# base de datos
equipos = []

#endpoints

@router.get("/", response_model=List[Equipo])
def listar_equipos():
    return equipos


@router.get("/{equipo_id}", response_model=Equipo)
def obtener_equipo(equipo_id: int):
    for e in equipos:
        if e.id == equipo_id:
            return e
    raise HTTPException(status_code=404, detail="Equipo no encontrado")

@router.post("/", response_model=Equipo)
def agregar_equipo(equipo: Equipo):
    for e in equipos:
        if e.id == equipo.id:
            raise HTTPException(status_code=400, detail="ID de equipo ya existente")
        if e.nombre.lower() == equipo.nombre.lower():
            raise HTTPException(status_code=400, detail="Este nombre ya se esta usando")
    equipos.append(equipo)
    return equipo

@router.put("/{equipo_id}", response_model=Equipo)
def actualizar_equipo(equipo_id: int, datos: Equipo):
    for i, e in enumerate(equipos):
        if e.id == equipo_id:
            equipos[i] = datos
            return datos
    raise HTTPException(status_code=404, detail="Equipo no encontrado")

@router.delete("/{equipo_id}")
def eliminar_equipo(equipo_id: int):
    for i, e in enumerate(equipos):
        if e.id == equipo_id:
            equipos.pop(i)
            return {"message": "Equipo Eliminado"}
    raise HTTPException(status_code=400, detail="Equipo no encontrado")