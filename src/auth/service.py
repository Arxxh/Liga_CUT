from __future__ import annotations

from dotenv import load_dotenv
import os
from datetime import datetime, timedelta, timezone
from typing import Optional
from jose import jwt, JWTError # token 
from passlib.context import CryptContext # hash
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from exceptions import UserAlreadyExistsError, InvalidCredentialsError, WeakPasswordError

from auth.models import User

load_dotenv()  # Cargar variables de entorno desde el archivo .env

SECRET_KEY = str(os.getenv("SECRET_KEY"))
ALGORITHM = str(os.getenv("ALGORITHM"))
ACCESS_TOKEN_EXPIRE_MINUTES = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES"))

_pwd_ctx = CryptContext(schemes=["bcrypt"], deprecated="auto")




# funciones de utilidad para el manejo de usuarios, passwords y emails

def normalize_email(email: str) -> str:
    return email.strip().lower()

def validate_password(password: str) -> None:
    """
    Aplica reglas mínimas de seguridad a las contraseñas.
    Lanza WeakPasswordError si no cumple.
    """
    if len(password) < 8:
        raise WeakPasswordError("La contraseña debe tener al menos 8 caracteres")
    if password.isnumeric():
        raise WeakPasswordError("La contraseña no puede ser solo números")
    # aquí puedes agregar más reglas (mayúsculas, símbolos, etc.)

"""
Hasheo de passwords
"""

def hash_password(password: str) -> str:
    """Devuelve el hash seguro de la contraseña."""
    return _pwd_ctx.hash(password)

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Verifica que la contraseña en texto plano coincida con el hash."""
    return _pwd_ctx.verify(plain_password, hashed_password)


"""
JWT encode y decode
"""

def create_access_token(claims: dict, expires_minutes: Optional[int] = None) -> str:
    to_encode = claims.copy()
    expire = datetime.now(timezone.utc) + timedelta(
        minutes=expires_minutes or ACCESS_TOKEN_EXPIRE_MINUTES
    )
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
# encode token

def decode_token(token: str) -> dict:
    return jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
# decode token

"""
Helpers de DB y AUTH para reutilzizar en panel y auth
"""
# helper de auth
async def get_user_by_email(db: AsyncSession, email: str) -> Optional[User]:
    res = await db.execute(select(User).where(User.email == normalize_email(email)))
    return res.scalar_one_or_none()

# helper de auth
async def create_user(db: AsyncSession, email: str, password: str) -> User:
    # validaciones
    if await get_user_by_email(db, email):
        raise UserAlreadyExistsError()
    validate_password(password)
    # crear usuario
    user = User(email=normalize_email(email), hashed_password=hash_password(password))
    db.add(user)
    await db.commit()
    await db.refresh(user)
    return user

# helper de auth 
async def authenticate_user(db: AsyncSession, email: str, password: str) -> Optional[User]:
    user = await get_user_by_email(db, email)
    if not user or not verify_password(password, user.hashed_password) or not user.is_active:
        raise InvalidCredentialsError()
    return user

# helper de auth
async def issue_token_for_user(user: User) -> str:
    claims = {"sub": str(user.id), "email": user.email}
    return create_access_token(claims)
