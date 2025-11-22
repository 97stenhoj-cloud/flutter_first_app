# RevenueCat Quick Start Guide

**Status:** ✅ Integration Complete - Ready for Configuration

---

## What's Been Done

✅ **Database Migration Applied**
- Added RevenueCat fields to `user_subscriptions` table
- Created `subscription_history` audit table
- Added indexes for performance

✅ **Webhook Edge Function Deployed**
- URL: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
- Handles all subscription events (purchase, renewal, cancellation, etc.)
- Automatically syncs to Supabase database

✅ **Flutter App Updated**
- Added `purchases_flutter` package
- Created `RevenueCatService` for SDK operations
- Updated subscription page with purchase flow
- Initialized RevenueCat in `main.dart`

✅ **Documentation Created**
- Complete setup guide: `REVENUECAT_SETUP_GUIDE.md`
- Environment variables configured in `.env`

---

## Next Steps (Required for Testing)

### 1. Get RevenueCat API Keys

1. Sign up at [RevenueCat](https://app.revenuecat.com)
2. Create a new project
3. Go to Settings → API Keys
4. Copy your keys:
   - iOS: Starts with `appl_`
   - Android: Starts with `goog_`

### 2. Update Environment Variables

Edit `.env` file and replace placeholders:

```env
REVENUECAT_IOS_KEY=appl_YOUR_ACTUAL_KEY_HERE
REVENUECAT_ANDROID_KEY=goog_YOUR_ACTUAL_KEY_HERE
REVENUECAT_WEBHOOK_SECRET=generate_a_random_secret
```

Generate webhook secret:
```bash
openssl rand -base64 32
```

### 3. Configure Webhook in RevenueCat

1. Go to RevenueCat Dashboard → Integrations → Webhooks
2. Add webhook:
   - **URL**: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
   - **Authorization Header**: `Bearer YOUR_WEBHOOK_SECRET`
   - Enable all events

### 4. Set Supabase Secret

```bash
supabase secrets set REVENUECAT_WEBHOOK_SECRET=YOUR_WEBHOOK_SECRET
```

Or via Supabase Dashboard → Edge Functions → Manage Secrets

### 5. Create Products in RevenueCat

Create these 3 products:

| Product ID | Tier | Price |
|-----------|------|-------|
| `basic_monthly` | Basic | €6.99/mo |
| `premium_monthly` | Premium | €11.99/mo |
| `premium_plus_monthly` | Premium+ | €19.99/mo |

---

## Testing Without Real Transactions

### Option 1: Test Mode (No RevenueCat Keys)

If you don't add keys to `.env`, the app will use a **fallback mode**:
- Shows orange "Test Mode" message
- Updates database directly (no payment)
- Perfect for UI/UX testing

### Option 2: RevenueCat Sandbox

1. Add API keys to `.env`
2. Create sandbox tester accounts:
   - **iOS**: App Store Connect → Sandbox Testers
   - **Android**: Play Console → License Testing
3. Run app with sandbox account
4. Purchase subscriptions (no real money charged!)
5. Verify webhook syncs to Supabase

---

## Quick Test Checklist

Once configured, test this flow:

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run App**
   ```bash
   flutter run
   ```

3. **Try Purchase**
   - Open subscription page
   - Select a tier
   - Click subscribe
   - Check console logs

4. **Verify Webhook** (if keys configured)
   ```bash
   supabase functions logs revenuecat-webhook
   ```

5. **Check Database**
   - Open Supabase Dashboard
   - Go to Table Editor → `user_subscriptions`
   - Verify your user's tier updated

---

## Architecture Overview

```
┌─────────────────┐
│   Flutter App   │
│                 │
│  Subscription   │
│      Page       │
└────────┬────────┘
         │
         │ 1. User clicks "Subscribe"
         ▼
┌─────────────────┐
│  RevenueCat SDK │ ◄──── API Keys from .env
└────────┬────────┘
         │
         │ 2. Initiate purchase
         ▼
┌─────────────────┐
│  App Store /    │
│  Play Store     │
└────────┬────────┘
         │
         │ 3. Purchase confirmed
         ▼
┌─────────────────┐
│   RevenueCat    │
│    Webhook      │
└────────┬────────┘
         │
         │ 4. Send event
         ▼
┌─────────────────┐
│    Supabase     │ ◄──── Webhook Secret validates
│  Edge Function  │
└────────┬────────┘
         │
         │ 5. Update subscription
         ▼
┌─────────────────┐
│    Supabase     │
│    Database     │
│                 │
│ user_subscriptions
│ subscription_history
└─────────────────┘
         │
         │ 6. App reads updated status
         ▼
┌─────────────────┐
│   Flutter App   │
│  (Premium!)     │
└─────────────────┘
```

---

## Key Files Created/Modified

### New Files
- `supabase/migrations/20251120_add_revenuecat_fields.sql` - Database schema
- `supabase/functions/revenuecat-webhook/index.ts` - Webhook handler
- `lib/core/services/revenue_cat_service.dart` - Flutter service
- `REVENUECAT_SETUP_GUIDE.md` - Full documentation
- `REVENUECAT_QUICK_START.md` - This file

### Modified Files
- `pubspec.yaml` - Added `purchases_flutter: ^6.0.0`
- `lib/main.dart` - Initialize RevenueCat
- `lib/features/subscription/presentation/pages/subscription_page_new.dart` - Purchase flow
- `.env` - Added RevenueCat configuration

---

## Product Mapping

Your subscription tiers map to RevenueCat products:

```dart
// Supabase → RevenueCat
'basic' → 'basic_monthly'
'premium' → 'premium_monthly'
'premium_plus' → 'premium_plus_monthly'
```

The webhook automatically converts product IDs back to tier names when updating the database.

---

## Webhook URL

**Your webhook endpoint:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Test it:**
```bash
curl -X POST https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook \
  -H "Authorization: Bearer YOUR_SECRET" \
  -H "Content-Type: application/json" \
  -d '{"event":{"type":"TEST"}}'
```

---

## Database Tables

### user_subscriptions (existing + new fields)
```sql
user_id                    UUID PRIMARY KEY
is_premium                 BOOLEAN
subscription_tier          TEXT
unlocked_bundles          TEXT[]
-- NEW RevenueCat fields:
revenuecat_subscription_id TEXT
product_id                 TEXT
store                      TEXT
expiration_date           TIMESTAMPTZ
auto_renew_status         BOOLEAN
is_trial_period           BOOLEAN
cancellation_date         TIMESTAMPTZ
last_webhook_event        TEXT
last_webhook_timestamp    TIMESTAMPTZ
created_at                TIMESTAMPTZ
updated_at                TIMESTAMPTZ
```

### subscription_history (new audit table)
```sql
id                UUID PRIMARY KEY
user_id           UUID
event_type        TEXT
old_tier          TEXT
new_tier          TEXT
product_id        TEXT
store             TEXT
revenuecat_data   JSONB
created_at        TIMESTAMPTZ
```

---

## Support & Resources

📖 **Full Guide:** See `REVENUECAT_SETUP_GUIDE.md`

🔗 **Links:**
- [RevenueCat Dashboard](https://app.revenuecat.com)
- [RevenueCat Docs](https://www.revenuecat.com/docs)
- [Supabase Dashboard](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv)

🐛 **Debugging:**
- Check Flutter logs: `flutter logs`
- Check webhook logs: `supabase functions logs revenuecat-webhook`
- Check database: Supabase Table Editor

---

**Status:** Ready for configuration! Follow the "Next Steps" above to start testing. 🚀
