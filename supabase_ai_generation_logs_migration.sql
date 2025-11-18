-- AI Generation Logs Migration
-- This migration creates the ai_generation_logs table for tracking AI generation usage

CREATE TABLE IF NOT EXISTS ai_generation_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    generation_prompts JSONB NOT NULL,
    batch_number INT NOT NULL DEFAULT 1,
    questions_generated INT NOT NULL,
    status TEXT NOT NULL, -- 'success' or 'error'
    error_message TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create indexes for analytics queries
CREATE INDEX idx_ai_generation_logs_user_id ON ai_generation_logs(user_id);
CREATE INDEX idx_ai_generation_logs_created_at ON ai_generation_logs(created_at DESC);
CREATE INDEX idx_ai_generation_logs_status ON ai_generation_logs(status);

-- Enable Row Level Security
ALTER TABLE ai_generation_logs ENABLE ROW LEVEL SECURITY;

-- RLS Policies - users can only see their own logs
CREATE POLICY "Users can view own generation logs" ON ai_generation_logs
    FOR SELECT
    USING (auth.uid() = user_id);

-- Allow the service role to insert logs (for edge functions)
CREATE POLICY "Service role can insert logs" ON ai_generation_logs
    FOR INSERT
    WITH CHECK (true);

-- Grant permissions
GRANT ALL ON ai_generation_logs TO authenticated;
GRANT ALL ON ai_generation_logs TO service_role;
