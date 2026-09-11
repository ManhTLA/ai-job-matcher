# AI Job Matcher System 🎯

Hệ thống AI lọc hồ sơ CV và tuyên dụng cho sinh viên tìm kiếm việc làm.

## 📋 Tính năng chính

- **Parse CV**: Phân tích tự động hồ sơ từ file PDF/DOC
- **Job Matching**: Khớp CV với job postings phù hợp
- **Smart Filter**: Lọc nhà tuyển dụng dựa trên kỹ năng & kinh nghiệm
- **Dashboard**: Giao diện thân thiện cho sinh viên & HR
- **AI Ranking**: Xếp hạng độ phù hợp bằng ML

## 🏗️ Project Structure

```
ai-job-matcher/
├── backend/                 # FastAPI backend
│   ├── app/
│   │   ├── api/            # API routes
│   │   ├── models/         # Database models
│   │   ├── schemas/        # Pydantic schemas
│   │   ├── services/       # Business logic
│   │   └── main.py
│   ├── ai/                 # AI/ML models
│   │   ├── cv_parser.py
│   │   ├── job_matcher.py
│   │   └── embeddings.py
│   ├── requirements.txt
│   └── .env.example
├── frontend/               # React frontend
│   ├── src/
│   ├── package.json
│   └── .env.example
├── database/               # Database scripts
│   └── schema.sql
├── docker-compose.yml      # Docker setup
├── .gitignore
└── docs/                   # Documentation

```

## 🛠️ Tech Stack

- **Backend**: FastAPI, Python 3.10+
- **Frontend**: React 18, TailwindCSS
- **Database**: PostgreSQL
- **AI/ML**: PyTorch, Hugging Face Transformers
- **Docker**: Containerization
- **Authentication**: JWT

## 📦 Cài đặt yêu cầu

### Để chạy được project cần cài:

1. **Python 3.10+**
   ```bash
   python --version  # Kiểm tra version
   ```

2. **Node.js & npm**
   ```bash
   node --version
   npm --version
   ```

3. **Docker & Docker Compose**
   ```bash
   docker --version
   docker-compose --version
   ```

4. **PostgreSQL** (hoặc dùng Docker)
   ```bash
   psql --version
   ```

5. **Git**
   ```bash
   git --version
   ```

## 🚀 Quick Start

### 1. Clone repository
```bash
git clone https://github.com/ManhTLA/ai-job-matcher.git
cd ai-job-matcher
```

### 2. Setup Backend
```bash
cd backend
pip install -r requirements.txt
cp .env.example .env
python -m uvicorn app.main:app --reload
```

### 3. Setup Frontend
```bash
cd ../frontend
npm install
npm start
```

### 4. Setup Database (với Docker)
```bash
docker-compose up -d
```

## 📚 Documentation

- [Backend Setup](./docs/BACKEND_SETUP.md)
- [Frontend Setup](./docs/FRONTEND_SETUP.md)
- [Database Schema](./database/schema.sql)
- [API Documentation](./docs/API.md)

## 🤝 Contributing

Mở issue hoặc PR nếu bạn có ý tưởng!

## 📄 License

MIT License
