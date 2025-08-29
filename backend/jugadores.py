from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List

router = APIRouter()

# Modelo de datos
class Jugador(BaseModel):
    id: int
    nombre: str
    posicion: str
    dorsal: int
    goles: int = 0

# "Base de datos" en memoria
jugadores = []

# ------------------ ENDPOINTS ------------------ #

@router.get("/", response_model=List[Jugador])
def listar_jugadores():
    return jugadores

@router.get("/{jugador_id}", response_model=Jugador)
def obtener_jugador(jugador_id: int):
    for j in jugadores:
        if j.id == jugador_id:
            return j
    raise HTTPException(status_code=404, detail="Jugador no encontrado")

@router.post("/", response_model=Jugador)
def agregar_jugador(jugador: Jugador):
    for j in jugadores:
        if j.id == jugador.id:
            raise HTTPException(status_code=400, detail="ID ya existe")
        if j.dorsal == jugador.dorsal:
            raise HTTPException(status_code=400, detail="Dorsal ya en uso")
    jugadores.append(jugador)
    return jugador

@router.put("/{jugador_id}", response_model=Jugador)
def actualizar_jugador(jugador_id: int, datos: Jugador):
    for i, j in enumerate(jugadores):
        if j.id == jugador_id:
            jugadores[i] = datos
            return datos
    raise HTTPException(status_code=404, detail="Jugador no encontrado")

@router.delete("/{jugador_id}")
def eliminar_jugador(jugador_id: int):
    for i, j in enumerate(jugadores):
        if j.id == jugador_id:
            jugadores.pop(i)
            return {"message": "Jugador eliminado"}
    raise HTTPException(status_code=404, detail="Jugador no encontrado")

@router.post("/{jugador_id}/gol")
def registrar_gol(jugador_id: int):
    for j in jugadores:
        if j.id == jugador_id:
            j.goles += 1
            return {"message": f"Gol registrado para {j.nombre}", "total_goles": j.goles}
    raise HTTPException(status_code=404, detail="Jugador no encontrado")
