-- Spark Mode Database Migration
-- Creates tables and updates for the new Spark AI question generation feature

-- 1. Add subscription_tier to user_subscriptions table
ALTER TABLE user_subscriptions
ADD COLUMN IF NOT EXISTS subscription_tier TEXT DEFAULT 'free'
CHECK (subscription_tier IN ('free', 'basic', 'premium', 'premium_plus'));

-- Migrate existing users: if is_premium = true, set to 'premium', else 'free'
UPDATE user_subscriptions
SET subscription_tier = CASE
  WHEN is_premium = true THEN 'premium'
  ELSE 'free'
END
WHERE subscription_tier = 'free';

-- 2. Create spark_usage table to track monthly question generation limits
CREATE TABLE IF NOT EXISTS spark_usage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  questions_generated INT DEFAULT 0 CHECK (questions_generated >= 0),
  period_start_date TIMESTAMPTZ NOT NULL,
  period_end_date TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, period_start_date)
);

-- Index for fast lookups
CREATE INDEX IF NOT EXISTS idx_spark_usage_user_period
ON spark_usage(user_id, period_start_date);

-- 3. Create spark_questions table for temporary AI-generated questions
CREATE TABLE IF NOT EXISTS spark_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  question TEXT NOT NULL,
  answer TEXT,
  generation_prompts JSONB,
  is_favorited BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '24 hours'),
  CONSTRAINT question_not_empty CHECK (length(question) > 0)
);

-- Index for fast user queries and cleanup
CREATE INDEX IF NOT EXISTS idx_spark_questions_user
ON spark_questions(user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_spark_questions_expires
ON spark_questions(expires_at) WHERE expires_at IS NOT NULL;

-- 4. Enable Row Level Security
ALTER TABLE spark_usage ENABLE ROW LEVEL SECURITY;
ALTER TABLE spark_questions ENABLE ROW LEVEL SECURITY;

-- RLS Policies for spark_usage
CREATE POLICY "Users can view their own spark usage"
  ON spark_usage FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own spark usage"
  ON spark_usage FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own spark usage"
  ON spark_usage FOR UPDATE
  USING (auth.uid() = user_id);

-- RLS Policies for spark_questions
CREATE POLICY "Users can view their own spark questions"
  ON spark_questions FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own spark questions"
  ON spark_questions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own spark questions"
  ON spark_questions FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own spark questions"
  ON spark_questions FOR DELETE
  USING (auth.uid() = user_id);

-- 5. Function to automatically clean up expired questions
CREATE OR REPLACE FUNCTION cleanup_expired_spark_questions()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  DELETE FROM spark_questions
  WHERE expires_at < NOW();
END;
$$;

-- 6. Function to get user's current Spark limit based on subscription tier
CREATE OR REPLACE FUNCTION get_spark_limit(p_user_id UUID)
RETURNS INT
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
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
$$;

-- 7. Function to get user's remaining Spark questions for current period
CREATE OR REPLACE FUNCTION get_spark_remaining(p_user_id UUID)
RETURNS INT
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
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
$$;

-- 8. Create a scheduled job to clean up expired questions (runs hourly)
-- Note: This requires pg_cron extension, which may need to be enabled in Supabase dashboard
-- Alternatively, this can be called from the Edge Function periodically

-- Comments for documentation
COMMENT ON TABLE spark_usage IS 'Tracks monthly Spark question generation usage per user';
COMMENT ON TABLE spark_questions IS 'Stores temporary AI-generated Spark questions (auto-deleted after 24 hours)';
COMMENT ON COLUMN user_subscriptions.subscription_tier IS 'User subscription tier: free, basic, premium, premium_plus';
COMMENT ON FUNCTION get_spark_limit IS 'Returns the Spark question limit for a user based on their subscription tier';
COMMENT ON FUNCTION get_spark_remaining IS 'Returns remaining Spark questions for current billing period';
