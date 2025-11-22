-- Add will_renew column to user_subscriptions table
-- This tracks whether a subscription will auto-renew at the end of the billing period

ALTER TABLE user_subscriptions
ADD COLUMN IF NOT EXISTS will_renew BOOLEAN DEFAULT true;

-- Add comment to explain the column
COMMENT ON COLUMN user_subscriptions.will_renew IS 'Whether the subscription will auto-renew. False means user has cancelled but subscription is still active until expiration_date';

-- Update existing rows to have will_renew=true by default
-- (Existing active subscriptions are assumed to be set to renew)
UPDATE user_subscriptions
SET will_renew = true
WHERE will_renew IS NULL;

-- For testing: If a subscription has is_premium=false but has an expiration_date in the future,
-- it was likely cancelled, so set will_renew=false
UPDATE user_subscriptions
SET will_renew = false
WHERE is_premium = false
  AND expiration_date IS NOT NULL
  AND expiration_date > NOW();
