from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI(
    description="Documentacion automatica de mi microservicio para la autenticacion de usuario y permisos",
    title="Permisos_Microservicio_Por_Diego: AUTH:Service",
    summary="Login, Register, panel de administracion de permisos"
)


"""configuracion CORS"""


 # Conexion con el frontend
origins = [
    "http://localhost",
    "http://localhost:8000",
    "http://localhost:3000",
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,

    allow_credentials=True,
    allow_methods=["*"], # todos los metodos (get, post, put, delete)
    allow_headers=["*"], # todos los headers (Content-Type, Authorization, etc.
)

# importacion de rutas (uso de api router)

