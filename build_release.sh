#!/bin/bash
# Build script for Connect app with IP protection (code obfuscation)
# This script builds release versions with maximum obfuscation

set -e  # Exit on error

echo "🔒 Building Connect app with IP protection enabled..."
echo "=================================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Create debug-info directory if it doesn't exist
mkdir -p debug-info

# Function to build Android
build_android() {
    echo -e "${BLUE}📱 Building Android APK with obfuscation...${NC}"
    echo ""

    flutter build apk --release \
        --obfuscate \
        --split-debug-info=./debug-info/android \
        --split-per-abi

    echo ""
    echo -e "${GREEN}✅ Android APK built successfully!${NC}"
    echo "   Location: build/app/outputs/flutter-apk/"
    echo "   Debug symbols: debug-info/android/"
    echo ""
}

# Function to build iOS
build_ios() {
    echo -e "${BLUE}🍎 Building iOS IPA with obfuscation...${NC}"
    echo ""

    flutter build ios --release \
        --obfuscate \
        --split-debug-info=./debug-info/ios

    echo ""
    echo -e "${GREEN}✅ iOS build completed successfully!${NC}"
    echo "   Debug symbols: debug-info/ios/"
    echo ""
    echo -e "${YELLOW}ℹ️  To create IPA: Open Xcode and archive, or use:${NC}"
    echo "   flutter build ipa --release --obfuscate --split-debug-info=./debug-info/ios"
    echo ""
}

# Function to build Android App Bundle (for Play Store)
build_appbundle() {
    echo -e "${BLUE}📦 Building Android App Bundle (AAB) with obfuscation...${NC}"
    echo ""

    flutter build appbundle --release \
        --obfuscate \
        --split-debug-info=./debug-info/android-bundle

    echo ""
    echo -e "${GREEN}✅ Android App Bundle built successfully!${NC}"
    echo "   Location: build/app/outputs/bundle/release/"
    echo "   Debug symbols: debug-info/android-bundle/"
    echo ""
}

# Parse command line arguments
if [ "$1" == "android" ]; then
    build_android
elif [ "$1" == "ios" ]; then
    build_ios
elif [ "$1" == "appbundle" ] || [ "$1" == "aab" ]; then
    build_appbundle
elif [ "$1" == "all" ]; then
    build_android
    build_appbundle
    build_ios
else
    echo "Usage: ./build_release.sh [android|ios|appbundle|all]"
    echo ""
    echo "Options:"
    echo "  android    - Build Android APK with obfuscation"
    echo "  ios        - Build iOS with obfuscation"
    echo "  appbundle  - Build Android App Bundle (AAB) for Play Store"
    echo "  all        - Build all platforms"
    echo ""
    echo "Example: ./build_release.sh android"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Build process complete!${NC}"
echo ""
echo -e "${YELLOW}⚠️  IMPORTANT SECURITY NOTES:${NC}"
echo "1. Keep debug-info/ directory PRIVATE - never commit to git"
echo "2. Store debug symbols securely for crash reporting"
echo "3. These builds have code obfuscation enabled for IP protection"
echo "4. ProGuard rules are protecting sensitive business logic"
echo ""
