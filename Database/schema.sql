-- Enable pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- ============================
-- Vector Store
-- ============================

CREATE TABLE mira_documents_v2 (
    id BIGSERIAL PRIMARY KEY,
    content TEXT,
    metadata JSONB,
    embedding VECTOR(1536)
);

-- ============================
-- Audit Log
-- ============================

CREATE TABLE agent_logs (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW(),
    question TEXT,
    intent VARCHAR(50),
    confidence NUMERIC,
    selected_agent VARCHAR(100),
    response TEXT
);