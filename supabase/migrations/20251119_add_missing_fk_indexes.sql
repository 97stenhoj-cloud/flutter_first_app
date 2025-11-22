-- Migration: Add missing foreign key indexes for performance
-- Created: 2025-11-19
-- Description: Adds indexes on foreign key columns to improve JOIN query performance
-- Reference: https://supabase.com/docs/guides/database/database-linter?lint=0001_unindexed_foreign_keys

-- Add index on deck_ratings.user_id
CREATE INDEX IF NOT EXISTS idx_deck_ratings_user_id
ON public.deck_ratings(user_id);

-- Add index on pandora_questions.participant_id
CREATE INDEX IF NOT EXISTS idx_pandora_questions_participant_id
ON public.pandora_questions(participant_id);

-- Add index on pandora_questions.target_participant_id
CREATE INDEX IF NOT EXISTS idx_pandora_questions_target_participant_id
ON public.pandora_questions(target_participant_id);

-- Add index on pandora_sessions.host_user_id
CREATE INDEX IF NOT EXISTS idx_pandora_sessions_host_user_id
ON public.pandora_sessions(host_user_id);

-- Add index on question_ratings.user_id
CREATE INDEX IF NOT EXISTS idx_question_ratings_user_id
ON public.question_ratings(user_id);

-- Analyze tables to update statistics after creating indexes
ANALYZE public.deck_ratings;
ANALYZE public.pandora_questions;
ANALYZE public.pandora_sessions;
ANALYZE public.question_ratings;
