from fastapi import APIRouter, File, UploadFile, HTTPException
from pydantic import BaseModel
import os

router = APIRouter()

UPLOAD_DIR = "uploads/cv"

class CVResponse(BaseModel):
    filename: str
    message: str

@router.post("/upload")
async def upload_cv(file: UploadFile = File(...)):
    if not file.filename.endswith(".pdf"):
        raise HTTPException(status_code=400, detail="Only PDF files allowed")
    
    # Create upload directory if not exists
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    
    # Save file
    filepath = os.path.join(UPLOAD_DIR, file.filename)
    try:
        with open(filepath, "wb") as f:
            content = await file.read()
            f.write(content)
        return {
            "filename": file.filename,
            "message": "CV uploaded successfully"
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/list")
async def list_cvs():
    # TODO: List uploaded CVs
    cvs = []
    if os.path.exists(UPLOAD_DIR):
        cvs = os.listdir(UPLOAD_DIR)
    return {"cvs": cvs}

@router.post("/analyze/{cv_id}")
async def analyze_cv(cv_id: str):
    # TODO: Implement AI analysis
    return {
        "cv_id": cv_id,
        "skills": ["Python", "FastAPI", "SQL"],
        "experience": "5 years",
        "match_percentage": 85
    }
