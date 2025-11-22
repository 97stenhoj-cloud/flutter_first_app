-- Add RevenueCat-specific fields to user_subscriptions table
-- This migration enables integration with RevenueCat for in-app purchase handling

-- Add new columns for RevenueCat integration
ALTER TABLE user_subscriptions
ADD COLUMN IF NOT EXISTS revenuecat_subscription_id TEXT,
ADD COLUMN IF NOT EXISTS product_id TEXT,
ADD COLUMN IF NOT EXISTS store TEXT CHECK (store IN ('app_store', 'play_store', null)),
ADD COLUMN IF NOT EXISTS expiration_date TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS auto_renew_status BOOLEAN DEFAULT true,
ADD COLUMN IF NOT EXISTS is_trial_period BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS cancellation_date TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS last_webhook_event TEXT,
ADD COLUMN IF NOT EXISTS last_webhook_timestamp TIMESTAMPTZ;

-- Add index for RevenueCat subscription ID lookups
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_revenuecat_id
ON user_subscriptions(revenuecat_subscription_id)
WHERE revenuecat_subscription_id IS NOT NULL;

-- Add index for expiration date (useful for cleanup jobs and filtering)
CREATE INDEX IF NOT EXISTS idx_user_subscriptions_expiration
ON user_subscriptions(expiration_date)
WHERE expiration_date IS NOT NULL;

-- Add column comments for documentation
COMMENT ON COLUMN user_subscriptions.revenuecat_subscription_id IS 'RevenueCat unique subscription identifier for tracking purchase lifecycle';
COMMENT ON COLUMN user_subscriptions.product_id IS 'RevenueCat product ID (e.g., premium_monthly, basic_yearly)';
COMMENT ON COLUMN user_subscriptions.store IS 'Purchase store: app_store (iOS) or play_store (Android)';
COMMENT ON COLUMN user_subscriptions.expiration_date IS 'Subscription expiration timestamp from RevenueCat';
COMMENT ON COLUMN user_subscriptions.auto_renew_status IS 'Whether auto-renewal is enabled for the subscription';
COMMENT ON COLUMN user_subscriptions.is_trial_period IS 'Whether the user is currently in a trial period';
COMMENT ON COLUMN user_subscriptions.cancellation_date IS 'Timestamp when user cancelled (subscription remains active until expiration)';
COMMENT ON COLUMN user_subscriptions.last_webhook_event IS 'Last webhook event type received from RevenueCat (e.g., INITIAL_PURCHASE, RENEWAL)';
COMMENT ON COLUMN user_subscriptions.last_webhook_timestamp IS 'Timestamp of the last webhook event received';

-- Create subscription history table for audit trail
CREATE TABLE IF NOT EXISTS subscription_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  event_type TEXT NOT NULL,
  old_tier TEXT,
  new_tier TEXT,
  product_id TEXT,
  store TEXT,
  revenuecat_data JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Add index for efficient history queries
CREATE INDEX IF NOT EXISTS idx_subscription_history_user_id
ON subscription_history(user_id, created_at DESC);

-- Add index for event type queries
CREATE INDEX IF NOT EXISTS idx_subscription_history_event_type
ON subscription_history(event_type, created_at DESC);

-- Add RLS policies for subscription_history
ALTER TABLE subscription_history ENABLE ROW LEVEL SECURITY;

-- Users can only read their own subscription history
CREATE POLICY "Users can view own subscription history"
ON subscription_history
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

-- Only service role can insert/update subscription history (webhooks)
CREATE POLICY "Service role can manage subscription history"
ON subscription_history
FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

-- Add comment to table
COMMENT ON TABLE subscription_history IS 'Audit trail of all subscription changes from RevenueCat webhooks';
