from sqlalchemy.orm import DeclarativeBase


"""
clase la cual heredan todos los modelos en 
las distintas logicas del negocio o microservicio
"""

# exportamos a otros módulos (modelos)
class Base(DeclarativeBase):
    """Base común para todos los modelos."""
    pass