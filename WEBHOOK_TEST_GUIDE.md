# 🧪 Webhook Testing Guide

## ✅ Setup Complete!

You've configured:
- ✅ Supabase Edge Function secret: `REVENUECAT_WEBHOOK_SECRET`
- ✅ RevenueCat webhook integration

Now let's test the complete flow!

---

## 🎯 Test 1: Send Test Event from RevenueCat

This verifies the webhook connection works.

### Steps:

1. **Go to RevenueCat Dashboard**
   - Navigate to: [RevenueCat Integrations → Webhooks](https://app.revenuecat.com/settings/integrations)

2. **Find Your Webhook**
   - Should show: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
   - Status should be: Active ✅

3. **Send Test Event**
   - Click **"Send Test Event"** or **"Test"** button
   - Select event type: **`INITIAL_PURCHASE`**
   - Click **Send**

4. **Check Webhook Response**
   - RevenueCat should show: **200 OK** ✅
   - If you see an error, check the response details

### Expected Result:

✅ **Success**: 200 OK response
✅ **Webhook fired**: Event sent to Supabase
✅ **Edge Function executed**: Processed the test event

---

## 🔍 Test 2: Verify Supabase Received the Event

Check that Supabase processed the webhook.

### Steps:

1. **Open Supabase Dashboard**
   - Go to: [Edge Functions → Logs](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/functions/logs)

2. **Filter Logs**
   - Function: `revenuecat-webhook`
   - Time range: Last 15 minutes

3. **Look for Success Messages**
   ```
   ✅ Webhook event received: INITIAL_PURCHASE
   ✅ Subscription updated for user: [user_id]
   ```

### Expected Result:

✅ **Logs show**: Webhook received and processed
✅ **No errors**: Function completed successfully
✅ **Database updated**: User subscription modified

---

## 🛒 Test 3: Real Sandbox Purchase

Test the complete end-to-end flow with a real purchase.

### Before You Start:

Make sure you have:
- ✅ App running on device/simulator
- ✅ Logged into your app with user: `6de3da31-5d8c-42a2-9bbd-80fc86c52bbc`
- ✅ RevenueCat Test Store configured (sandbox mode)

### Steps:

1. **Run the App**
   ```bash
   flutter run
   ```

2. **Navigate to Profile**
   - Open the app
   - Go to Settings/Profile page
   - Current status should show: **"No Active Subscription"** (if first time)

3. **Tap "Get Premium"**
   - This opens the subscription page

4. **Select a Subscription Tier**
   - Choose: Premium (€11.99/month)
   - Or any other tier

5. **Complete Purchase**
   - Test Store purchase dialog appears
   - Tap **"Subscribe"** or **"Buy"**
   - **NO REAL MONEY IS CHARGED** (sandbox mode)
   - Purchase completes

6. **Watch the Logs**
   ```bash
   # In another terminal:
   flutter logs | grep -E "RevenueCat|App|Profile|Subscription"
   ```

   You should see:
   ```
   📲 [RevenueCat] Customer info updated
   📦 [RevenueCat] Active entitlements: [pro]
   🔄 [App] Purchase detected, refreshing subscription status...
   ⏳ Waiting for webhook to process...
   📡 Fetching subscription status from database...
   ✅ Subscription status loaded: tier=premium, isPremium=true
   ✅ [App] Subscription status refreshed from Supabase
   ```

7. **Return to Profile Page**
   - Navigate back to profile
   - Additional refresh triggers:
   ```
   🔄 [Profile] Refreshing subscription status...
   ```

8. **Verify Profile Shows Premium**
   - Status card shows: **"Premium"** badge ✅
   - Or appropriate tier (Basic/Premium+)
   - Premium features listed
   - Spark usage counter visible (if Premium/Premium+)

### Expected Result:

✅ **Purchase completes** in RevenueCat Test Store
✅ **Logs show** purchase detected
✅ **Webhook fires** to Supabase
✅ **Database updates** within 2 seconds
✅ **App refreshes** automatically
✅ **Profile shows** "Premium" status

---

## 🔍 Test 4: Verify Database Update

Confirm Supabase database was updated correctly.

### Steps:

1. **Open Supabase Dashboard**
   - Go to: [Table Editor → user_subscriptions](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv/editor)

2. **Find Your User Record**
   - Filter by `user_id`: `6de3da31-5d8c-42a2-9bbd-80fc86c52bbc`
   - Or search for your email

3. **Check Fields**
   - `is_premium`: Should be `true` ✅
   - `subscription_tier`: Should be `premium` (or `basic`, `premium_plus`)
   - `revenuecat_subscription_id`: Should have a value
   - `product_id`: Should show product (e.g., `premium_monthly`)
   - `store`: Should show `app_store` or `play_store`
   - `expiration_date`: Should have a date
   - `last_webhook_event`: Should show `INITIAL_PURCHASE`
   - `last_webhook_timestamp`: Should be recent
   - `updated_at`: Should be within last few minutes

### Expected Result:

✅ **All fields populated** correctly
✅ **Timestamps recent** (within last few minutes)
✅ **Premium status** = `true`

---

## 🐛 Troubleshooting

### Issue 1: Webhook Returns Error

**Symptoms:**
- RevenueCat test event shows 401, 403, or 500 error
- Supabase logs show authentication error

**Fix:**
1. Check Supabase secret is set correctly:
   - Dashboard → Edge Functions → Manage Secrets
   - `REVENUECAT_WEBHOOK_SECRET` should match RevenueCat authorization header
2. Verify RevenueCat webhook authorization header:
   - Should be: `Bearer RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`
3. Re-deploy Edge Function if needed:
   ```bash
   cd supabase/functions
   supabase functions deploy revenuecat-webhook
   ```

### Issue 2: Profile Doesn't Update After Purchase

**Symptoms:**
- Purchase completes successfully
- Profile still shows "No Active Subscription"
- Logs don't show refresh

**Fix:**
1. Check purchase listener is configured:
   ```bash
   flutter logs | grep "Customer info updated"
   ```
2. Check database was updated:
   - Supabase → user_subscriptions table
3. Manually refresh:
   - Pull down on profile page
   - Or restart the app

### Issue 3: Database Not Updating

**Symptoms:**
- Webhook succeeds (200 OK)
- But `user_subscriptions` table not updated
- Supabase logs show errors

**Fix:**
1. Check Edge Function logs for errors:
   - Dashboard → Edge Functions → Logs
2. Verify RLS policies allow webhook to write:
   ```sql
   -- Should exist in your schema:
   CREATE POLICY "Service role can manage all subscriptions"
   ON user_subscriptions FOR ALL
   TO service_role
   USING (true)
   WITH CHECK (true);
   ```
3. Check webhook secret is correct

### Issue 4: No Logs Appearing

**Symptoms:**
- Can't see any logs in Supabase
- Webhook seems to send but no confirmation

**Fix:**
1. Wait 30-60 seconds for logs to appear
2. Refresh Supabase logs page
3. Check correct function is selected: `revenuecat-webhook`
4. Try sending another test event

---

## 📊 Success Checklist

After completing all tests, you should have:

- ✅ Test webhook event returns 200 OK
- ✅ Supabase logs show successful processing
- ✅ Sandbox purchase completes without errors
- ✅ App logs show purchase detection and refresh
- ✅ Database shows updated subscription data
- ✅ Profile page displays premium status
- ✅ Premium features unlock (Spark, offline mode, etc.)

---

## 🎯 Next Steps After Successful Testing

### 1. Create Products in RevenueCat Dashboard

**Current**: Using Test Store products for 3-tier subscriptions

**For Production**:
1. Go to: RevenueCat Dashboard → Products
2. Create products matching your tiers:
   - `basic_monthly` - Basic subscription (€6.99/month)
   - `premium_monthly` - Premium subscription (€11.99/month)
   - `premium_plus_monthly` - Premium+ subscription (€19.99/month)
3. Link to App Store/Play Store product IDs
4. Create entitlement: `pro`
5. Create offering: `default`

### 2. Design Your Paywall

1. Go to: RevenueCat Dashboard → Paywalls
2. Customize colors, images, text
3. Set featured product
4. Preview on device

### 3. Switch to Production Keys

When ready to go live:

1. **Get Production API Keys**:
   - RevenueCat Dashboard → API Keys
   - Copy production keys (not test keys)

2. **Update `.env` file**:
   ```env
   REVENUECAT_IOS_KEY=appl_production_key_here
   REVENUECAT_ANDROID_KEY=goog_production_key_here
   ```

3. **Rebuild the app**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter build ios --release
   flutter build appbundle --release
   ```

### 4. Create App Store/Play Store Products

**iOS (App Store Connect)**:
- Create subscription group
- Add subscriptions: basic_monthly, premium_monthly, premium_plus_monthly
- Submit for review

**Android (Google Play Console)**:
- Create subscription products
- Add base plans
- Activate products

---

## 📖 Related Documentation

- **[REVENUECAT_SUPABASE_CONNECTION.md](REVENUECAT_SUPABASE_CONNECTION.md)** - Architecture and connection flow
- **[PROFILE_UPDATE_FIX_COMPLETE.md](PROFILE_UPDATE_FIX_COMPLETE.md)** - What was implemented
- **[WEBHOOK_SETUP_INSTRUCTIONS.md](WEBHOOK_SETUP_INSTRUCTIONS.md)** - Initial webhook setup
- **[REVENUECAT_IMPLEMENTATION_GUIDE.md](REVENUECAT_IMPLEMENTATION_GUIDE.md)** - Code examples

---

## 🎉 You're All Set!

Your RevenueCat → Supabase → Profile connection is now fully functional!

**Test the complete flow and verify everything works as expected.** 🚀

If you encounter any issues, check the troubleshooting section or review the logs for specific error messages.
