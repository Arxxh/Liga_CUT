from fastapi import FastAPI
from auth.controller import router as auth_router
from panel.controller import router as panel_router


def register_routers(app: FastAPI):
    app.include_router(auth_router)
    app.include_router(panel_router)