CREATE TABLE agent_logs (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW(),
    question TEXT,
    intent VARCHAR(50),
    confidence NUMERIC,
    selected_agent VARCHAR(100),
    response TEXT
);