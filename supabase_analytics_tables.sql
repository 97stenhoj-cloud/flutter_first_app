-- Analytics Tables for Connect App
-- Run these SQL commands in your Supabase SQL editor

-- 1. Session Analytics Table
CREATE TABLE IF NOT EXISTS session_analytics (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  session_started TIMESTAMPTZ NOT NULL,
  session_ended TIMESTAMPTZ,
  session_duration_seconds INTEGER,
  game_mode TEXT NOT NULL,
  category TEXT NOT NULL,
  language TEXT NOT NULL,
  is_premium BOOLEAN DEFAULT false,
  questions_viewed INTEGER DEFAULT 0,
  questions_completed INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Question Analytics Table
CREATE TABLE IF NOT EXISTS question_analytics (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id UUID REFERENCES session_analytics(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  time_spent_seconds INTEGER NOT NULL,
  was_skipped BOOLEAN DEFAULT false,
  was_favorited BOOLEAN DEFAULT false,
  reaction_type TEXT,
  timestamp TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Category Usage Stats Table
CREATE TABLE IF NOT EXISTS category_usage (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  category_name TEXT NOT NULL,
  game_mode TEXT NOT NULL,
  play_count INTEGER DEFAULT 0,
  total_questions_viewed INTEGER DEFAULT 0,
  avg_time_per_question FLOAT DEFAULT 0,
  skip_rate FLOAT DEFAULT 0,
  favorite_rate FLOAT DEFAULT 0,
  last_played TIMESTAMPTZ,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(category_name, game_mode)
);

-- 4. Custom Events Table (for future tracking)
CREATE TABLE IF NOT EXISTS custom_events (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  event_name TEXT NOT NULL,
  properties JSONB,
  timestamp TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for better query performance
CREATE INDEX idx_session_analytics_user_id ON session_analytics(user_id);
CREATE INDEX idx_session_analytics_dates ON session_analytics(session_started, session_ended);
CREATE INDEX idx_session_analytics_category ON session_analytics(category, game_mode);

CREATE INDEX idx_question_analytics_session ON question_analytics(session_id);
CREATE INDEX idx_question_analytics_timestamp ON question_analytics(timestamp);

CREATE INDEX idx_category_usage_lookup ON category_usage(category_name, game_mode);
CREATE INDEX idx_category_usage_popularity ON category_usage(play_count DESC);

CREATE INDEX idx_custom_events_user ON custom_events(user_id);
CREATE INDEX idx_custom_events_name ON custom_events(event_name);
CREATE INDEX idx_custom_events_timestamp ON custom_events(timestamp);

-- Function to increment category usage
CREATE OR REPLACE FUNCTION increment_category_usage(
  p_category TEXT,
  p_game_mode TEXT
)
RETURNS void AS $$
BEGIN
  INSERT INTO category_usage (category_name, game_mode, play_count, last_played)
  VALUES (p_category, p_game_mode, 1, NOW())
  ON CONFLICT (category_name, game_mode)
  DO UPDATE SET
    play_count = category_usage.play_count + 1,
    last_played = NOW(),
    updated_at = NOW();
END;
$$ LANGUAGE plpgsql;

-- Row Level Security (RLS) Policies
ALTER TABLE session_analytics ENABLE ROW LEVEL SECURITY;
ALTER TABLE question_analytics ENABLE ROW LEVEL SECURITY;
ALTER TABLE category_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE custom_events ENABLE ROW LEVEL SECURITY;

-- Users can only see their own analytics
CREATE POLICY "Users can insert own session analytics"
  ON session_analytics FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

CREATE POLICY "Users can update own session analytics"
  ON session_analytics FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id OR user_id IS NULL);

CREATE POLICY "Users can view own session analytics"
  ON session_analytics FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id OR user_id IS NULL);

-- Question analytics tied to sessions
CREATE POLICY "Users can insert question analytics"
  ON question_analytics FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Users can view question analytics"
  ON question_analytics FOR SELECT
  TO authenticated
  USING (true);

-- Category usage is public read, authenticated write
CREATE POLICY "Anyone can view category usage"
  ON category_usage FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "System can update category usage"
  ON category_usage FOR ALL
  TO authenticated
  USING (true);

-- Custom events for users
CREATE POLICY "Users can insert own events"
  ON custom_events FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

CREATE POLICY "Users can view own events"
  ON custom_events FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id OR user_id IS NULL);

-- Grant necessary permissions
GRANT ALL ON session_analytics TO authenticated;
GRANT ALL ON question_analytics TO authenticated;
GRANT ALL ON category_usage TO authenticated;
GRANT ALL ON custom_events TO authenticated;
GRANT EXECUTE ON FUNCTION increment_category_usage TO authenticated;