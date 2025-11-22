#!/bin/bash
# generate_screenshots.sh
# Automated screenshot generation for App Store and Google Play submissions

set -e  # Exit on error

echo "🎬 Starting Screenshot Generation for Connect App"
echo "=================================================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Create screenshots directory
SCREENSHOTS_DIR="screenshots"
mkdir -p "$SCREENSHOTS_DIR/ios"
mkdir -p "$SCREENSHOTS_DIR/android"

echo -e "${BLUE}📦 Installing dependencies...${NC}"
flutter pub get

echo ""
echo -e "${BLUE}🍎 Generating iOS Screenshots${NC}"
echo "-----------------------------------"

# iOS Screenshot Sizes Required by App Store:
# - 6.7" display (iPhone 15 Pro Max): 1290 x 2796
# - 6.5" display (iPhone 14 Plus): 1284 x 2778
# - 5.5" display (iPhone 8 Plus): 1242 x 2208

# Check if iOS simulator is available
if command -v xcrun &> /dev/null; then
    echo -e "${GREEN}✓ Xcode found${NC}"

    # List available iOS simulators
    echo "Available iOS Simulators:"
    xcrun simctl list devices available | grep "iPhone"

    echo ""
    echo -e "${YELLOW}Generating screenshots for iPhone 15 Pro Max (6.7\")${NC}"
    flutter test integration_test/screenshot_test.dart \
        --dart-define=SCREENSHOTS=true \
        --device-id="iPhone 15 Pro Max" \
        --flavor=production \
        --driver=test_driver/integration_test.dart || true

    echo ""
    echo -e "${YELLOW}Generating screenshots for iPhone SE (5.5\" equivalent)${NC}"
    flutter test integration_test/screenshot_test.dart \
        --dart-define=SCREENSHOTS=true \
        --device-id="iPhone SE (3rd generation)" \
        --flavor=production \
        --driver=test_driver/integration_test.dart || true
else
    echo -e "${YELLOW}⚠ Xcode not found. Skipping iOS screenshots.${NC}"
    echo "Install Xcode from Mac App Store to generate iOS screenshots."
fi

echo ""
echo -e "${BLUE}🤖 Generating Android Screenshots${NC}"
echo "-----------------------------------"

# Android Screenshot Sizes Required by Play Store:
# - Phone: 1080 x 1920 (or higher)
# - 7" tablet: 1200 x 1920
# - 10" tablet: 1600 x 2560

# Check if Android emulator is available
if command -v adb &> /dev/null; then
    echo -e "${GREEN}✓ Android SDK found${NC}"

    # List available Android emulators
    echo "Available Android Emulators:"
    emulator -list-avds || echo "No emulators configured"

    echo ""
    echo -e "${YELLOW}Generating screenshots for Pixel 7 Pro${NC}"
    flutter test integration_test/screenshot_test.dart \
        --dart-define=SCREENSHOTS=true \
        --device-id=emulator-5554 \
        --flavor=production \
        --driver=test_driver/integration_test.dart || true
else
    echo -e "${YELLOW}⚠ Android SDK not found. Skipping Android screenshots.${NC}"
    echo "Install Android Studio and create emulators to generate Android screenshots."
fi

echo ""
echo -e "${GREEN}✅ Screenshot generation complete!${NC}"
echo ""
echo "📁 Screenshots saved to: $SCREENSHOTS_DIR/"
echo ""
echo "Next steps:"
echo "1. Review screenshots in the $SCREENSHOTS_DIR folder"
echo "2. Select the best 4-5 screenshots for each platform"
echo "3. Optionally add marketing text overlays"
echo "4. Upload to App Store Connect and Google Play Console"
echo ""
echo "Required screenshot counts:"
echo "  • iOS: 3-10 screenshots per device size"
echo "  • Android: 2-8 screenshots (phone), 1-8 (tablet)"
echo ""
