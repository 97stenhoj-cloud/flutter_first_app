# 📸 App Store Screenshots Guide

This guide helps you generate screenshots for App Store Connect and Google Play Console submissions.

## Quick Start

### Option 1: Automated (Recommended)

```bash
# Install dependencies
flutter pub get

# Run the automated screenshot script
./scripts/generate_screenshots.sh
```

### Option 2: Manual

Follow the step-by-step guide in `scripts/manual_screenshots.md`

---

## What Screenshots to Capture

### Must-Have Screenshots (5 minimum)

1. **Main Menu / Game Mode Selection** 📱
   - Shows the beautiful carousel interface
   - Highlights "Couple", "Friends", "Family" modes
   - First impression screenshot

2. **Category Selection** 📚
   - Shows variety of categories
   - Displays premium vs free categories
   - Shows category descriptions

3. **Question Card Gameplay** 💬
   - The core experience
   - Shows beautiful card design
   - Demonstrates swipe interface

4. **Premium/Subscription Page** ⭐
   - Shows pricing tiers (Basic, Premium, Premium+)
   - Highlights features and value
   - Important for monetization

5. **Spark AI Feature** 🤖
   - Premium feature showcase
   - Shows AI question generation interface
   - Unique selling point

### Nice-to-Have Screenshots (optional)

6. **Pandora Multiplayer** 👥
   - Shows collaborative gameplay
   - Highlights real-time features
   - Social aspect

7. **How to Play** 📖
   - Demonstrates ease of use
   - Shows user guidance
   - Reduces support questions

---

## Screenshot Requirements

### iOS App Store

#### Device Sizes Required:
- **6.7" display** (iPhone 15 Pro Max) - 1290 x 2796 px
  - Most important! This is what most users see first
- **6.5" display** (iPhone 14 Plus) - 1284 x 2778 px
- **5.5" display** (iPhone 8 Plus) - 1242 x 2208 px
  - For older devices still in use

#### Optional:
- **iPad Pro 12.9"** - 2048 x 2732 px

#### Counts:
- Minimum: 3 screenshots per size
- Maximum: 10 screenshots per size
- **Recommended: 5-7 screenshots**

### Google Play Store

#### Device Sizes:
- **Phone** - 1080 x 1920 px minimum
  - Can go up to 3840 x 7680 px
- **7" Tablet** (optional) - 1200 x 1920 px
- **10" Tablet** (optional) - 1600 x 2560 px

#### Feature Graphic (REQUIRED):
- **1024 x 500 px**
- This is shown prominently in Play Store
- Should be eye-catching and branded

#### Counts:
- Minimum: 2 screenshots
- Maximum: 8 screenshots
- **Recommended: 5-7 screenshots**

---

## Screenshot Best Practices

### ✅ DO:
- Use real content (actual questions and categories)
- Show diverse features
- Maintain consistent branding
- Use high-quality, crisp images
- Show the app in use (not just splash screens)
- Highlight unique features (Spark AI, Pandora multiplayer)
- Consider adding text overlays for clarity

### ❌ DON'T:
- Show placeholder content
- Include device frames (unless brand requires it)
- Show error states or bugs
- Display personal information
- Include irrelevant UI elements (status bars with low battery)
- Use blurry or low-resolution images

---

## Adding Marketing Text (Optional)

Consider adding text overlays to screenshots to highlight features:

### Example Text Overlays:
- "150+ AI-Generated Questions" (on Spark screenshot)
- "Perfect for Couples, Friends & Family" (on game modes)
- "Real-Time Multiplayer Mode" (on Pandora)
- "24+ Premium Categories" (on categories)
- "No Ads • Unlimited Questions" (on premium page)

### Tools for Adding Text:
- **Figma** (free, web-based)
- **Canva** (free tier available)
- **Adobe Express** (free)
- **Screenshot Framer** (Mac app)

---

## Multi-Language Screenshots

If targeting international markets, consider screenshots in:

Priority Languages (in order):
1. English (required)
2. German (large EU market)
3. Spanish (global reach)
4. French (EU market)
5. Italian (EU market)

Your app supports 13 languages - screenshots in the top 3-5 will maximize conversions.

---

## Automated Screenshot Flow

The `integration_test/screenshot_test.dart` file automates:

1. Launching the app
2. Navigating to main menu
3. Opening game mode selection
4. Entering category selection
5. Showing question card gameplay
6. Opening subscription page
7. Showing How to Play
8. Attempting Pandora mode (if accessible)

**Screenshots are saved with names:**
- `01_main_menu.png`
- `02_game_modes.png`
- `03_category_selection.png`
- `04_question_card.png`
- `05_premium_page.png`
- `06_how_to_play.png`
- `07_pandora_mode.png`

---

## Troubleshooting

### Script Fails
- **iOS**: Ensure Xcode is installed and simulators are available
- **Android**: Ensure Android Studio is installed and emulators are running
- Check that `flutter doctor` shows no issues

### Screenshots Are Blank/Black
- Increase wait times in `screenshot_test.dart`
- Ensure emulators have sufficient resources
- Try running manually to verify app works

### Wrong Sizes
- iOS: Launch correct simulator size from Xcode
- Android: Configure emulator with correct resolution
- Use image editing tools to resize if needed

### Authentication Required
- Some features (Spark, Pandora) require premium account
- Temporarily modify code to bypass auth for screenshots
- Or manually navigate and screenshot after signing in

---

## Next Steps After Screenshots

1. **Review & Select**
   - Choose the best 5-7 screenshots
   - Ensure they tell a story
   - Verify quality on different screen sizes

2. **Optimize**
   - Compress images (use TinyPNG or similar)
   - Ensure file sizes are reasonable
   - Keep under 500KB per image if possible

3. **Organize**
   - Name clearly: `01_feature_name.png`
   - Separate by platform (iOS, Android)
   - Separate by device size

4. **Upload**
   - App Store Connect: Add to App Store tab
   - Google Play Console: Add to Store Listing
   - Add localized versions if available

5. **Test Preview**
   - Preview how they look in stores
   - Check on different devices
   - Get feedback from team/testers

---

## Questions?

If automated screenshots don't work:
1. Check `scripts/manual_screenshots.md` for manual instructions
2. Verify `flutter doctor` shows no issues
3. Try running the app manually first: `flutter run`

Good luck with your App Store submission! 🚀
