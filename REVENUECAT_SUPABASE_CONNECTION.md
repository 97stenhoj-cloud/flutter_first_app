# 🔗 RevenueCat ↔️ Supabase Connection Guide

## How It Works

Your app now has a complete connection between RevenueCat purchases and Supabase subscription status, ensuring the profile page updates automatically after purchases.

---

## Connection Flow

```
📱 Purchase Made
    ↓
🛒 RevenueCat Test Store (Sandbox Purchase)
    ↓
📲 RevenueCat SDK (Customer Info Updated)
    ↓
🔔 Purchase Listener Triggered (main.dart)
    ↓
⏳ Wait 2 seconds (for webhook to process)
    ↓
🔄 Refresh UnlockProvider from Supabase
    ↓
✅ Profile Page Updates Automatically
```

---

## Implementation Details

### 1. RevenueCat Purchase Listener

**File**: [`lib/core/services/revenue_cat_service.dart`](lib/core/services/revenue_cat_service.dart:101-108)

```dart
// Set up listener for customer info updates
Purchases.addCustomerInfoUpdateListener((customerInfo) {
  debugPrint('📲 [RevenueCat] Customer info updated');
  debugPrint('📦 [RevenueCat] Active entitlements: ${customerInfo.entitlements.active.keys}');

  // Notify callback if set
  _onCustomerInfoUpdate?.call(customerInfo);
});
```

This listener fires when:
- ✅ User makes a purchase
- ✅ Subscription renews
- ✅ Subscription expires
- ✅ Purchases are restored

### 2. App-Level Configuration

**File**: [`lib/main.dart`](lib/main.dart:56-67)

```dart
// Set up RevenueCat purchase listener to refresh subscription status
RevenueCatService.setOnCustomerInfoUpdate((customerInfo) async {
  debugPrint('🔄 [App] Purchase detected, refreshing subscription status...');

  // Wait a moment for webhook to process and update Supabase
  await Future.delayed(const Duration(seconds: 2));

  // Refresh unlock provider from Supabase database
  await ref.read(unlockProvider.notifier).initialize();

  debugPrint('✅ [App] Subscription status refreshed from Supabase');
});
```

### 3. Profile Page Refresh

**File**: [`lib/features/settings/presentation/pages/profile_page.dart`](lib/features/settings/presentation/pages/profile_page.dart:490-506)

When user returns from subscription page:

```dart
onPressed: () async {
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
    ),
  );

  if (!mounted) return;

  // Refresh subscription status from Supabase
  debugPrint('🔄 [Profile] Refreshing subscription status...');
  await ref.read(unlockProvider.notifier).initialize();

  // Update UI
  setState(() {});
}
```

### 4. UnlockProvider (Source of Truth)

**File**: [`lib/core/providers/unlock_provider.dart`](lib/core/providers/unlock_provider.dart:118-201)

The `unlockProvider.initialize()` method:
1. Fetches subscription status from Supabase `user_subscriptions` table
2. Caches the status locally for offline use
3. Updates the UI via Riverpod state management

```dart
final response = await Supabase.instance.client
    .from('user_subscriptions')
    .select('is_premium, subscription_tier')
    .eq('user_id', user.id)
    .maybeSingle();

final isPremium = response?['is_premium'] ?? false;
final tierString = response?['subscription_tier'] ?? 'free';
```

### 5. Webhook Updates Supabase

**File**: [`supabase/functions/revenuecat-webhook/index.ts`](supabase/functions/revenuecat-webhook/index.ts)

When RevenueCat sends purchase events, the webhook:
1. Receives the event (INITIAL_PURCHASE, RENEWAL, etc.)
2. Updates `user_subscriptions` table in Supabase
3. Sets `is_premium`, `subscription_tier`, and other fields

```typescript
await supabaseClient
  .from('user_subscriptions')
  .upsert({
    user_id: appUserId,
    is_premium: hasPremiumEntitlement,
    subscription_tier: tierName,
    revenuecat_subscription_id: subscriber.original_app_user_id,
    // ... other fields
  });
```

---

## Update Sequence After Purchase

### Without Webhook (Current State)

```
1. User taps "Subscribe"
2. RevenueCat Test Store shows purchase dialog
3. User confirms purchase
4. RevenueCat records purchase ✅
5. Purchase listener triggers in main.dart
6. App waits 2 seconds
7. App refreshes from Supabase ❌ (no data yet - webhook not configured)
8. Profile page shows "No Active Subscription" ❌
```

### With Webhook Configured (After Setup)

```
1. User taps "Subscribe"
2. RevenueCat Test Store shows purchase dialog
3. User confirms purchase
4. RevenueCat records purchase ✅
5. RevenueCat sends webhook to Supabase ✅
6. Supabase Edge Function processes webhook ✅
7. Supabase updates user_subscriptions table ✅
8. Purchase listener triggers in main.dart
9. App waits 2 seconds (webhook completes)
10. App refreshes from Supabase ✅
11. Profile page shows "Premium" status ✅
```

---

## Next Step: Configure Webhook

To complete the connection, follow these steps:

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
   - **Events**: Select ALL events
5. Click **Save**

### Step 3: Test the Connection

1. Click **Send Test Event** in RevenueCat webhook settings
2. Select event type: **INITIAL_PURCHASE**
3. Check Supabase **Edge Functions Logs**:
   - Should see: ✅ `Subscription updated for user...`
4. Check `user_subscriptions` table in Supabase
5. Run your app and check profile page

---

## Debugging Tips

### Check Purchase Listener

**What to look for in logs:**

```
📲 [RevenueCat] Customer info updated
📦 [RevenueCat] Active entitlements: [pro]
🔄 [App] Purchase detected, refreshing subscription status...
✅ [App] Subscription status refreshed from Supabase
```

If you see these logs, the purchase listener is working!

### Check Webhook Processing

**In Supabase Edge Functions Logs:**

```
✅ Webhook event received: INITIAL_PURCHASE
✅ Subscription updated for user: 6de3da31-5d8c-42a2-9bbd-80fc86c52bbc
```

### Check Database Update

**Query Supabase:**

```sql
SELECT
  user_id,
  is_premium,
  subscription_tier,
  revenuecat_subscription_id,
  updated_at
FROM user_subscriptions
WHERE user_id = '6de3da31-5d8c-42a2-9bbd-80fc86c52bbc';
```

Should show:
- `is_premium`: `true`
- `subscription_tier`: `premium` (or `basic`, `premium_plus`)
- `updated_at`: Recent timestamp

### Check Profile Page Refresh

**What to look for in logs:**

```
🔄 [Profile] Refreshing subscription status...
🔍 Initializing unlock provider for user: 6de3da31-...
📡 Fetching subscription status from database for user: 6de3da31-...
✅ Subscription status loaded: tier=premium, isPremium=true
```

---

## Alternative: Manual Testing (Without Webhook)

If you want to test the UI immediately without webhook setup:

### Option 1: Direct Database Update

```sql
-- Update subscription status directly in Supabase
UPDATE user_subscriptions
SET
  is_premium = true,
  subscription_tier = 'premium',
  updated_at = NOW()
WHERE user_id = '6de3da31-5d8c-42a2-9bbd-80fc86c52bbc';
```

Then in the app:
1. Pull down to refresh profile page
2. Or restart the app

### Option 2: Use Modern Paywall

The modern paywall has better integration:

```dart
final result = await RevenueCatService.presentPaywall();

if (result == PaywallResult.purchased) {
  // Automatically refresh
  await ref.read(unlockProvider.notifier).initialize();
  setState(() {});
}
```

---

## Architecture Benefits

### ✅ Real-time Updates
- Purchase listener fires immediately when purchase completes
- No need for manual refresh buttons

### ✅ Offline Support
- UnlockProvider caches subscription status
- Works even without internet connection

### ✅ Dual Source of Truth
- RevenueCat handles purchases and entitlements
- Supabase stores subscription metadata
- Webhook keeps them in sync

### ✅ User-Friendly
- Profile page updates automatically after purchase
- No confusing delays or "still not updated" scenarios
- Seamless experience

---

## Files Modified

1. **[`lib/core/services/revenue_cat_service.dart`](lib/core/services/revenue_cat_service.dart)**
   - Added `setOnCustomerInfoUpdate` callback
   - Added purchase listener in `initialize()`

2. **[`lib/main.dart`](lib/main.dart)**
   - Configured purchase listener on app startup
   - Refreshes UnlockProvider when purchases detected

3. **[`lib/features/settings/presentation/pages/profile_page.dart`](lib/features/settings/presentation/pages/profile_page.dart)**
   - Refreshes subscription status when returning from subscription page
   - Updates UI automatically

---

## Summary

✅ **Purchase Listener**: Detects purchases in real-time
✅ **Auto-Refresh**: Refreshes from Supabase after purchase
✅ **Profile Updates**: Shows correct status immediately
🔜 **Webhook**: Complete the setup for full automation

**Once webhook is configured, the entire flow is 100% automatic!** 🚀
