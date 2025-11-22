# Quick Start: Generate App Store Screenshots

## The Easiest Way

### Step 1: Launch an Emulator

**iOS:**
```bash
open -a Simulator
```
Then select: **Hardware > Device > iPhone 15 Pro Max**

**Android:**
```bash
# List available emulators
emulator -list-avds

# Launch one (replace with your emulator name)
emulator -avd Pixel_7_Pro_API_34 &
```

### Step 2: Run Your App

```bash
flutter run
```

### Step 3: Take Screenshots

Navigate through your app and press:
- **iOS Simulator**: `Cmd + S` (saves to Desktop)
- **Android Emulator**: Click camera icon in toolbar

**Screenshot these screens:**
1. Main menu (game mode carousel)
2. Game mode selection showing Couple/Friends/Family
3. Category selection (show premium categories)
4. Question card (the beautiful swipe interface)
5. Premium/subscription page (pricing tiers)

### Step 4: Find Your Screenshots

**iOS**: Check your Desktop folder
**Android**: Check `~/Pictures/` or emulator's screenshot folder

---

## What If You Want Automation?

The integration test is available but requires more setup:

```bash
# Run integration test (captures screenshots automatically)
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart
```

**Note:** You need to create `test_driver/integration_test.dart` first (see main README).

---

## Minimum Requirements for Submission

### iOS App Store
- **3 screenshots minimum** (iPhone 6.7" display - 1290x2796px)
- Recommended: 5-7 screenshots

### Google Play Store
- **2 screenshots minimum** (Phone - 1080x1920px min)
- **1 Feature Graphic** (1024x500px) - REQUIRED!
- Recommended: 5-7 screenshots

---

## Pro Tips

1. **Clean UI**: Hide status bar, ensure no notifications
2. **Real Content**: Use actual questions, not lorem ipsum
3. **Show Value**: Highlight premium features (Spark AI, Pandora)
4. **Consistency**: Same theme/style across all screenshots
5. **Text Overlays**: Consider adding marketing text (optional)

---

## Need Help?

See the full documentation:
- `SCREENSHOTS_README.md` - Comprehensive guide
- `scripts/manual_screenshots.md` - Detailed manual instructions
- `integration_test/screenshot_test.dart` - Automation code

---

**That's it! Now go create some amazing screenshots and get your app live! 🚀**
