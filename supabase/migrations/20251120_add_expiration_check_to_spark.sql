-- Update Spark limit function to validate subscription expiration
-- This ensures users can't generate Spark questions after their subscription expires

CREATE OR REPLACE FUNCTION get_spark_limit(p_user_id UUID)
RETURNS INT
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_tier TEXT;
  v_expiration_date TIMESTAMPTZ;
BEGIN
  SELECT subscription_tier, expiration_date INTO v_tier, v_expiration_date
  FROM user_subscriptions
  WHERE user_id = p_user_id;

  -- Check if subscription is expired
  IF v_expiration_date IS NOT NULL AND v_expiration_date < NOW() THEN
    -- Subscription expired, return 0 limit
    RETURN 0;
  END IF;

  -- Return limit based on tier
  RETURN CASE v_tier
    WHEN 'premium' THEN 150
    WHEN 'premium_plus' THEN 400
    ELSE 0
  END;
END;
$$;

COMMENT ON FUNCTION get_spark_limit IS 'Returns the Spark question limit for a user based on their subscription tier and expiration status';
