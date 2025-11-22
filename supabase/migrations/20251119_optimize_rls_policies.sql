-- Migration: Optimize RLS policies for performance
-- Created: 2025-11-19
-- Description: Replaces auth.uid() with (SELECT auth.uid()) in RLS policies to prevent re-evaluation per row
-- Reference: https://supabase.com/docs/guides/database/postgres/row-level-security#call-functions-with-select
-- Impact: Significantly improves query performance at scale

-- ============================================
-- PROFILES TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own profile" ON public.profiles;
CREATE POLICY "Users can view own profile"
ON public.profiles FOR SELECT
USING ((SELECT auth.uid()) = id);

DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
CREATE POLICY "Users can update own profile"
ON public.profiles FOR UPDATE
USING ((SELECT auth.uid()) = id);

-- ============================================
-- USER_SUBSCRIPTIONS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own subscription" ON public.user_subscriptions;
CREATE POLICY "Users can view own subscription"
ON public.user_subscriptions FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own subscription" ON public.user_subscriptions;
CREATE POLICY "Users can update own subscription"
ON public.user_subscriptions FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own subscription" ON public.user_subscriptions;
CREATE POLICY "Users can insert own subscription"
ON public.user_subscriptions FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

-- ============================================
-- CUSTOM_DECKS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view their own decks" ON public.custom_decks;
CREATE POLICY "Users can view their own decks"
ON public.custom_decks FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can create their own decks" ON public.custom_decks;
CREATE POLICY "Users can create their own decks"
ON public.custom_decks FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update their own decks" ON public.custom_decks;
CREATE POLICY "Users can update their own decks"
ON public.custom_decks FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can delete their own decks" ON public.custom_decks;
CREATE POLICY "Users can delete their own decks"
ON public.custom_decks FOR DELETE
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- CUSTOM_QUESTIONS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view questions in their decks" ON public.custom_questions;
CREATE POLICY "Users can view questions in their decks"
ON public.custom_questions FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.custom_decks
    WHERE custom_decks.id = custom_questions.deck_id
    AND custom_decks.user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Users can create questions in their decks" ON public.custom_questions;
CREATE POLICY "Users can create questions in their decks"
ON public.custom_questions FOR INSERT
WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.custom_decks
    WHERE custom_decks.id = custom_questions.deck_id
    AND custom_decks.user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Users can update questions in their decks" ON public.custom_questions;
CREATE POLICY "Users can update questions in their decks"
ON public.custom_questions FOR UPDATE
USING (
  EXISTS (
    SELECT 1 FROM public.custom_decks
    WHERE custom_decks.id = custom_questions.deck_id
    AND custom_decks.user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Users can delete questions in their decks" ON public.custom_questions;
CREATE POLICY "Users can delete questions in their decks"
ON public.custom_questions FOR DELETE
USING (
  EXISTS (
    SELECT 1 FROM public.custom_decks
    WHERE custom_decks.id = custom_questions.deck_id
    AND custom_decks.user_id = (SELECT auth.uid())
  )
);

-- ============================================
-- AI_GENERATED_DECKS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own AI decks" ON public.ai_generated_decks;
CREATE POLICY "Users can view own AI decks"
ON public.ai_generated_decks FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can create own AI decks" ON public.ai_generated_decks;
CREATE POLICY "Users can create own AI decks"
ON public.ai_generated_decks FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own AI decks" ON public.ai_generated_decks;
CREATE POLICY "Users can update own AI decks"
ON public.ai_generated_decks FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can delete own AI decks" ON public.ai_generated_decks;
CREATE POLICY "Users can delete own AI decks"
ON public.ai_generated_decks FOR DELETE
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- AI_GENERATION_LOGS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own generation logs" ON public.ai_generation_logs;
CREATE POLICY "Users can view own generation logs"
ON public.ai_generation_logs FOR SELECT
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- SPARK_USAGE TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view their own spark usage" ON public.spark_usage;
CREATE POLICY "Users can view their own spark usage"
ON public.spark_usage FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert their own spark usage" ON public.spark_usage;
CREATE POLICY "Users can insert their own spark usage"
ON public.spark_usage FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update their own spark usage" ON public.spark_usage;
CREATE POLICY "Users can update their own spark usage"
ON public.spark_usage FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- SPARK_QUESTIONS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view their own spark questions" ON public.spark_questions;
CREATE POLICY "Users can view their own spark questions"
ON public.spark_questions FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert their own spark questions" ON public.spark_questions;
CREATE POLICY "Users can insert their own spark questions"
ON public.spark_questions FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update their own spark questions" ON public.spark_questions;
CREATE POLICY "Users can update their own spark questions"
ON public.spark_questions FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can delete their own spark questions" ON public.spark_questions;
CREATE POLICY "Users can delete their own spark questions"
ON public.spark_questions FOR DELETE
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- PANDORA_PARTICIPANTS TABLE
-- ============================================

DROP POLICY IF EXISTS "delete_self_leave" ON public.pandora_participants;
CREATE POLICY "delete_self_leave"
ON public.pandora_participants FOR DELETE
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "delete_host_kick_debug" ON public.pandora_participants;
CREATE POLICY "delete_host_kick_debug"
ON public.pandora_participants FOR DELETE
USING (
  EXISTS (
    SELECT 1 FROM public.pandora_sessions
    WHERE pandora_sessions.id = pandora_participants.session_id
    AND pandora_sessions.host_user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "insert_join_sessions" ON public.pandora_participants;
CREATE POLICY "insert_join_sessions"
ON public.pandora_participants FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

-- ============================================
-- PANDORA_REACTIONS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can insert their own reactions" ON public.pandora_reactions;
CREATE POLICY "Users can insert their own reactions"
ON public.pandora_reactions FOR INSERT
WITH CHECK (
  EXISTS (
    SELECT 1 FROM public.pandora_participants
    WHERE pandora_participants.id = pandora_reactions.participant_id
    AND pandora_participants.user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Users can delete their own reactions" ON public.pandora_reactions;
CREATE POLICY "Users can delete their own reactions"
ON public.pandora_reactions FOR DELETE
USING (
  EXISTS (
    SELECT 1 FROM public.pandora_participants
    WHERE pandora_participants.id = pandora_reactions.participant_id
    AND pandora_participants.user_id = (SELECT auth.uid())
  )
);

DROP POLICY IF EXISTS "Users can update their own reactions" ON public.pandora_reactions;
CREATE POLICY "Users can update their own reactions"
ON public.pandora_reactions FOR UPDATE
USING (
  EXISTS (
    SELECT 1 FROM public.pandora_participants
    WHERE pandora_participants.id = pandora_reactions.participant_id
    AND pandora_participants.user_id = (SELECT auth.uid())
  )
);

-- ============================================
-- SESSION_ANALYTICS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own session analytics" ON public.session_analytics;
CREATE POLICY "Users can view own session analytics"
ON public.session_analytics FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own session analytics" ON public.session_analytics;
CREATE POLICY "Users can insert own session analytics"
ON public.session_analytics FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own session analytics" ON public.session_analytics;
CREATE POLICY "Users can update own session analytics"
ON public.session_analytics FOR UPDATE
USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- CUSTOM_EVENTS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can view own events" ON public.custom_events;
CREATE POLICY "Users can view own events"
ON public.custom_events FOR SELECT
USING ((SELECT auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own events" ON public.custom_events;
CREATE POLICY "Users can insert own events"
ON public.custom_events FOR INSERT
WITH CHECK ((SELECT auth.uid()) = user_id);

-- ============================================
-- QUESTION_RATINGS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can manage their own question ratings" ON public.question_ratings;
CREATE POLICY "Users can manage their own question ratings"
ON public.question_ratings
USING ((SELECT auth.uid()) = user_id)
WITH CHECK ((SELECT auth.uid()) = user_id);

-- ============================================
-- DECK_RATINGS TABLE
-- ============================================

DROP POLICY IF EXISTS "Users can manage their own deck ratings" ON public.deck_ratings;
CREATE POLICY "Users can manage their own deck ratings"
ON public.deck_ratings
USING ((SELECT auth.uid()) = user_id)
WITH CHECK ((SELECT auth.uid()) = user_id);
