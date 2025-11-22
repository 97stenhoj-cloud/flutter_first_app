# ✅ Webhook Fix - Using URL Parameter

## 🎯 Simplest Solution

Since Supabase Edge Functions can accept the API key as a URL parameter, this bypasses the JWT header issue entirely.

---

## RevenueCat Webhook Configuration

Go to [RevenueCat Dashboard → Integrations → Webhooks](https://app.revenuecat.com/settings/integrations)

### Configuration:

**URL (with apikey parameter):**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook?apikey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8
```

**Authorization Header:**
- Leave **blank** or **remove it** entirely

**Events:**
- Select **ALL** events

**Save!**

---

## How This Works

Instead of:
```
❌ Authorization: Bearer [anon-key]  → Rejected by Supabase JWT validation
```

We use:
```
✅ URL: .../webhook?apikey=[anon-key]  → Accepted by Supabase
```

The `apikey` URL parameter is the standard way Supabase accepts authentication for Edge Functions.

---

## Test It

After saving:

1. Click **"Send Test Event"**
2. Event type: `INITIAL_PURCHASE`
3. Expected: ✅ **200 OK**

---

## Check Supabase Logs

Go to [Supabase Edge Functions → Logs](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/functions/logs)

You should see:
```
ℹ️ Webhook authentication via Supabase JWT only (RevenueCat limitation)
📥 Received webhook: { event: { type: "INITIAL_PURCHASE", ... } }
✅ Processing INITIAL_PURCHASE for user ...
✅ Subscription updated for user: ...
```

---

## Full URL (Copy-Paste Ready)

```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook?apikey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8
```

---

## After Success

Once you get **200 OK**, test the complete flow:

```bash
flutter run
```

1. Navigate to Profile
2. Tap "Get Premium"
3. Complete Test Store purchase
4. Profile automatically updates to show "Premium"! ✅

---

**This should work immediately - no code changes needed!** 🚀
