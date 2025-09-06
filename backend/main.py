from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.database import Base, engine
from backend import models
from backend.jugadores import router as jugadores_router
from backend.equipos import router as equipos_router

# Crear las tablas en la BD
Base.metadata.create_all(bind=engine)

# Inicializar aplicación
app = FastAPI(title="Microservicio Liga - UDG Tonalá")

# Configuración CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Incluir rutas
app.include_router(jugadores_router, prefix="/jugadores", tags=["Jugadores"])
app.include_router(equipos_router, prefix="/equipos", tags=["Equipos"])

Base.metadata.create_all(bind=engine)


