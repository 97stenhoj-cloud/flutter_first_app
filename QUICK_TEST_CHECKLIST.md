# ✅ Quick Test Checklist

## 🚀 Test Your RevenueCat → Supabase Connection

### 1️⃣ Test Webhook (30 seconds)

**RevenueCat Dashboard → Integrations → Webhooks**
- Click **"Send Test Event"**
- Select: `INITIAL_PURCHASE`
- Expected: ✅ **200 OK**

**Supabase Dashboard → Edge Functions → Logs**
- Look for: `✅ Webhook event received`
- Expected: ✅ **Event processed successfully**

---

### 2️⃣ Test Real Purchase (2 minutes)

**In Your App:**
1. Run app: `flutter run`
2. Navigate to Profile page
3. Tap **"Get Premium"**
4. Select any tier (e.g., Premium - €11.99/month)
5. Complete Test Store purchase (FREE - sandbox mode!)
6. Return to Profile page

**Expected Result:**
- ✅ Profile shows **"Premium"** badge
- ✅ Subscription tier displayed (Basic/Premium/Premium+)
- ✅ Spark usage counter visible
- ✅ Premium features unlocked

---

### 3️⃣ Verify Logs (1 minute)

**Terminal:**
```bash
flutter logs | grep -E "RevenueCat|App|Profile"
```

**Look for:**
```
📲 [RevenueCat] Customer info updated
🔄 [App] Purchase detected, refreshing subscription status...
✅ [App] Subscription status refreshed from Supabase
```

---

### 4️⃣ Check Database (30 seconds)

**Supabase Dashboard → Table Editor → user_subscriptions**

**Your user record should show:**
- `is_premium`: ✅ `true`
- `subscription_tier`: ✅ `premium` (or your tier)
- `last_webhook_event`: ✅ `INITIAL_PURCHASE`
- `updated_at`: ✅ Recent timestamp

---

## 🎯 All Green? You're Done! 🎉

If all 4 tests pass, your integration is working perfectly!

**What happens now:**
- ✅ Every purchase automatically syncs to Supabase
- ✅ Profile page updates immediately after purchase
- ✅ Premium features unlock automatically
- ✅ Subscription status stays in sync

---

## 🐛 Something Not Working?

### Webhook Test Failed?
→ Check **[WEBHOOK_TEST_GUIDE.md](WEBHOOK_TEST_GUIDE.md)** - Troubleshooting section

### Profile Not Updating?
→ Check logs: `flutter logs | grep "Customer info updated"`
→ Verify database: Supabase → user_subscriptions table

### Need More Info?
→ **[REVENUECAT_SUPABASE_CONNECTION.md](REVENUECAT_SUPABASE_CONNECTION.md)** - Complete architecture guide
→ **[PROFILE_UPDATE_FIX_COMPLETE.md](PROFILE_UPDATE_FIX_COMPLETE.md)** - Implementation details

---

## 📱 Ready for Production?

Once testing is complete:
1. Create real products in RevenueCat Dashboard
2. Design your paywall
3. Switch to production API keys
4. Create App Store/Play Store subscriptions
5. Submit for review

See **[WEBHOOK_TEST_GUIDE.md](WEBHOOK_TEST_GUIDE.md)** for production setup steps.

---

**Happy testing! 🚀**
