# Frontend Setup Guide

## 1. Cài đặt dependencies

```bash
cd frontend
npm install
```

## 2. Tạo .env file

```bash
cp .env.example .env
```

Thêm vào .env:
```
REACT_APP_API_URL=http://localhost:8000
```

## 3. Chạy development server

```bash
npm start
```

App sẽ mở tại: http://localhost:3000

## 4. Build production

```bash
npm run build
```
