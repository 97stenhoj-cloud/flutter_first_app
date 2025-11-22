# RevenueCat Modern Implementation Guide

Complete guide for implementing RevenueCat with modern UI components (Paywall & Customer Center).

---

## 🎉 What's Implemented

### ✅ Core Features
- **RevenueCat SDK** (`purchases_flutter: ^8.0.0`)
- **RevenueCat UI** (`purchases_ui_flutter: ^8.0.0`)
- **Sandbox/Test Configuration** (`test_SORroVbMBdyIwnxPEOCkedJtBzv`)
- **Supabase Integration** (Webhook syncing)
- **Modern Paywall UI** (Pre-built, customizable)
- **Customer Center** (Subscription management)

### ✅ Product Configuration
Your app uses the 3-tier monthly subscription model:

**Connect Subscription Products:**
- `basic_monthly` - Basic tier (€6.99/month)
- `premium_monthly` - Premium tier (€11.99/month)
- `premium_plus_monthly` - Premium+ tier (€19.99/month)

---

## 📚 Implementation Examples

### 1. Basic Paywall Integration

**Show paywall when user needs to upgrade:**

```dart
import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'core/services/revenue_cat_service.dart';

Future<void> showUpgradePrompt(BuildContext context) async {
  final result = await RevenueCatService.presentPaywall();

  if (result == PaywallResult.purchased) {
    // User subscribed!
    print('🎉 User is now subscribed!');
  }
}
```

**Or use the pre-built button widget:**

```dart
import 'features/subscription/presentation/widgets/modern_paywall_button.dart';

// In your widget tree:
ModernPaywallButton(
  onPurchased: () {
    print('User subscribed!');
    // Navigate to premium content
  },
)
```

### 2. Check Subscription Status

**Modern way (using entitlements):**

```dart
// Check if user has "TechyKoala Pro" entitlement
final hasPro = await RevenueCatService.hasActiveProEntitlement();

if (hasPro) {
  // Show premium features
} else {
  // Show paywall
  await RevenueCatService.presentPaywall();
}
```

**Alternative (check any subscription):**

```dart
final hasAnySubscription = await RevenueCatService.hasAnyActiveSubscription();
```

### 3. Customer Center Integration

**Add to settings page:**

```dart
import 'features/subscription/presentation/widgets/customer_center_button.dart';

// As a list tile in settings:
CustomerCenterListTile(
  title: 'Manage Subscription',
  subtitle: 'View plans, cancel, or restore purchases',
)

// Or as a button:
CustomerCenterButton(
  label: 'Manage Subscription',
)
```

**Direct call:**

```dart
await RevenueCatService.presentCustomerCenter();
```

### 4. Complete Subscription Page

**Use the pre-built modern page:**

```dart
import 'features/subscription/presentation/pages/modern_subscription_page.dart';

// Navigate to subscription page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ModernSubscriptionPage(),
  ),
);
```

This page includes:
- Subscription status display
- Paywall button (for non-subscribers)
- Customer Center button (for subscribers)
- Restore purchases
- Feature list

### 5. Restore Purchases

```dart
final customerInfo = await RevenueCatService.restorePurchases();

if (customerInfo != null) {
  // Purchases restored successfully
  print('✅ Purchases restored');
} else {
  print('No purchases found');
}
```

### 6. Get Detailed Subscription Info

```dart
final info = await RevenueCatService.getSubscriptionInfo();

print('Has subscription: ${info['has_active_subscription']}');
print('Active entitlements: ${info['active_entitlements']}');
print('Products: ${info['active_subscriptions']}');
print('Expires: ${info['latest_expiration_date']}');
```

---

## 🎨 RevenueCat Dashboard Configuration

### Step 1: Create Products

Go to RevenueCat Dashboard → **Products** → **Create Product**

**For Connect:**
1. **Basic Monthly**
   - Product ID: `basic_monthly`
   - Store IDs: `basic_monthly` (iOS & Android)
   - Price: €6.99/month

2. **Premium Monthly**
   - Product ID: `premium_monthly`
   - Store IDs: `premium_monthly` (iOS & Android)
   - Price: €11.99/month

3. **Premium+ Monthly**
   - Product ID: `premium_plus_monthly`
   - Store IDs: `premium_plus_monthly` (iOS & Android)
   - Price: €19.99/month

### Step 2: Create Entitlement

1. Go to **Entitlements** → **Create Entitlement**
2. Name: `pro` (matches `RevenueCatService.entitlementPro`)
3. Attach all three subscription products (basic_monthly, premium_monthly, premium_plus_monthly)

### Step 3: Create Offering

1. Go to **Offerings** → **Default Offering**
2. Add all three subscription products
3. Set display order (e.g., Premium+, Premium, Basic)
4. Configure display names and descriptions

### Step 4: Configure Paywall

1. Go to **Paywalls** (in RevenueCat Dashboard)
2. Create or edit default paywall
3. Customize:
   - Colors
   - Images
   - Text/copy
   - Button labels
   - Featured product
4. Preview on device

### Step 5: Set Up Customer Center

1. Go to **Customer Center** settings
2. Enable features:
   - ✅ Manage subscription
   - ✅ Change plan
   - ✅ Cancel subscription
   - ✅ Restore purchases
3. Customize appearance

---

## 📱 App Store / Play Store Setup

### iOS (App Store Connect)

1. Create **Auto-Renewable Subscription Group**:
   - Name: "Connect Premium"

2. Create **Subscriptions**:
   - `basic_monthly`: €6.99/month
   - `premium_monthly`: €11.99/month
   - `premium_plus_monthly`: €19.99/month

3. Add localized descriptions in all supported languages

### Android (Google Play Console)

1. Go to **Monetize** → **Subscriptions**

2. Create **Subscription Products**:
   - `basic_monthly`: €6.99/month
   - `premium_monthly`: €11.99/month
   - `premium_plus_monthly`: €19.99/month

3. Activate all products

---

## 🧪 Testing Sandbox Purchases

### Current Setup
- ✅ Test key configured: `test_SORroVbMBdyIwnxPEOCkedJtBzv`
- ✅ Sandbox mode active (no real money)

### iOS Testing

1. **Create Sandbox Tester**:
   - App Store Connect → Users and Access → Sandbox Testers
   - Add test email

2. **Sign in on device**:
   - Settings → App Store → Sandbox Account
   - Sign in with test email

3. **Test purchase**:
   - Run app
   - Tap upgrade button
   - Complete sandbox purchase (free!)

### Android Testing

1. **Add License Tester**:
   - Play Console → Setup → License Testing
   - Add test email

2. **Install test build**:
   - Use internal testing track
   - Or upload APK via Play Console

3. **Test purchase**:
   - Sign in with test account
   - Complete purchase (test mode)

---

## 🔗 Integration with Existing App

### Update Subscription Page

Replace your current subscription logic:

**Before (manual):**
```dart
await ref.read(unlockProvider.notifier).updateSubscriptionTier(tier);
```

**After (with RevenueCat):**
```dart
final result = await RevenueCatService.presentPaywall();

if (result == PaywallResult.purchased) {
  // Webhook will update Supabase automatically
  await ref.read(unlockProvider.notifier).initialize();
}
```

### Update Premium Checks

**Option 1: Use RevenueCat directly**
```dart
final hasPro = await RevenueCatService.hasActiveProEntitlement();
```

**Option 2: Keep using UnlockProvider** (Supabase-based)
```dart
final isPremium = ref.watch(unlockProvider).isPremium;
```

The webhook keeps both in sync!

### Add Customer Center to Settings

In your settings/profile page:

```dart
CustomerCenterListTile(
  title: 'Manage Subscription',
  subtitle: 'View your plan and billing',
)
```

---

## 🎯 Best Practices

### 1. Always Check Entitlements

```dart
// ✅ Good - Checks server-side status
final hasPro = await RevenueCatService.hasActiveProEntitlement();

// ❌ Bad - Only checks local cache
final isPremium = userPrefs.getBool('isPremium') ?? false;
```

### 2. Handle Purchase Results

```dart
final result = await RevenueCatService.presentPaywall();

switch (result) {
  case PaywallResult.purchased:
    // Success! User is now subscribed
    analyticsService.logEvent('subscription_purchased');
    break;

  case PaywallResult.restored:
    // Purchases restored
    analyticsService.logEvent('subscription_restored');
    break;

  case PaywallResult.cancelled:
    // User cancelled
    break;

  case PaywallResult.error:
    // Handle error
    showErrorDialog();
    break;
}
```

### 3. Sync with Supabase

The webhook automatically updates Supabase when purchases happen. To refresh local state:

```dart
// After purchase completes
await ref.read(unlockProvider.notifier).initialize();
```

### 4. Error Handling

```dart
try {
  await RevenueCatService.presentPaywall();
} catch (e) {
  // Log error
  print('Paywall error: $e');

  // Show fallback
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FallbackSubscriptionPage(),
    ),
  );
}
```

### 5. Offering Variations

Show different offerings for different contexts:

```dart
// Show specific offering
await RevenueCatService.presentPaywall(offeringId: 'summer_sale');

// Or use default
await RevenueCatService.presentPaywall();
```

---

## 📊 Webhook Configuration

Your Supabase webhook is already deployed! It handles:

- ✅ `INITIAL_PURCHASE` - First subscription
- ✅ `RENEWAL` - Auto-renewal
- ✅ `CANCELLATION` - User cancels
- ✅ `EXPIRATION` - Subscription expires
- ✅ `REFUND` - Refund processed
- ✅ `PRODUCT_CHANGE` - Plan upgrade/downgrade

**Webhook URL:**
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

**Configure in RevenueCat:**
1. Dashboard → Integrations → Webhooks
2. Add webhook URL
3. Set Authorization header: `Bearer YOUR_SECRET`
4. Enable all events

---

## 🚀 Quick Start Checklist

### Setup (One-time)
- [x] Install packages (`purchases_flutter`, `purchases_ui_flutter`)
- [x] Configure API key (`test_SORroVbMBdyIwnxPEOCkedJtBzv`)
- [x] Initialize in main.dart
- [x] Create RevenueCatService
- [ ] Create products in RevenueCat Dashboard
- [ ] Create entitlement (`pro`)
- [ ] Create offering (default)
- [ ] Configure paywall design
- [ ] Set up webhook in RevenueCat
- [ ] Create sandbox tester accounts

### Implementation
- [x] Import `RevenueCatService`
- [x] Use `presentPaywall()` for purchases
- [x] Use `presentCustomerCenter()` for management
- [x] Check entitlements with `hasActiveProEntitlement()`
- [x] Add restore purchases button

### Testing
- [ ] Run app: `flutter run`
- [ ] Check logs for SDK initialization
- [ ] Test paywall display
- [ ] Test sandbox purchase
- [ ] Verify webhook fires
- [ ] Check Supabase database updates
- [ ] Test Customer Center

---

## 📖 Additional Resources

- **RevenueCat Docs**: https://www.revenuecat.com/docs
- **Paywall Configuration**: https://www.revenuecat.com/docs/tools/paywalls
- **Customer Center**: https://www.revenuecat.com/docs/tools/customer-center
- **Flutter SDK**: https://www.revenuecat.com/docs/getting-started/installation/flutter

---

## 🎯 Example: Complete Purchase Flow

```dart
import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'core/services/revenue_cat_service.dart';

class FeatureLockedScreen extends StatelessWidget {
  const FeatureLockedScreen({super.key});

  Future<void> _unlock(BuildContext context) async {
    // Check if already subscribed
    final hasPro = await RevenueCatService.hasActiveProEntitlement();

    if (hasPro) {
      // Already subscribed, proceed
      Navigator.pop(context);
      return;
    }

    // Show paywall
    final result = await RevenueCatService.presentPaywall();

    if (!context.mounted) return;

    if (result == PaywallResult.purchased ||
        result == PaywallResult.restored) {
      // Success!
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 Welcome to Pro!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 100),
            const SizedBox(height: 20),
            const Text('This is a Premium Feature'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _unlock(context),
              child: const Text('Upgrade to Pro'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

**You're all set!** 🚀

The modern RevenueCat implementation is complete. Just create products in the dashboard and start testing!
