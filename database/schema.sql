-- Users table (for authentication)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255),
    user_type VARCHAR(50), -- 'student', 'employer'
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Students profile
CREATE TABLE student_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE,
    major VARCHAR(255),
    gpa DECIMAL(3, 2),
    graduation_date DATE,
    skills TEXT[], -- Array of skills
    bio TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- CVs
CREATE TABLE cvs (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    file_path VARCHAR(255),
    filename VARCHAR(255),
    parsed_data JSONB, -- Stored parsed CV data
    uploaded_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (student_id) REFERENCES student_profiles(id) ON DELETE CASCADE
);

-- Employers
CREATE TABLE employers (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE,
    company_name VARCHAR(255),
    industry VARCHAR(255),
    website VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Job postings
CREATE TABLE job_postings (
    id SERIAL PRIMARY KEY,
    employer_id INTEGER NOT NULL,
    title VARCHAR(255),
    description TEXT,
    requirements TEXT,
    skills_required TEXT[], -- Array of required skills
    salary_min INTEGER,
    salary_max INTEGER,
    location VARCHAR(255),
    job_type VARCHAR(50), -- 'full-time', 'part-time', 'internship'
    posted_at TIMESTAMP DEFAULT NOW(),
    deadline DATE,
    views INTEGER DEFAULT 0,
    FOREIGN KEY (employer_id) REFERENCES employers(id) ON DELETE CASCADE
);

-- Matches between CVs and Job postings
CREATE TABLE cv_job_matches (
    id SERIAL PRIMARY KEY,
    cv_id INTEGER NOT NULL,
    job_id INTEGER NOT NULL,
    match_score DECIMAL(5, 2), -- 0-100
    matched_skills TEXT[], -- Skills that match
    matched_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES job_postings(id) ON DELETE CASCADE
);

-- Applications
CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    job_id INTEGER NOT NULL,
    cv_id INTEGER,
    status VARCHAR(50), -- 'applied', 'reviewed', 'accepted', 'rejected'
    cover_letter TEXT,
    applied_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (student_id) REFERENCES student_profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES job_postings(id) ON DELETE CASCADE,
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE SET NULL
);

-- Create indexes for performance
CREATE INDEX idx_student_user ON student_profiles(user_id);
CREATE INDEX idx_cv_student ON cvs(student_id);
CREATE INDEX idx_job_employer ON job_postings(employer_id);
CREATE INDEX idx_match_cv ON cv_job_matches(cv_id);
CREATE INDEX idx_match_job ON cv_job_matches(job_id);
CREATE INDEX idx_application_student ON applications(student_id);
CREATE INDEX idx_application_job ON applications(job_id);
