// integration_test/screenshot_test.dart
// Automated screenshot generation for App Store and Google Play

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:connect/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Configure screenshot parameters
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('App Store Screenshots', () {
    testWidgets('Generate all required screenshots', (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // SCREENSHOT 1: Main Menu with Game Mode Selection
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await screenshot(tester, binding, '01_main_menu');

      // SCREENSHOT 2: Game Mode Selection (scroll to show different modes)
      // Look for the START button
      final startButton = find.text('START');
      if (startButton.evaluate().isNotEmpty) {
        await tester.tap(startButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await screenshot(tester, binding, '02_game_modes');
      }

      // SCREENSHOT 3: Category Selection
      // Try to find and tap on a game mode card
      final coupleModeCard = find.textContaining('Couple').first;
      if (coupleModeCard.evaluate().isNotEmpty) {
        await tester.tap(coupleModeCard);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await screenshot(tester, binding, '03_category_selection');
      }

      // SCREENSHOT 4: Question Card Gameplay
      // Try to tap on a category to enter gameplay
      final categoryCard = find.byType(Card).first;
      if (categoryCard.evaluate().isNotEmpty) {
        await tester.tap(categoryCard);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await screenshot(tester, binding, '04_question_card');
      }

      // Go back to main menu for other screenshots
      // Look for back button or home button
      final backButton = find.byIcon(Icons.arrow_back);
      if (backButton.evaluate().isNotEmpty) {
        await tester.tap(backButton);
        await tester.pumpAndSettle(const Duration(seconds: 1));
        await tester.tap(backButton);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }

      // SCREENSHOT 5: Subscription/Premium Page
      // Look for settings or premium button
      final settingsButton = find.text('SETTINGS');
      if (settingsButton.evaluate().isNotEmpty) {
        await tester.tap(settingsButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Look for "Get Premium" or similar button
        final premiumButton = find.textContaining('Premium');
        if (premiumButton.evaluate().isNotEmpty) {
          await tester.tap(premiumButton.first);
          await tester.pumpAndSettle(const Duration(seconds: 2));
          await screenshot(tester, binding, '05_premium_page');

          // Go back
          final cancelButton = find.text('Cancel');
          if (cancelButton.evaluate().isNotEmpty) {
            await tester.tap(cancelButton);
            await tester.pumpAndSettle();
          }
        }

        // Go back to main menu
        final backBtn = find.byIcon(Icons.arrow_back);
        if (backBtn.evaluate().isNotEmpty) {
          await tester.tap(backBtn);
          await tester.pumpAndSettle();
        }
      }

      // SCREENSHOT 6: How to Play / Tutorial
      final howToPlayButton = find.text('HOW TO PLAY');
      if (howToPlayButton.evaluate().isNotEmpty) {
        await tester.tap(howToPlayButton);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await screenshot(tester, binding, '06_how_to_play');

        // Go back
        final backBtn = find.byIcon(Icons.arrow_back);
        if (backBtn.evaluate().isNotEmpty) {
          await tester.tap(backBtn);
          await tester.pumpAndSettle();
        }
      }

      // SCREENSHOT 7: Pandora Multiplayer (if accessible)
      // This might require authentication, so we'll try but won't fail if it doesn't work
      try {
        if (startButton.evaluate().isNotEmpty) {
          await tester.tap(startButton);
          await tester.pumpAndSettle(const Duration(seconds: 1));

          final pandoraMode = find.textContaining('Pandora');
          if (pandoraMode.evaluate().isNotEmpty) {
            await tester.tap(pandoraMode.first);
            await tester.pumpAndSettle(const Duration(seconds: 2));
            await screenshot(tester, binding, '07_pandora_mode');
          }
        }
      } catch (e) {
        // Skip if Pandora requires authentication
        debugPrint('Skipping Pandora screenshot (may require auth): $e');
      }
    });
  });
}

/// Helper function to take and save a screenshot
Future<void> screenshot(
  WidgetTester tester,
  IntegrationTestWidgetsFlutterBinding binding,
  String name,
) async {
  // Wait for any animations to complete
  await tester.pumpAndSettle(const Duration(milliseconds: 500));

  // Capture screenshot
  await binding.takeScreenshot(name);

  // Also log to console
  debugPrint('📸 Screenshot captured: $name');
}
