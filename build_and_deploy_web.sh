#!/bin/bash

# Build and Deploy Flutter Web to TechyKoala Website
# This script builds the Flutter web app and copies it to the website repo

echo "🚀 Building Flutter Web App..."
echo "================================"

# Navigate to Flutter project
cd "$(dirname "$0")"

# Clean previous build
echo "🧹 Cleaning previous build..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build for web
echo "🔨 Building for web (this takes 2-3 minutes)..."
flutter build web --release --base-href "/Connect/play/"

# Check if build succeeded
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"

    # Copy to website
    WEBSITE_PATH="/Users/stenhoej/Desktop/techykoala-website/Connect/play"
    echo "📋 Copying to $WEBSITE_PATH..."

    # Remove old files
    rm -rf "$WEBSITE_PATH"

    # Create directory
    mkdir -p "$WEBSITE_PATH"

    # Copy new build
    cp -R build/web/* "$WEBSITE_PATH/"

    echo "✅ Copied to website!"
    echo ""
    echo "📝 Next steps:"
    echo "   1. cd /Users/stenhoej/Desktop/techykoala-website"
    echo "   2. git add Connect/play"
    echo "   3. git commit -m 'Update Flutter web app'"
    echo "   4. git push"
    echo ""
    echo "🌐 After deployment, your app will be live at:"
    echo "   https://techykoala.com/Connect/play"

else
    echo "❌ Build failed! Check errors above."
    exit 1
fi
