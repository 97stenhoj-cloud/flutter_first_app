# 🔗 RevenueCat Webhook Setup Instructions

## Issue: Purchases Don't Update Profile

Your Test Store purchase succeeded, but the profile didn't update because the webhook isn't configured yet.

---

## Quick Fix (2 Steps)

### Step 1: Set Supabase Secret

1. Go to [Supabase Dashboard](https://supabase.com/dashboard/project/tpjsebutbieghpmvpktv)
2. Navigate to **Edge Functions** → **Manage Secrets**
3. Add new secret:
   - **Name**: `REVENUECAT_WEBHOOK_SECRET`
   - **Value**: `RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`
4. Click **Save**

### Step 2: Configure RevenueCat Webhook

1. Go to [RevenueCat Dashboard](https://app.revenuecat.com)
2. Navigate to **Integrations** → **Webhooks**
3. Click **+ Add Webhook**
4. Configure:
   - **URL**: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
   - **Authorization Header**: `Bearer RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=`
   - **Events**: Select ALL (Initial Purchase, Renewal, Cancellation, etc.)
5. Click **Save**

---

## Test the Webhook

After configuration:

1. Click **Send Test Event** in RevenueCat webhook settings
2. Select event type: **INITIAL_PURCHASE**
3. Check Supabase **Edge Functions Logs**:
   - Should see: ✅ `Subscription updated for user...`

---

## Alternative: Manual Update for Testing

If you want to test immediately without webhook setup:

1. In your app, tap **Unsubscribe** button
2. Go back to subscription page
3. Try purchasing again
4. The app will refresh subscription status

Or use the modern paywall instead:

```dart
// Show RevenueCat's modern paywall
await RevenueCatService.presentPaywall();
```

This automatically handles the purchase and updates!

---

## Why This Happens

**Current Flow:**
```
Purchase → RevenueCat ✅
RevenueCat → Supabase ❌ (webhook not configured)
Supabase → App ❌ (no update)
```

**After Webhook Setup:**
```
Purchase → RevenueCat ✅
RevenueCat → Supabase Webhook ✅
Supabase Database → Updated ✅
App Refresh → Shows subscription ✅
```

---

## Quick Reference

**Webhook URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Authorization Header:**
```
Bearer RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=
```

**Secret for Supabase:**
```
RdVUm3TpymWmFoVz0eyX6m2dvJqp0fVZH8DQphGGWtw=
```

---

## Modern Paywall (Better UX)

Instead of your current subscription page, use the modern paywall:

**Add to your profile page:**

```dart
import 'core/services/revenue_cat_service.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

// Replace "Get Premium" button with:
ElevatedButton(
  onPressed: () async {
    final result = await RevenueCatService.presentPaywall();

    if (result == PaywallResult.purchased) {
      // Refresh profile
      setState(() {});

      // Show success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Welcome to Premium!')),
      );
    }
  },
  child: Text('Get Premium'),
)
```

This provides:
- ✨ Beautiful native UI
- 🎯 Better conversion rates
- ✅ Automatic purchase handling
- 🔄 Auto-refresh on purchase

---

**After webhook setup, your purchases will automatically sync to Supabase!** 🚀
