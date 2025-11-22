-- Migration: Fix function search path security vulnerability
-- Created: 2025-11-19
-- Description: Sets search_path on database functions to prevent search path hijacking attacks
-- Reference: https://supabase.com/docs/guides/database/database-linter?lint=0011_function_search_path_mutable

-- Fix cleanup_expired_spark_questions function
CREATE OR REPLACE FUNCTION public.cleanup_expired_spark_questions()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $function$
BEGIN
  DELETE FROM spark_questions
  WHERE expires_at < NOW();
END;
$function$;

-- Fix convert_ai_deck_to_custom function
CREATE OR REPLACE FUNCTION public.convert_ai_deck_to_custom(ai_deck_id uuid)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $function$
DECLARE
    new_deck_id UUID;
    ai_deck RECORD;
    question JSONB;
BEGIN
    -- Get the AI deck
    SELECT * INTO ai_deck FROM ai_generated_decks WHERE id = ai_deck_id;

    IF ai_deck IS NULL THEN
        RAISE EXCEPTION 'AI deck not found';
    END IF;

    -- Create a new custom deck
    INSERT INTO custom_decks (user_id, deck_name, is_favorites)
    VALUES (ai_deck.user_id, ai_deck.deck_name || ' (AI)', false)
    RETURNING id INTO new_deck_id;

    -- Copy all questions to custom_questions table
    FOR question IN SELECT * FROM jsonb_array_elements(ai_deck.questions)
    LOOP
        INSERT INTO custom_questions (deck_id, question_text, source_game_mode, source_category)
        VALUES (
            new_deck_id,
            question->>'question',
            'AI Generated',
            ai_deck.generation_prompts->>'occasion'
        );
    END LOOP;

    RETURN new_deck_id;
END;
$function$;

-- Fix get_spark_limit function
CREATE OR REPLACE FUNCTION public.get_spark_limit(p_user_id uuid)
RETURNS integer
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $function$
DECLARE
  v_tier TEXT;
BEGIN
  SELECT subscription_tier INTO v_tier
  FROM user_subscriptions
  WHERE user_id = p_user_id;

  RETURN CASE v_tier
    WHEN 'premium' THEN 150
    WHEN 'premium_plus' THEN 400
    ELSE 0
  END;
END;
$function$;

-- Fix get_spark_remaining function
CREATE OR REPLACE FUNCTION public.get_spark_remaining(p_user_id uuid)
RETURNS integer
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $function$
DECLARE
  v_limit INT;
  v_used INT;
BEGIN
  -- Get user's limit
  SELECT get_spark_limit(p_user_id) INTO v_limit;

  -- Get usage for current period
  SELECT COALESCE(questions_generated, 0) INTO v_used
  FROM spark_usage
  WHERE user_id = p_user_id
    AND period_end_date > NOW()
  ORDER BY period_start_date DESC
  LIMIT 1;

  RETURN GREATEST(v_limit - COALESCE(v_used, 0), 0);
END;
$function$;

-- Fix increment_category_usage function
CREATE OR REPLACE FUNCTION public.increment_category_usage(p_category text, p_game_mode text)
RETURNS void
LANGUAGE plpgsql
SET search_path = public, pg_temp
AS $function$
BEGIN
  INSERT INTO category_usage (category_name, game_mode, play_count, last_played)
  VALUES (p_category, p_game_mode, 1, NOW())
  ON CONFLICT (category_name, game_mode)
  DO UPDATE SET
    play_count = category_usage.play_count + 1,
    last_played = NOW(),
    updated_at = NOW();
END;
$function$;

-- Fix update_updated_at_column function
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = public, pg_temp
AS $function$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$function$;
