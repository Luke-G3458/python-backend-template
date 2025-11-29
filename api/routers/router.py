from fastapi import APIRouter

router = APIRouter(prefix="/route")

@router.get("/")
async def root():
    return {"message": "Hello from route"}