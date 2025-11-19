-- Migration: Remove unused database objects
-- Created: 2025-11-19
-- Description: Drops unused view and table identified during codebase cleanup

-- Drop ai_decks_as_custom view (never queried in Dart code)
DROP VIEW IF EXISTS public.ai_decks_as_custom;

-- Drop pandora_session_stats table (no Dart references found)
DROP TABLE IF EXISTS public.pandora_session_stats;

-- Note: Keeping ai_generation_logs table as it may be used by Edge Functions for logging
-- Note: Keeping convert_ai_deck_to_custom function as it has minimal maintenance cost
