# ✅ Subscription Expiration Handling - Complete Guide

## 🎯 What Was Implemented

To ensure users lose premium access when their subscription expires (even if webhooks fail), I've added **multi-layered expiration validation**:

### 1. App-Level Validation ✅
**File**: [lib/core/providers/unlock_provider.dart](lib/core/providers/unlock_provider.dart#L144-L171)

The `initialize()` method now fetches and validates `expiration_date`:

```dart
// Validate expiration date if premium
if (isPremium && response?['expiration_date'] != null) {
  try {
    final expirationDate = DateTime.parse(response!['expiration_date']);
    final isExpired = expirationDate.isBefore(DateTime.now());

    if (isExpired) {
      debugPrint('⚠️ Subscription expired: $expirationDate');
      isPremium = false; // Override to false if expired
    }
  } catch (e) {
    debugPrint('⚠️ Could not parse expiration_date: $e');
  }
}
```

### 2. Database Function Validation ✅
**File**: [supabase/migrations/20251120_add_expiration_check_to_spark.sql](supabase/migrations/20251120_add_expiration_check_to_spark.sql)

Updated `get_spark_limit()` function to check expiration before returning limits:

```sql
-- Check if subscription is expired
IF v_expiration_date IS NOT NULL AND v_expiration_date < NOW() THEN
  -- Subscription expired, return 0 limit
  RETURN 0;
END IF;
```

**Status**: ✅ **Already applied to database**

### 3. Cache Service Validation ✅
**File**: [lib/core/services/supabase_service.dart](lib/core/services/supabase_service.dart#L138-L170)

Updated `_checkPremiumStatus()` to validate expiration for premium features like offline caching:

```dart
// Validate expiration date if premium
if (isPremium && response?['expiration_date'] != null) {
  try {
    final expirationDate = DateTime.parse(response!['expiration_date']);
    final isExpired = expirationDate.isBefore(DateTime.now());

    if (isExpired) {
      debugPrint('⚠️ Subscription expired: $expirationDate');
      return false; // Override to false if expired
    }
  } catch (e) {
    debugPrint('⚠️ Could not parse expiration_date: $e');
  }
}
```

### 4. Scheduled Expiration Job ⏳ (Manual Deployment Required)
**File**: [supabase/functions/check-subscription-expirations/index.ts](supabase/functions/check-subscription-expirations/index.ts)

Created a backup Edge Function that checks for expired subscriptions daily:

- Finds all subscriptions where `is_premium = true` but `expiration_date < NOW()`
- Automatically downgrades them to free tier
- Provides redundancy if RevenueCat webhooks fail

---

## 📋 Deployment Steps

### Step 1: Deploy the Expiration Check Function

```bash
cd /Users/stenhoej/Desktop/flutter_first_app
npx supabase functions deploy check-subscription-expirations
```

**OR** if you're logged in:

```bash
supabase functions deploy check-subscription-expirations
```

### Step 2: Schedule the Function (Daily Execution)

Go to [Supabase Dashboard → Database → Extensions](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/database/extensions)

1. Enable `pg_cron` extension (if not already enabled)
2. Go to SQL Editor
3. Run this query to schedule daily execution at 2 AM UTC:

```sql
-- Schedule daily expiration check at 2 AM UTC
SELECT cron.schedule(
  'check-subscription-expirations',
  '0 2 * * *',  -- Daily at 2 AM UTC
  $$
  SELECT
    net.http_post(
      url := 'https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/check-subscription-expirations',
      headers := jsonb_build_object(
        'Content-Type', 'application/json',
        'Authorization', 'Bearer ' || current_setting('app.service_role_key')
      )
    ) as request_id;
  $$
);
```

**Alternative**: If `pg_cron` is not available, you can use an external cron service (like GitHub Actions, Vercel Cron, or Upstash Qstash) to call the function daily.

### Step 3: Test the Function

Test manually by calling the Edge Function:

```bash
curl -X POST \
  https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/check-subscription-expirations \
  -H "Authorization: Bearer YOUR_SERVICE_ROLE_KEY"
```

Expected response:
```json
{
  "success": true,
  "message": "Subscription expiration check completed",
  "processed": 0,
  "failed": 0,
  "details": []
}
```

---

## 🔄 How It Works Now

### Normal Flow (Webhooks Working):
```
User subscription expires
    ↓
RevenueCat sends EXPIRATION webhook
    ↓
Webhook updates database:
  - is_premium = false
  - subscription_tier = 'free'
    ↓
✅ User loses premium access immediately
```

### Backup Flow (Webhooks Failed):
```
User subscription expires (webhook missed)
    ↓
App-level validation checks expiration_date
    ↓
✅ User loses premium access on next app open
    ↓
Scheduled job runs daily at 2 AM
    ↓
Finds expired subscriptions still marked premium
    ↓
✅ Automatically downgrades to free tier
```

### Triple Protection:
1. **Webhook-based** (instant, primary method)
2. **App-level validation** (real-time check on app initialization)
3. **Database function validation** (prevents Spark usage after expiration)
4. **Scheduled job** (daily cleanup for missed webhooks)

---

## 🧪 Testing Expiration Handling

### Test 1: Manual Expiration Test

1. Update a test user's expiration_date to the past:

```sql
UPDATE user_subscriptions
SET expiration_date = NOW() - INTERVAL '1 day'
WHERE user_id = 'YOUR_TEST_USER_ID';
```

2. Open the app and check profile page
3. **Expected**: User should show as Free tier

### Test 2: Spark Limit Test

1. Set expiration_date to the past for a premium user
2. Try to generate Spark questions
3. **Expected**: Should return 0 limit

### Test 3: Scheduled Job Test

1. Create expired subscription:

```sql
UPDATE user_subscriptions
SET
  is_premium = true,
  subscription_tier = 'premium',
  expiration_date = NOW() - INTERVAL '1 day'
WHERE user_id = 'YOUR_TEST_USER_ID';
```

2. Run the Edge Function manually
3. **Expected**: User should be downgraded to free

---

## 🔐 Security Notes

The scheduled job uses **service role key** which has full database access:

- ✅ Only accessible via authenticated requests
- ✅ Runs with `SECURITY DEFINER` to bypass RLS
- ✅ Logs all actions for audit trail

---

## 📊 Monitoring

### Check Scheduled Job Logs

Go to [Supabase Edge Functions → Logs](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/functions/logs)

Look for:
```
✅ Expiration check complete: X processed, Y failed
```

### Check for Expired Subscriptions

Run this query to see if any subscriptions are expired but still marked premium:

```sql
SELECT
  user_id,
  subscription_tier,
  expiration_date,
  is_premium,
  EXTRACT(EPOCH FROM (NOW() - expiration_date))/86400 as days_expired
FROM user_subscriptions
WHERE is_premium = true
  AND expiration_date < NOW()
ORDER BY expiration_date ASC;
```

---

## ✅ Summary

**Completed**:
- ✅ App-level expiration validation in `unlock_provider.dart`
- ✅ Database function validation in `get_spark_limit()`
- ✅ Cache service validation in `supabase_service.dart`
- ✅ Created scheduled expiration job Edge Function
- ✅ Applied database migration

**Pending**:
- ⏳ Deploy the expiration check Edge Function
- ⏳ Schedule daily execution (via pg_cron or external service)

**Benefits**:
- 🛡️ Four layers of protection against expired subscriptions
- 🚀 Instant expiration via webhooks (primary)
- 🔄 Real-time validation in app (secondary)
- 🕐 Daily cleanup job (tertiary backup)
- 💪 Works even if RevenueCat webhooks fail

---

## 🚀 Next Steps

1. **Deploy the Edge Function** (command above)
2. **Schedule daily execution** (SQL query above)
3. **Test with expired subscription** (manual test above)
4. **Monitor logs** for the first few days

Once deployed, your subscription lifecycle will be fully protected! 🎉
