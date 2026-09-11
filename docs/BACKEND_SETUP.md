# Backend Setup Guide

## 1. Cài đặt Python dependencies

```bash
cd backend
pip install -r requirements.txt
```

## 2. Tạo file .env

```bash
cp .env.example .env
```

## 3. Setup Database

```bash
# Tạo database
createdb ai_job_matcher

# Run migrations
alembic upgrade head
```

## 4. Chạy server

```bash
python -m uvicorn app.main:app --reload
```

Server sẽ chạy tại: http://localhost:8000

## 5. API Docs

- Swagger: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc
