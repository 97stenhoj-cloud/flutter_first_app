# AdMob Integration Guide

This document provides a comprehensive overview of the AdMob monetization implementation in this Flutter app.

## 📋 Table of Contents

- [Overview](#overview)
- [Ad Unit IDs](#ad-unit-ids)
- [Configuration Files](#configuration-files)
- [Implementation Architecture](#implementation-architecture)
- [Ad Placement Strategy](#ad-placement-strategy)
- [Testing](#testing)
- [Revenue Projections](#revenue-projections)
- [Troubleshooting](#troubleshooting)

---

## Overview

This app uses Google AdMob for monetization with three types of ads:

1. **Banner Ads** - Small ads displayed at the bottom of menu screens
2. **Interstitial Ads** - Full-screen ads shown after game completion
3. **Rewarded Video Ads** - User-initiated video ads (future implementation for unlocking categories)

### Premium User Protection

All ads automatically respect premium subscription status:
- Premium users see **zero ads**
- Ad loading is skipped entirely for premium users
- Banner widget automatically hides for premium users

---

## Ad Unit IDs

### iOS App ID
```
ca-app-pub-5871307243361155~7756172878
```

### Android App ID
```
ca-app-pub-5871307243361155~9713904769
```

### iOS Ad Units

| Ad Type | Ad Unit ID |
|---------|-----------|
| Banner | `ca-app-pub-5871307243361155/6403296826` |
| Interstitial | `ca-app-pub-5871307243361155/1671405393` |
| Rewarded | `ca-app-pub-5871307243361155/6147327711` |

### Android Ad Units

| Ad Type | Ad Unit ID |
|---------|-----------|
| Banner | `ca-app-pub-5871307243361155/2208082709` |
| Interstitial | `ca-app-pub-5871307243361155/9895001036` |
| Rewarded | `ca-app-pub-5871307243361155/3054260511` |

---

## Configuration Files

### 1. `.env` File

Located at project root, contains AdMob App IDs:

```env
# AdMob Configuration (Production)
# iOS App ID - from AdMob dashboard
ADMOB_IOS_APP_ID=ca-app-pub-5871307243361155~7756172878
# Android App ID - from AdMob dashboard
ADMOB_ANDROID_APP_ID=ca-app-pub-5871307243361155~9713904769
```

### 2. Android Manifest

Location: `android/app/src/main/AndroidManifest.xml`

```xml
<!-- AdMob App ID (Production) -->
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-5871307243361155~9713904769"/>
```

### 3. iOS Info.plist

Location: `ios/Runner/Info.plist`

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-5871307243361155~7756172878</string>
```

### 4. Ad Configuration

Location: `lib/core/config/ad_config.dart`

Centralized configuration for all ad unit IDs with:
- Platform detection (iOS/Android)
- Test mode toggle (set `useTestAds = true` for development)
- Clean getter methods for each ad type

**To enable test ads during development:**
```dart
static const bool useTestAds = true; // Change to false for production
```

---

## Implementation Architecture

### AdService (Singleton)

Location: `lib/core/services/ad_service.dart`

Central service managing all ad operations:

**Key Features:**
- Singleton pattern for app-wide access
- Automatic retry logic with 5-second delays
- Pre-loading ads after dismissal
- Comprehensive error handling
- Debug logging for troubleshooting

**Public Methods:**

```dart
// Initialize SDK (call in main.dart)
static Future<void> initialize() async

// Banner Ads
Future<BannerAd?> loadBannerAd()
Future<void> disposeBannerAd()
bool get isBannerAdLoaded

// Interstitial Ads
Future<void> loadInterstitialAd({VoidCallback? onClosed})
Future<bool> showInterstitialAd()
bool get isInterstitialAdLoaded

// Rewarded Ads
Future<void> loadRewardedAd({Function(int amount)? onRewardEarned})
Future<bool> showRewardedAd()
bool get isRewardedAdLoaded

// Cleanup
Future<void> disposeAll()
```

### AdBannerWidget (Reusable Widget)

Location: `lib/core/widgets/ad_banner_widget.dart`

Reusable widget for banner ads with:
- Automatic premium user detection via Riverpod
- Automatic ad loading on widget init
- Proper disposal on widget unmount
- Returns empty widget for premium users

**Usage:**
```dart
const AdBannerWidget()
```

---

## Ad Placement Strategy

### ✅ Current Implementation

1. **Main Menu** (`main_menu_page.dart`)
   - Banner ad at bottom of screen
   - Visible to free users only

2. **Game Mode Selection** (`game_mode_selection_page.dart`)
   - Banner ad positioned at bottom using `Positioned` widget
   - Visible to free users only

3. **Category Selection** (`category_selection_page.dart`)
   - Banner ad at bottom below page indicators
   - Visible to free users only

4. **Profile Page** (`profile_page.dart`)
   - Banner ad at bottom of screen
   - Visible to free users only

5. **Game Completion** (`game_page.dart`)
   - Interstitial ad after finishing a game round
   - Only shown to free users
   - Skipped in Pandora (multiplayer) mode
   - Pre-loads next ad automatically

### ❌ Explicitly Avoided

- **During Gameplay** - No ads while swiping cards
  - Prevents accidental clicks
  - Avoids AdMob policy violations
  - Maintains good user experience

### 🚧 Future Implementation

**Rewarded Video for Locked Categories:**
- Allow free users to watch a video ad
- Unlock a category for 1 hour
- User-initiated, not forced
- Premium benefit: permanent access without ads

---

## Testing

### Test Mode

Enable test ads by editing `lib/core/config/ad_config.dart`:

```dart
static const bool useTestAds = true;
```

**Test Ad Unit IDs** (automatically used when test mode is enabled):
- Banner: `ca-app-pub-3940256099942544/6300978111`
- Interstitial: `ca-app-pub-3940256099942544/1033173712`
- Rewarded: `ca-app-pub-3940256099942544/5224354917`

### Debug Logging

All ad operations log to console with emoji prefixes:
- ✅ Success events
- ❌ Error events
- 📱 Banner events
- 📺 Interstitial events
- 🎁 Rewarded events
- ⚠️ Warning events

**Example logs:**
```
✅ AdMob SDK initialized
📱 Loading banner ad...
✅ Banner ad loaded
📺 Interstitial ad dismissed
❌ Rewarded ad failed to load: AdError(code: 3, domain: com.google.admob)
```

### Premium User Testing

To test premium user experience (no ads):
1. Sign in to the app
2. Complete a subscription purchase
3. Verify no ads are loaded or displayed
4. Check console logs confirm ad loading is skipped

---

## Revenue Projections

Based on 100 Daily Active Users (DAU):

### Banner Ads
- **Impressions:** 400/day (4 screens × 100 users)
- **eCPM:** $1.50 (average)
- **Daily Revenue:** $0.60
- **Monthly Revenue:** ~$18

### Interstitial Ads
- **Impressions:** 300/day (3 games × 100 users)
- **eCPM:** $6.00 (average)
- **Daily Revenue:** $1.80
- **Monthly Revenue:** ~$54

### Rewarded Video (Future)
- **Impressions:** 50/day (0.5 × 100 users)
- **eCPM:** $20.00 (average)
- **Daily Revenue:** $1.00
- **Monthly Revenue:** ~$30

### Total Projected Revenue
- **Without Rewarded Ads:** ~$72/month
- **With Rewarded Ads:** ~$102/month

**Note:** Actual revenue depends on:
- User engagement levels
- Geographic distribution
- Ad fill rates
- Seasonal fluctuations
- Premium conversion rate

---

## Troubleshooting

### Ads Not Loading

1. **Check Internet Connection**
   - Ads require network access
   - Test on real device, not just simulator

2. **Verify Ad Unit IDs**
   - Confirm IDs match AdMob dashboard
   - Check platform-specific IDs (iOS vs Android)

3. **Check Test Mode**
   - Use test ads during development
   - Don't use test ads in production builds

4. **Review Console Logs**
   - Look for error messages with ❌ prefix
   - Common errors: Invalid ad unit ID, no fill, network issues

### Banner Not Displaying

1. **Check Premium Status**
   - Verify user is not premium subscriber
   - Check `unlockProvider.isPremium` value

2. **Widget Placement**
   - Ensure `AdBannerWidget` is in widget tree
   - Check parent widget has available space

3. **Ad Loading State**
   - Verify `isBannerAdLoaded` is `true`
   - Check if ad disposal happened too early

### Interstitial Not Showing

1. **Check Loading State**
   - Verify `isInterstitialAdLoaded` is `true`
   - Allow time for ad to pre-load

2. **Pandora Mode Check**
   - Ads are disabled in multiplayer mode
   - Look for "Pandora mode - skipping ads" log

3. **Callback Issues**
   - Ensure `loadInterstitialAd()` was called before `showInterstitialAd()`
   - Check for error logs during loading

### AdMob Policy Compliance

**Important Guidelines:**
- Never click your own ads
- Don't encourage users to click ads
- No ads covering interactive elements
- Proper ad labeling (handled by SDK)
- Respect privacy regulations (GDPR, COPPA)

**Ad Placement Requirements:**
- Clear distinction from app content
- No accidental clicks from gameplay
- Proper spacing around ads
- Appropriate refresh rates

---

## Initialization

AdMob SDK is initialized in `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AdMob SDK
  await AdService.initialize();

  // ... rest of initialization
  runApp(MyApp());
}
```

---

## Dependencies

Required package in `pubspec.yaml`:

```yaml
dependencies:
  google_mobile_ads: ^6.0.0
```

---

## Additional Resources

- [AdMob Dashboard](https://apps.admob.com/)
- [Google Mobile Ads Flutter Plugin](https://pub.dev/packages/google_mobile_ads)
- [AdMob Policy Center](https://support.google.com/admob/answer/6128543)
- [Flutter AdMob Codelab](https://codelabs.developers.google.com/codelabs/admob-ads-in-flutter)

---

## Summary

This implementation provides:
- ✅ Clean, centralized ad management
- ✅ Automatic premium user protection
- ✅ Reusable banner widget component
- ✅ Auto-retry and error handling
- ✅ Platform-specific configuration
- ✅ Production-ready ad placement
- ✅ Easy test mode toggle
- ✅ Comprehensive logging

**Next Steps:**
- Monitor ad performance in AdMob dashboard
- Implement rewarded video for category unlocking
- A/B test different ad placements
- Optimize based on fill rates and eCPM
