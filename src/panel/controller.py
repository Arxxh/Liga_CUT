from fastapi import APIRouter

router = APIRouter(
    prefix="/panel",
    tags=["panel"],
)

@router.get("/dashboard")
async def dashboard():
    return {"message": "Admin dashboard endpoint"}