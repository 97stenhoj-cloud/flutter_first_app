# RevenueCat Integration Setup Guide

Complete guide for integrating RevenueCat with your Flutter Connect app and Supabase backend.

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Step 1: RevenueCat Dashboard Setup](#step-1-revenuecat-dashboard-setup)
- [Step 2: Configure Supabase Webhook](#step-2-configure-supabase-webhook)
- [Step 3: Configure Flutter App](#step-3-configure-flutter-app)
- [Step 4: App Store / Play Store Setup](#step-4-app-store--play-store-setup)
- [Step 5: Testing](#step-5-testing)
- [Troubleshooting](#troubleshooting)
- [Production Checklist](#production-checklist)

---

## Overview

This integration connects RevenueCat (payment processing) with Supabase (database) to manage subscriptions:

```
User → Flutter App → RevenueCat → App Store/Play Store
                         ↓
                    Webhook (on purchase)
                         ↓
                  Supabase Edge Function
                         ↓
                  Supabase Database (user_subscriptions)
                         ↓
                    Flutter App (refreshes)
```

**Key Features:**
- ✅ Real in-app purchases via Apple/Google
- ✅ Server-side receipt validation (prevents fraud)
- ✅ Automatic subscription sync to Supabase
- ✅ Sandbox testing (no real money required)
- ✅ Cross-platform support (iOS & Android)
- ✅ Subscription history audit trail

---

## Architecture

### Database Schema
The migration has added these fields to `user_subscriptions`:

| Field | Type | Description |
|-------|------|-------------|
| `revenuecat_subscription_id` | TEXT | RevenueCat's unique subscription ID |
| `product_id` | TEXT | Product purchased (e.g., `premium_monthly`) |
| `store` | TEXT | `app_store` or `play_store` |
| `expiration_date` | TIMESTAMPTZ | When subscription expires |
| `auto_renew_status` | BOOLEAN | Whether auto-renew is enabled |
| `is_trial_period` | BOOLEAN | Whether in trial period |
| `cancellation_date` | TIMESTAMPTZ | When user cancelled (if applicable) |
| `last_webhook_event` | TEXT | Last event type received |
| `last_webhook_timestamp` | TIMESTAMPTZ | When last event occurred |

### Subscription Tiers

| Tier | Product ID | Price | Features |
|------|-----------|-------|----------|
| Basic | `basic_monthly` | €6.99/mo | Ad-free, unlimited categories |
| Premium | `premium_monthly` | €11.99/mo | + Spark AI (150 questions/mo) |
| Premium+ | `premium_plus_monthly` | €19.99/mo | + Spark AI (400 questions/mo) |

---

## Prerequisites

1. **RevenueCat Account**
   - Sign up at https://app.revenuecat.com

2. **Apple Developer Account** (for iOS)
   - Required to create in-app purchase products
   - Cost: $99/year

3. **Google Play Developer Account** (for Android)
   - Required to create in-app purchase products
   - Cost: $25 one-time fee

4. **Supabase Project**
   - Already set up ✅

---

## Step 1: RevenueCat Dashboard Setup

### 1.1 Create RevenueCat Project

1. Log in to [RevenueCat Dashboard](https://app.revenuecat.com)
2. Click **New Project**
3. Name it: `Connect` (or your app name)
4. Select platforms: iOS and/or Android

### 1.2 Configure App Store Connect (iOS)

1. In RevenueCat Dashboard → **App Settings** → **iOS**
2. Enter your **Bundle ID** (e.g., `com.yourcompany.connect`)
3. Upload **App Store Connect API Key**:
   - Go to [App Store Connect](https://appstoreconnect.apple.com)
   - Users and Access → Keys → App Store Connect API
   - Create new key with **App Manager** role
   - Download `.p8` file
   - Upload to RevenueCat

### 1.3 Configure Google Play Console (Android)

1. In RevenueCat Dashboard → **App Settings** → **Android**
2. Enter your **Package Name** (e.g., `com.yourcompany.connect`)
3. Upload **Google Play Service Account JSON**:
   - Go to [Google Play Console](https://play.google.com/console)
   - Setup → API Access → Create Service Account
   - Grant **Finance** permissions
   - Create JSON key
   - Upload to RevenueCat

### 1.4 Create Products in RevenueCat

1. Go to **Products** → **Create Product**
2. Create three products:

**Basic Monthly:**
- Product ID: `basic_monthly`
- Store Product IDs:
  - iOS: `basic_monthly` (must match App Store Connect)
  - Android: `basic_monthly` (must match Google Play Console)

**Premium Monthly:**
- Product ID: `premium_monthly`
- Store Product IDs:
  - iOS: `premium_monthly`
  - Android: `premium_monthly`

**Premium+ Monthly:**
- Product ID: `premium_plus_monthly`
- Store Product IDs:
  - iOS: `premium_plus_monthly`
  - Android: `premium_plus_monthly`

### 1.5 Create Entitlements & Offerings

1. Go to **Entitlements** → **Create Entitlement**
   - Name: `premium`
   - Attach all three products

2. Go to **Offerings** → **Default Offering**
   - Add all three products
   - Set display names and descriptions

### 1.6 Get API Keys

1. Go to **Settings** → **API Keys**
2. Copy your **Public API Key** for:
   - iOS (starts with `appl_`)
   - Android (starts with `goog_`)

3. Save these for later - you'll add them to your `.env` file

---

## Step 2: Configure Supabase Webhook

### 2.1 Generate Webhook Secret

Generate a secure random secret (or use this command):

```bash
openssl rand -base64 32
```

Save this secret - you'll use it in two places.

### 2.2 Get Webhook URL

Your webhook URL is:
```
https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook
```

### 2.3 Configure Supabase Secrets

1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Select your project
3. Go to **Edge Functions** → **Manage Secrets**
4. Add secret:
   - Name: `REVENUECAT_WEBHOOK_SECRET`
   - Value: Your generated secret from step 2.1

Or use CLI:
```bash
supabase secrets set REVENUECAT_WEBHOOK_SECRET=your_secret_here
```

### 2.4 Configure RevenueCat Webhook

1. In RevenueCat Dashboard → **Integrations** → **Webhooks**
2. Click **Add Webhook**
3. Configure:
   - **URL**: `https://tpjsebutbieghpmvpktv.supabase.co/functions/v1/revenuecat-webhook`
   - **Authorization Header**: `Bearer your_secret_here` (use secret from 2.1)
   - **Events**: Select all:
     - ✅ Initial Purchase
     - ✅ Renewal
     - ✅ Cancellation
     - ✅ Expiration
     - ✅ Billing Issue
     - ✅ Product Change
     - ✅ Refund

4. Click **Save**

### 2.5 Test Webhook

1. Click **Send Test Event**
2. Select **INITIAL_PURCHASE**
3. Check Supabase **Edge Functions Logs** to verify it worked

---

## Step 3: Configure Flutter App

### 3.1 Update Environment Variables

Edit `.env` file:

```env
# RevenueCat API Keys
REVENUECAT_IOS_KEY=appl_YOUR_IOS_KEY_HERE
REVENUECAT_ANDROID_KEY=goog_YOUR_ANDROID_KEY_HERE
```

Replace with your actual keys from Step 1.6.

### 3.2 Run Flutter Commands

```bash
# Install dependencies
flutter pub get

# Generate environment code (if using envied)
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3.3 Update Build Configuration

The app uses `String.fromEnvironment()` to access keys securely.

**For iOS (Xcode):**
1. Open `ios/Runner.xcworkspace`
2. Select Runner → Build Settings → User-Defined
3. Add:
   ```
   REVENUECAT_IOS_KEY = appl_YOUR_KEY
   ```

**For Android (build.gradle):**
1. Edit `android/app/build.gradle`
2. Add to `defaultConfig`:
   ```gradle
   buildConfigField "String", "REVENUECAT_ANDROID_KEY", "\"goog_YOUR_KEY\""
   ```

Or use `--dart-define` when building:
```bash
flutter run --dart-define=REVENUECAT_IOS_KEY=appl_YOUR_KEY
```

---

## Step 4: App Store / Play Store Setup

### 4.1 Create In-App Purchase Products (iOS)

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Select your app → **In-App Purchases**
3. Create **Auto-Renewable Subscriptions**:

**Subscription Group:**
- Name: `Connect Premium Subscriptions`
- Reference Name: `connect_premium`

**Products:**
Create 3 products with these identifiers:

| Product | Identifier | Price | Duration |
|---------|-----------|-------|----------|
| Basic | `basic_monthly` | €6.99 | 1 Month |
| Premium | `premium_monthly` | €11.99 | 1 Month |
| Premium+ | `premium_plus_monthly` | €19.99 | 1 Month |

For each product:
- Add localized descriptions (English, Danish, etc.)
- Set subscription duration: **1 Month**
- Set price tier
- Submit for review

### 4.2 Create In-App Purchase Products (Android)

1. Go to [Google Play Console](https://play.google.com/console)
2. Select your app → **Monetize** → **In-app products** → **Subscriptions**
3. Create 3 subscriptions:

| Product | Product ID | Price | Billing Period |
|---------|-----------|-------|----------------|
| Basic | `basic_monthly` | €6.99 | 1 Month |
| Premium | `premium_monthly` | €11.99 | 1 Month |
| Premium+ | `premium_plus_monthly` | €19.99 | 1 Month |

For each subscription:
- Set **Base plan** with monthly recurring billing
- Add localized descriptions
- Set prices for all countries
- Save and activate

### 4.3 Configure Sandbox Testers

**iOS:**
1. App Store Connect → Users and Access → Sandbox Testers
2. Add test email addresses
3. Use these in Settings → App Store → Sandbox Account on iOS device

**Android:**
1. Google Play Console → Setup → License Testing
2. Add tester email addresses
3. Create test accounts with those emails

---

## Step 5: Testing

### 5.1 Test Without RevenueCat (Development Mode)

The app has a fallback mode when RevenueCat keys aren't configured:

1. Don't add keys to `.env`
2. Run app: `flutter run`
3. Try to subscribe → See orange "Test Mode" message
4. Subscription updates directly in database (for development only!)

### 5.2 Test With RevenueCat Sandbox

1. Add RevenueCat keys to `.env`
2. Build app: `flutter run --dart-define=REVENUECAT_IOS_KEY=your_key`
3. Sign in with sandbox tester account
4. Purchase subscription
5. Verify:
   - ✅ Purchase dialog appears (iOS/Android native)
   - ✅ Purchase completes
   - ✅ Webhook fires (check Supabase logs)
   - ✅ Database updates (check `user_subscriptions` table)
   - ✅ App shows premium features unlocked

### 5.3 Test Subscription Events

Test these scenarios:

| Event | How to Test |
|-------|-------------|
| **Initial Purchase** | Buy subscription for first time |
| **Renewal** | Wait for subscription to auto-renew (or use sandbox accelerated billing) |
| **Cancellation** | Cancel subscription in iOS Settings / Play Store |
| **Expiration** | Let cancelled subscription expire |
| **Billing Issue** | Sandbox: Remove payment method |
| **Refund** | Request refund through App Store / Play Store |

### 5.4 Check Logs

**Supabase Edge Function Logs:**
```bash
supabase functions logs revenuecat-webhook
```

**Flutter App Logs:**
Look for these tags:
- `[RevenueCat]` - SDK operations
- `[Subscription]` - Purchase flow
- `[UnlockProvider]` - Premium status updates

---

## Troubleshooting

### Problem: "No offerings available"

**Solution:**
1. Verify products exist in RevenueCat Dashboard
2. Check products are attached to entitlements
3. Ensure offering has products
4. Verify API keys are correct
5. Wait 15 minutes for cache to clear

### Problem: Purchase succeeds but database doesn't update

**Solution:**
1. Check webhook is configured in RevenueCat
2. Verify webhook secret matches in both places
3. Check Supabase Edge Function logs for errors
4. Test webhook with "Send Test Event" in RevenueCat
5. Ensure `app_user_id` matches Supabase user ID

### Problem: "Purchase not allowed"

**Solution:**
1. Verify you're using a sandbox tester account
2. Check In-App Purchases are enabled in device settings
3. Verify products exist in App Store Connect / Play Console
4. Wait for products to sync (can take 24 hours)

### Problem: Webhook returns 401 Unauthorized

**Solution:**
1. Check webhook secret is set correctly in Supabase secrets
2. Verify Authorization header format: `Bearer your_secret`
3. Make sure secret doesn't have extra whitespace

### Problem: App crashes on purchase

**Solution:**
1. Check Flutter logs for error messages
2. Verify RevenueCat SDK initialized correctly
3. Check you're using correct API keys for platform
4. Test with `flutter run --release` for production-like behavior

---

## Production Checklist

Before going live, ensure:

### RevenueCat
- [ ] Products configured for both iOS and Android
- [ ] Entitlements and offerings set up
- [ ] Webhook configured and tested
- [ ] Production API keys in use (not sandbox)
- [ ] Webhook monitoring enabled

### App Stores
- [ ] In-app purchase products approved (iOS)
- [ ] Subscriptions active (Android)
- [ ] Prices set for all regions
- [ ] Localized descriptions added
- [ ] Privacy policy includes subscription terms

### Flutter App
- [ ] Production API keys in `.env`
- [ ] API keys secured (not in version control)
- [ ] Error handling implemented
- [ ] Loading states for purchases
- [ ] Purchase restoration implemented
- [ ] Terms of Service link added
- [ ] Privacy Policy link added

### Supabase
- [ ] Webhook secret configured
- [ ] Edge Function deployed
- [ ] Database migration applied
- [ ] RLS policies reviewed
- [ ] Monitoring/alerts configured

### Testing
- [ ] Sandbox purchases tested (iOS)
- [ ] Sandbox purchases tested (Android)
- [ ] Subscription renewal tested
- [ ] Cancellation flow tested
- [ ] Refund handling tested
- [ ] Webhook logs reviewed
- [ ] Database updates verified

### Legal & Compliance
- [ ] Terms of Service updated
- [ ] Privacy Policy mentions subscriptions
- [ ] Refund policy documented
- [ ] Auto-renewal disclosure (required by Apple/Google)
- [ ] Regional pricing compliance

---

## Product ID Reference

Use these exact IDs across all platforms:

| Tier | Product ID | Description |
|------|-----------|-------------|
| Basic | `basic_monthly` | €6.99/month - Ad-free + unlimited categories |
| Premium | `premium_monthly` | €11.99/month - + Spark AI (150 questions/mo) |
| Premium+ | `premium_plus_monthly` | €19.99/month - + Spark AI (400 questions/mo) |

**Important:** These IDs must match EXACTLY in:
- RevenueCat Dashboard → Products
- App Store Connect → In-App Purchases
- Google Play Console → Subscriptions
- Flutter code → `RevenueCatService`
- Supabase webhook → `PRODUCT_TIER_MAP`

---

## Useful Links

- [RevenueCat Dashboard](https://app.revenuecat.com)
- [RevenueCat Documentation](https://www.revenuecat.com/docs)
- [App Store Connect](https://appstoreconnect.apple.com)
- [Google Play Console](https://play.google.com/console)
- [Supabase Dashboard](https://supabase.com/dashboard)
- [RevenueCat Flutter SDK](https://pub.dev/packages/purchases_flutter)

---

## Support

For issues:
1. Check [RevenueCat Community](https://community.revenuecat.com)
2. Review [Supabase Edge Functions Docs](https://supabase.com/docs/guides/functions)
3. Check app logs with `flutter logs`
4. Review webhook logs in Supabase dashboard

---

**Last Updated:** 2025-11-20
**Integration Version:** 1.0.0
