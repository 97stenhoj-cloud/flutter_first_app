# ✅ Simple Webhook Setup (RevenueCat Limitation - One Header Only)

## 🎯 Quick Setup

Since RevenueCat only supports **ONE** authorization header, we'll use the Supabase anon key for JWT authentication.

---

## Step 1: Deploy Updated Webhook Function

The function has been updated to work with a single authorization header:

```bash
cd /Users/stenhoej/Desktop/flutter_first_app
npx supabase functions deploy revenuecat-webhook
```

---

## Step 2: Configure RevenueCat Webhook

Go to [RevenueCat Dashboard → Integrations → Webhooks](https://app.revenuecat.com/settings/integrations)

### Webhook Configuration:

**URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Authorization Header:**
```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8
```
*(This is your Supabase anon key)*

**Events:**
- Select **ALL** events

**Save!**

---

## Step 3: Test the Webhook

Click **"Send Test Event"** in RevenueCat

- Event type: `INITIAL_PURCHASE`
- Expected: ✅ **200 OK**

---

## Step 4: Verify in Supabase

Go to [Supabase Edge Functions → Logs](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/functions/logs)

You should see:
```
ℹ️ Webhook authentication via Supabase JWT only (RevenueCat limitation)
📥 Received webhook: { event: { type: "INITIAL_PURCHASE", ... } }
✅ Subscription updated for user: ...
```

---

## ✅ That's It!

**Simple configuration:**
- ✅ One URL
- ✅ One authorization header (Supabase anon key)
- ✅ Works with RevenueCat's limitation

---

## 🔒 Security Notes

### For Sandbox/Testing (Current Setup):
- ✅ Supabase JWT authentication protects the endpoint
- ✅ Only requests with valid anon key can access
- ✅ Good enough for testing and sandbox mode

### For Production (Future):
Consider adding:
- 🔐 **IP Whitelisting**: Only accept requests from RevenueCat IPs
- 🔐 **Request Validation**: Verify request structure matches RevenueCat format
- 🔐 **Rate Limiting**: Prevent abuse
- 🔐 **Monitoring**: Alert on suspicious activity

RevenueCat's webhook IPs (for whitelisting):
- Check: https://www.revenuecat.com/docs/webhooks#ip-addresses

---

## 📊 Quick Reference

### Supabase Anon Key (for Authorization):
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwanNlYnV0YmllamhwbXZwa3R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5MjkwNzAsImV4cCI6MjA0NzUwNTA3MH0.nH-OgU2YG3SFTcU_L6Z0Sh6QjvXd4cH6gP3_MqS7Vy8
```

### Webhook URL:
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

---

## 🧪 After Setup: Test Purchase Flow

```bash
flutter run
```

1. Navigate to Profile
2. Tap "Get Premium"
3. Complete Test Store purchase (FREE!)
4. Watch profile update automatically! ✅

---

## 🐛 Troubleshooting

### Still Getting 401?
- Double-check the authorization header is exactly as shown above
- Make sure you deployed the updated function
- Check Supabase logs for detailed error messages

### Webhook Returns 200 but Database Not Updating?
- Check Supabase Edge Functions logs for errors
- Verify the secret is set: Dashboard → Edge Functions → Manage Secrets → `REVENUECAT_WEBHOOK_SECRET`
- Check user_subscriptions table for recent updates

### Can't Deploy Function?
```bash
# Make sure you're logged in to Supabase CLI
npx supabase login

# Then deploy
npx supabase functions deploy revenuecat-webhook
```

---

**Ready to test! Deploy the function and configure the webhook.** 🚀
