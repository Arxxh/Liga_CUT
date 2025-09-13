from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api import register_routers
from database.sessions import SessionLocal
from panel.startup_seed import ensure_panel_access_seed
from dotenv import load_dotenv
from contextlib import asynccontextmanager


load_dotenv()  # Cargar variables de entorno desde el archivo .env

@asynccontextmanager
async def lifespan(app: FastAPI):
    # === startup ===
    async with SessionLocal() as db:
        await ensure_panel_access_seed(db)

    yield  # <- aquí se ejecuta la app mientras corre

    # === shutdown ===
    # si necesitas limpiar algo, lo pones aquí
    # ej: cerrar conexiones externas, liberar recursos, etc.


app = FastAPI(
    description="Documentacion automatica de mi microservicio para la autenticacion de usuario y permisos",
    title="Permisos_Microservicio_Por_Diego: AUTH:Service",
    summary="Login, Register, panel de administracion de permisos"
)


"""configuracion CORS"""
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"], # todos los metodos (get, post, put, delete)
    allow_headers=["*"], # todos los headers (Content-Type, Authorization, etc.
)

# importacion de rutas (uso de api router)

register_routers(app)
