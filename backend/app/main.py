from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv
import os

load_dotenv()

app = FastAPI(
    title="AI Job Matcher API",
    description="CV Filtering & Job Matching System",
    version="1.0.0"
)

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Health check endpoint
@app.get("/health")
async def health():
    return {"status": "ok", "message": "Backend is running!"}

# Root endpoint
@app.get("/")
async def root():
    return {"message": "Welcome to AI Job Matcher API"}

# Import and include routers
from app.routes import auth, jobs, cv

app.include_router(auth.router, prefix="/api/auth", tags=["auth"])
app.include_router(jobs.router, prefix="/api/jobs", tags=["jobs"])
app.include_router(cv.router, prefix="/api/cv", tags=["cv"])

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
