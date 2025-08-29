from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.jugadores import router as jugadores_router

# Inicializar aplicación
app = FastAPI(title="Microservicio Jugadores - UDG Tonalá")

# Configuración CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Incluir rutas de jugadores
app.include_router(jugadores_router, prefix="/jugadores", tags=["Jugadores"])
