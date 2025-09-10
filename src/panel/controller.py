from fastapi import APIRouter

router = APIRouter(
    prefix="/panel",
    tags=["panel"],
)

@router.get("/ping")
def ping():
    return {"ok": True, "service": "api", "version": "0.1.0"}