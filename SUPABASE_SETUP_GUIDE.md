# Supabase Setup Guide for Spark Mode & New Subscription Tiers

This guide covers everything you need to set up the new subscription system and Spark Mode in Supabase.

## 📊 New Subscription Tier Structure

| Tier | Price | Spark Access | Monthly Limit | Database Value |
|------|-------|--------------|---------------|----------------|
| **Free** | €0 | ❌ No | 0 | `'free'` |
| **Basic** | **€6.99/month** | ❌ No | 0 | `'basic'` |
| **Premium** | **€11.99/month** | ✅ Yes | 150 questions | `'premium'` |
| **Premium+** | **€19.99/month** | ✅ Yes | 400 questions | `'premium_plus'` |

---

## 🗄️ Step 1: Run Database Migration

### Option A: Using Supabase CLI (Recommended)

```bash
# Navigate to your project directory
cd /Users/stenhoej/Desktop/flutter_first_app

# Apply the migration
supabase db push

# Or if you have multiple migrations
supabase migration up
```

### Option B: Manual SQL Execution

1. Go to **Supabase Dashboard** → Your Project
2. Click **SQL Editor** in the left sidebar
3. Click **New Query**
4. Copy and paste the entire contents of `supabase/migrations/spark_mode.sql`
5. Click **Run** (or press Cmd/Ctrl + Enter)

The migration will:
- ✅ Add `subscription_tier` column to `user_subscriptions` table
- ✅ Create `spark_usage` table for tracking monthly quotas
- ✅ Create `spark_questions` table for temporary AI questions
- ✅ Set up PostgreSQL functions: `get_spark_limit()` and `get_spark_remaining()`
- ✅ Configure Row Level Security (RLS) policies

---

## 🔧 Step 2: Deploy Edge Function

### Deploy the Spark Generator Function

```bash
# Make sure you're logged in to Supabase
supabase login

# Link your project (if not already linked)
supabase link --project-ref YOUR_PROJECT_REF

# Deploy the Spark generator function
supabase functions deploy spark-generator

# Set the Anthropic API key (required for AI generation)
supabase secrets set ANTHROPIC_API_KEY=your_anthropic_api_key_here
```

### Verify Deployment

```bash
# List all functions
supabase functions list

# Test the function (optional)
supabase functions invoke spark-generator --json '{"question_count": 5, "energy": 3, "depth": 3, "spice": 2, "group_size": 4, "occasion": "test"}'
```

---

## 💳 Step 3: Payment Integration

You'll need to integrate a payment provider to handle subscriptions. Here are your options:

### Option A: RevenueCat (Recommended for Mobile)

1. **Create RevenueCat Account**: https://www.revenuecat.com/
2. **Configure Products**:
   - Basic: `basic_monthly` - €6.99/month
   - Premium: `premium_monthly` - €11.99/month
   - Premium+: `premium_plus_monthly` - €19.99/month

3. **Add RevenueCat SDK**:
```yaml
# pubspec.yaml
dependencies:
  purchases_flutter: ^6.0.0
```

4. **Update Subscription Handler**:
```dart
// In subscription_page_new.dart _handleSubscribe method
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> _handleSubscribe() async {
  setState(() => isLoading = true);

  try {
    // Map tier to RevenueCat product ID
    final productId = selectedTier == 'basic'
        ? 'basic_monthly'
        : selectedTier == 'premium'
        ? 'premium_monthly'
        : 'premium_plus_monthly';

    // Purchase the product
    final customerInfo = await Purchases.purchaseProduct(productId);

    // Update Supabase with the subscription tier
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId != null) {
      await Supabase.instance.client
          .from('user_subscriptions')
          .upsert({
            'user_id': userId,
            'subscription_tier': selectedTier,
            'is_premium': selectedTier != 'free',
            'updated_at': DateTime.now().toIso8601String(),
          }, onConflict: 'user_id');

      // Refresh the unlock provider
      await ref.read(unlockProvider.notifier).initialize();
    }

    if (mounted) {
      Navigator.pop(context, true);
    }
  } catch (e) {
    // Handle error
    debugPrint('Purchase error: $e');
  } finally {
    if (mounted) {
      setState(() => isLoading = false);
    }
  }
}
```

### Option B: Stripe (Alternative)

1. **Create Stripe Account**: https://stripe.com/
2. **Create Products** in Stripe Dashboard:
   - Basic: €6.99/month recurring
   - Premium: €11.99/month recurring
   - Premium+: €19.99/month recurring

3. **Use Stripe Flutter SDK**:
```yaml
dependencies:
  flutter_stripe: ^10.0.0
```

---

## 🎨 Step 4: Upload Spark Icon to Storage

1. Go to **Supabase Dashboard** → **Storage**
2. Navigate to `category_icons` bucket
3. Upload a Spark icon image as `spark.png`
4. URL will be: `https://YOUR_PROJECT_REF.supabase.co/storage/v1/object/public/category_icons/spark.png`

**Recommended Icon Specs:**
- Size: 512x512 px
- Format: PNG with transparency
- Icon: ✨ sparkle/star design matching your app theme

---

## 🔐 Step 5: Update User Subscriptions

### Manually Set a User to Premium (for testing)

```sql
-- Set a user to Premium tier
UPDATE user_subscriptions
SET
  subscription_tier = 'premium',
  is_premium = true,
  updated_at = NOW()
WHERE user_id = 'USER_UUID_HERE';

-- Or create a new subscription
INSERT INTO user_subscriptions (user_id, subscription_tier, is_premium)
VALUES ('USER_UUID_HERE', 'premium', true)
ON CONFLICT (user_id)
DO UPDATE SET
  subscription_tier = 'premium',
  is_premium = true,
  updated_at = NOW();
```

### Set to Premium+ (400 questions/month)

```sql
UPDATE user_subscriptions
SET
  subscription_tier = 'premium_plus',
  is_premium = true,
  updated_at = NOW()
WHERE user_id = 'USER_UUID_HERE';
```

### Set to Basic (€6.99, no Spark)

```sql
UPDATE user_subscriptions
SET
  subscription_tier = 'basic',
  is_premium = true,  -- Still premium for other features
  updated_at = NOW()
WHERE user_id = 'USER_UUID_HERE';
```

---

## 🧪 Step 6: Test the Spark Flow

### Test Quota System

1. **Check Spark Limit**:
```sql
SELECT get_spark_limit('USER_UUID_HERE');
-- Should return: 150 for premium, 400 for premium_plus, 0 for basic/free
```

2. **Check Remaining Questions**:
```sql
SELECT get_spark_remaining('USER_UUID_HERE');
-- Should return the limit minus any used questions
```

3. **Manually Add Usage** (for testing):
```sql
INSERT INTO spark_usage (user_id, questions_generated, period_start_date, period_end_date)
VALUES (
  'USER_UUID_HERE',
  50,  -- Used 50 questions
  NOW(),
  NOW() + INTERVAL '30 days'
);
```

4. **Check Remaining Again**:
```sql
SELECT get_spark_remaining('USER_UUID_HERE');
-- Should return 100 for premium (150 - 50), 350 for premium_plus
```

### Test Question Generation

1. Open app and sign in
2. Navigate to Spark mode
3. Select sliders and occasion
4. Generate 10 questions
5. Check database:
```sql
SELECT * FROM spark_questions WHERE user_id = 'USER_UUID_HERE';
```

6. Verify usage updated:
```sql
SELECT * FROM spark_usage WHERE user_id = 'USER_UUID_HERE';
```

---

## 📱 Step 7: Test Complete User Flows

### Flow 1: Free User → Spark Mode
1. Sign in as free user
2. Try to access Spark mode
3. Should see: "Spark Mode - Premium Feature" dialog
4. Click "Get Premium"
5. Should navigate to subscription page

### Flow 2: Basic User → Spark Mode
1. Set user to Basic tier
2. Try to access Spark mode
3. Should see same premium dialog
4. Can access all other game modes

### Flow 3: Premium User → Generate Questions
1. Set user to Premium tier
2. Access Spark mode
3. See "X of 150 questions remaining"
4. Generate 10 questions
5. View questions in card interface
6. Test ❤️ Favorite button
7. Test 📁 Add to Deck button
8. Verify quota decreases

### Flow 4: Hit Monthly Limit
1. Manually set usage to 148 (for Premium)
2. Try to generate 10 questions
3. Should see limit reached dialog
4. Should offer Premium+ upgrade

---

## 🔄 Step 8: Webhook Setup (Optional but Recommended)

Set up webhooks to sync subscription status from payment provider:

### For RevenueCat:
1. Go to RevenueCat Dashboard → Project Settings → Integrations
2. Add Supabase webhook
3. Create an Edge Function to handle webhook:

```typescript
// supabase/functions/revenuecat-webhook/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )

  const event = await req.json()

  // Map RevenueCat event to subscription tier
  const productId = event.product_id
  let tier = 'free'

  if (productId === 'basic_monthly') tier = 'basic'
  else if (productId === 'premium_monthly') tier = 'premium'
  else if (productId === 'premium_plus_monthly') tier = 'premium_plus'

  // Update user subscription
  await supabase
    .from('user_subscriptions')
    .upsert({
      user_id: event.app_user_id,
      subscription_tier: tier,
      is_premium: tier !== 'free',
      updated_at: new Date().toISOString()
    }, { onConflict: 'user_id' })

  return new Response('OK', { status: 200 })
})
```

---

## 🧹 Step 9: Schedule Cleanup Job

Set up automatic cleanup of expired Spark questions:

### Using pg_cron (if available):
```sql
-- Enable pg_cron extension (may require Supabase support)
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Schedule cleanup to run every hour
SELECT cron.schedule(
  'cleanup-expired-spark-questions',
  '0 * * * *',  -- Every hour
  'SELECT cleanup_expired_spark_questions();'
);
```

### Alternative: Call from Edge Function
Create a scheduled Edge Function that calls the cleanup:

```bash
# Deploy cleanup function
supabase functions deploy spark-cleanup

# Set up cron job in Supabase Dashboard → Edge Functions → spark-cleanup → Cron
```

---

## ✅ Verification Checklist

- [ ] Database migration applied successfully
- [ ] `subscription_tier` column exists in `user_subscriptions`
- [ ] `spark_usage` and `spark_questions` tables created
- [ ] PostgreSQL functions working: `get_spark_limit()`, `get_spark_remaining()`
- [ ] Edge Function `spark-generator` deployed
- [ ] Anthropic API key set in secrets
- [ ] Spark icon uploaded to storage
- [ ] Payment provider configured (RevenueCat or Stripe)
- [ ] Test user subscriptions working
- [ ] Spark quota tracking working
- [ ] Question generation working
- [ ] Favorite/Add to Deck working
- [ ] 24-hour expiration working
- [ ] Monthly limit enforcement working
- [ ] Webhook syncing (if applicable)

---

## 🐛 Troubleshooting

### "Function get_spark_remaining does not exist"
- Make sure you ran the full migration SQL
- Check if functions were created: `\df get_spark_*` in SQL editor

### "Permission denied for table spark_usage"
- Verify RLS policies were created
- Check if user is authenticated: `SELECT auth.uid();`

### "No Spark questions remaining"
- Check user's tier: `SELECT subscription_tier FROM user_subscriptions WHERE user_id = 'UUID';`
- Check usage: `SELECT get_spark_remaining('UUID');`
- Verify period dates are correct

### Edge Function timeout
- Check Anthropic API key is set correctly
- Verify API key has sufficient credits
- Check function logs: `supabase functions logs spark-generator`

---

## 📚 Additional Resources

- [Supabase Edge Functions Docs](https://supabase.com/docs/guides/functions)
- [RevenueCat Flutter SDK](https://docs.revenuecat.com/docs/flutter)
- [Stripe Flutter Integration](https://stripe.com/docs/payments/accept-a-payment?platform=flutter)
- [Anthropic API Docs](https://docs.anthropic.com/)

---

## 💡 Tips

1. **Always test in a staging environment first**
2. **Set up proper error logging** in production
3. **Monitor Spark usage** to adjust limits if needed
4. **Consider adding analytics** to track feature adoption
5. **Set up alerts** for Edge Function failures

Good luck! 🚀
