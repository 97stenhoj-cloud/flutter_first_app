# 🔧 Update RevenueCat Webhook Configuration

## Fixed the 401 Error!

I've updated the webhook function to use a custom header instead of the Authorization header (which Supabase reserves for JWT validation).

---

## Step 1: Deploy Updated Webhook Function

The webhook function has been updated. Now deploy it:

```bash
cd /Users/stenhoej/Desktop/flutter_first_app
npx supabase functions deploy revenuecat-webhook
```

---

## Step 2: Update RevenueCat Webhook Settings

Go to [RevenueCat Dashboard → Integrations → Webhooks](https://app.revenuecat.com/settings/integrations)

### Delete or Edit Existing Webhook

1. Find the existing webhook
2. Either delete it and create a new one, or edit it

### New Webhook Configuration

**URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Add TWO Headers:**

1. **First Header (Supabase Auth):**
   - Key: `Authorization`
   - Value: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8`

   *(This is your Supabase anon key - needed to pass JWT validation)*

2. **Second Header (Webhook Verification):**
   - Key: `X-RevenueCat-Secret`
   - Value: `RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`

   *(This is your custom secret - used by our function to verify it's from RevenueCat)*

**Events:**
- Select **ALL** events

**Save!**

---

## Step 3: Test the Webhook

After saving, click **"Send Test Event"**

- Event type: `INITIAL_PURCHASE`
- Click **Send**

**Expected Response:** ✅ **200 OK**

---

## Step 4: Verify in Supabase Logs

Go to [Supabase Edge Functions → Logs](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/functions/logs)

You should see:
```
✅ Webhook secret verified
📥 Received webhook: { event: { type: "INITIAL_PURCHASE", ... } }
✅ Subscription updated for user: ...
```

---

## Why Two Headers?

### Header 1: `Authorization` (Supabase JWT)
- **Purpose**: Gets past Supabase's JWT validation
- **Value**: Your Supabase anon key
- **Required**: Yes (Supabase won't accept requests without it)

### Header 2: `X-RevenueCat-Secret` (Custom Verification)
- **Purpose**: Proves the request is actually from RevenueCat
- **Value**: Your custom webhook secret
- **Required**: Yes (our function checks this)

This two-layer approach ensures:
1. ✅ Request is authorized to call Supabase Edge Functions
2. ✅ Request is verified to be from RevenueCat
3. ✅ Secure and properly authenticated

---

## Quick Visual Guide

**In RevenueCat Dashboard:**

```
┌─────────────────────────────────────────────────────┐
│ Webhook Configuration                               │
├─────────────────────────────────────────────────────┤
│                                                     │
│ URL:                                                │
│ https://tpjsebutbieghpmvpktv.supabase.co/          │
│ functions/v1/revenuecat-webhook                    │
│                                                     │
│ Headers:                                            │
│ ┌─────────────────────────────────────────────┐   │
│ │ Authorization                                 │   │
│ │ Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpX...  │   │
│ └─────────────────────────────────────────────┘   │
│                                                     │
│ ┌─────────────────────────────────────────────┐   │
│ │ X-RevenueCat-Secret                          │   │
│ │ RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQ...     │   │
│ └─────────────────────────────────────────────┘   │
│                                                     │
│ Events: [x] Select All                             │
│                                                     │
│ [Save]  [Test]                                     │
└─────────────────────────────────────────────────────┘
```

---

## Troubleshooting

### Still Getting 401?

1. **Check Authorization header** is set correctly with Supabase anon key
2. **Check X-RevenueCat-Secret header** matches the secret in Supabase Edge Functions

### Getting Different Error?

Check Supabase logs:
```bash
# Look for detailed error messages
```

### Can't Find Where to Add Headers?

RevenueCat might call it:
- "Custom Headers"
- "Request Headers"
- "Additional Headers"
- Look in webhook settings or advanced options

---

## After Successful Test

Once you see **200 OK**, try a real purchase:

```bash
flutter run
```

1. Navigate to Profile
2. Tap "Get Premium"
3. Complete Test Store purchase
4. Watch profile update automatically! ✅

---

## Full API Keys Reference

### Supabase Anon Key (for Authorization header):
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8
```

### Webhook Secret (for X-RevenueCat-Secret header):
```
RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=
```

---

**Ready to test! Deploy the function and update the webhook configuration.** 🚀
