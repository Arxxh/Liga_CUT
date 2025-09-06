# Liga_CUT/src/auth/controller.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from database.sessions import get_db
from auth.schemas import UserCreate, UserRead, UserLogin, Token
from auth.service import (
    get_user_by_email,
    create_user,
    authenticate_user,
    issue_token_for_user,
    validate_password,
) # HELPERS, validate_password es una funcion para el minimo de contraseña

"""
se esta manejando desde el backend que el email sea
en minusculas y la password tenga un minimo de 8 caracteres
"""

router = APIRouter(prefix="/auth", tags=["auth"])


# -----------------------------
# Register
# -----------------------------
@router.post("/register", response_model=UserRead, status_code=status.HTTP_201_CREATED)
async def register(payload: UserCreate, db: AsyncSession = Depends(get_db)):
    # verificar duplicado
    existing_user = await get_user_by_email(db, payload.email)
    if existing_user:
        raise HTTPException(status_code=409, detail="Email already registered")

    # crear usuario (con validación de password)
    try:
        user = await create_user(db, payload.email, payload.password)
    except ValueError as e:
        raise HTTPException(status_code=422, detail=str(e))

    return user

@router.post("/login", response_model=Token)
async def login(payload: UserLogin, db: AsyncSession = Depends(get_db)):
    user = await authenticate_user(db, payload.email, payload.password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password",
            headers={"WWW-Authenticate": "Bearer"},
        )

    access_token = await issue_token_for_user(user)
    return {"access_token": access_token, "token_type": "bearer"}


