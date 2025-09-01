from pydantic import BaseModel, EmailStr, Field

# Autenticacion
class UserCreate(BaseModel): # POST auth/register
    email: str
    password: str = Field(min_length=6, max_length=128)

class UserLogin(BaseModel): # POST auth/login
    email: str
    password: str

# token bearer JWT
class Token(BaseModel): 
    access_token: str
    token_type: str = "bearer"

# Usuario
class UserRead(BaseModel):
    id: int
    email: EmailStr
    is_active: bool

    class Config:
        from_attributes = True  # Pydantic v2 (antes: orm_mode=True)


# Permisos


