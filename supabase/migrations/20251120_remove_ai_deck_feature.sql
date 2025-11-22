-- Migration: Remove AI Deck Generator Feature
-- Date: 2025-11-20
-- Reason: Feature removed to reduce API costs and simplify codebase
--         Spark Mode with usage limits is the primary AI feature

-- Drop RLS policies for ai_generated_decks
DROP POLICY IF EXISTS "Users can view own AI decks" ON ai_generated_decks;
DROP POLICY IF EXISTS "Users can create own AI decks" ON ai_generated_decks;
DROP POLICY IF EXISTS "Users can update own AI decks" ON ai_generated_decks;
DROP POLICY IF EXISTS "Users can delete own AI decks" ON ai_generated_decks;

-- Drop RLS policies for ai_generation_logs
DROP POLICY IF EXISTS "Users can view own generation logs" ON ai_generation_logs;
DROP POLICY IF EXISTS "Service role can insert logs" ON ai_generation_logs;

-- Drop trigger for ai_generated_decks
DROP TRIGGER IF EXISTS update_ai_generated_decks_updated_at ON ai_generated_decks;

-- Drop function to convert AI deck to custom deck
DROP FUNCTION IF EXISTS convert_ai_deck_to_custom(UUID);

-- Drop tables (CASCADE will handle indexes and dependent objects)
DROP TABLE IF EXISTS ai_generated_decks CASCADE;
DROP TABLE IF EXISTS ai_generation_logs CASCADE;

-- Note: update_updated_at_column() function is shared with other tables, so not dropped here
