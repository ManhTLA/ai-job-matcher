from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List

router = APIRouter()

class Job(BaseModel):
    id: int
    title: str
    company: str
    description: str
    salary: str

@router.get("/", response_model=List[Job])
async def get_jobs(skip: int = 0, limit: int = 10):
    # TODO: Fetch from database
    return [
        {
            "id": 1,
            "title": "Senior Python Developer",
            "company": "TechCorp",
            "description": "Looking for experienced Python developer",
            "salary": "$80k - $120k"
        }
    ]

@router.get("/{job_id}", response_model=Job)
async def get_job(job_id: int):
    # TODO: Fetch from database
    return {
        "id": job_id,
        "title": "Senior Python Developer",
        "company": "TechCorp",
        "description": "Looking for experienced Python developer",
        "salary": "$80k - $120k"
    }

@router.post("/")
async def create_job(job: Job):
    # TODO: Save to database
    return {"id": 1, **job.dict()}
