# Manual Screenshot Guide

If the automated script doesn't work, follow these manual steps to generate screenshots.

## Prerequisites

### iOS
- Xcode installed
- iOS Simulators installed (run `xcode-select --install` if needed)

### Android
- Android Studio installed
- At least one Android emulator created

## Step-by-Step Instructions

### 1. Launch iOS Simulator

```bash
# List available simulators
xcrun simctl list devices available

# Launch iPhone 15 Pro Max (for 6.7" screenshots)
open -a Simulator --args -CurrentDeviceUDID <device-id-from-list>

# OR simply:
open -a Simulator
# Then select Hardware > Device > iPhone 15 Pro Max
```

### 2. Run Your App

```bash
# Run in the simulator
flutter run
```

### 3. Take Screenshots Manually

Navigate through your app and take screenshots of:

1. **Main Menu** - Show game mode carousel
2. **Game Mode Selection** - Highlight Couple/Friends/Family modes
3. **Category Selection** - Show premium and free categories
4. **Question Card** - Show the beautiful card interface
5. **Spark AI Screen** - Premium feature (requires premium account)
6. **Pandora Lobby** - Multiplayer feature
7. **Subscription Page** - Show pricing tiers

**Take screenshots:**
- **iOS**: Cmd + S (saves to Desktop)
- **Android**: Screenshots tool in emulator toolbar

### 4. Resize for App Store Requirements

#### iOS Screenshot Sizes Needed:
- **6.7" display** (iPhone 15 Pro Max): 1290 x 2796 px
- **6.5" display** (iPhone 14 Plus): 1284 x 2778 px
- **5.5" display** (iPhone 8 Plus): 1242 x 2208 px
- **iPad Pro 12.9"**: 2048 x 2732 px (optional)

#### Android Screenshot Sizes Needed:
- **Phone**: 1080 x 1920 px minimum (or up to 3840 x 7680)
- **7" Tablet**: 1200 x 1920 px (optional)
- **10" Tablet**: 1600 x 2560 px (optional)

### 5. Organize Screenshots

```bash
screenshots/
  ios/
    6.7-inch/
      01_main_menu.png
      02_game_modes.png
      03_category_selection.png
      04_question_card.png
      05_premium_page.png
    6.5-inch/
      ...
  android/
    phone/
      01_main_menu.png
      02_game_modes.png
      ...
    tablet/
      ...
```

## Tips for Great Screenshots

1. **Show Value** - Highlight premium features and unique gameplay
2. **Use Real Content** - Navigate to actual questions/categories
3. **Clean UI** - No notifications or battery warnings
4. **Consistent** - Use same color scheme across all shots
5. **Localize** - Consider taking screenshots in top languages (English, German, Spanish)

## Marketing Overlays (Optional)

Add text overlays to screenshots to highlight features:
- "150+ AI-Generated Questions"
- "Perfect for Couples, Friends & Family"
- "Real-Time Multiplayer Mode"
- "24+ Premium Categories"

**Tools for Adding Overlays:**
- Figma (free)
- Canva (free)
- Adobe Photoshop
- Sketch

## Required Counts

### App Store (iOS)
- Minimum: 3 screenshots per device size
- Maximum: 10 screenshots per device size
- Recommended: 5-7 screenshots

### Play Store (Android)
- Minimum: 2 screenshots
- Maximum: 8 screenshots
- Feature Graphic: 1024 x 500 px (REQUIRED)
- Recommended: 5-7 screenshots

## Next Steps

After creating screenshots:
1. Upload to App Store Connect (iOS)
2. Upload to Google Play Console (Android)
3. Add captions/descriptions for each screenshot
4. Preview how they look on different devices
