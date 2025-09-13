from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from database.sessions import get_db
from auth.dependencies import get_current_user

router = APIRouter(prefix="/admin", tags=["admin"])

async def require_panel_access(
    current_user = Depends(get_current_user),
    db: AsyncSession = Depends(get_db),
):
    if not any(p.name == "admin:panel.access" for p in current_user.permissions):
        from fastapi import HTTPException, status
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Forbidden")
    return current_user

@router.get("/dashboard", dependencies=[Depends(require_panel_access)])
async def dashboard():
    return {"ok": True}
