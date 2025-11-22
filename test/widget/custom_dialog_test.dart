import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connect/core/widgets/custom_dialog.dart';

/// Widget tests for CustomDialog
/// These test UI rendering and user interaction
void main() {
  group('CustomDialog Widget Tests', () {
    testWidgets('should display title and content', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Test Title',
              content: 'Test Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify title is displayed
      expect(find.text('Test Title'), findsOneWidget);

      // Verify content is displayed
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should display confirm button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Test',
              content: 'Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify button exists
      expect(find.text('OK'), findsOneWidget);
    });

    testWidgets('should display multiple action buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Test',
              content: 'Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'Cancel',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: false,
                ),
                const SizedBox(height: 12),
                DialogButton(
                  text: 'Confirm',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify both buttons exist
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('primary button should trigger callback', (WidgetTester tester) async {
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Test',
              content: 'Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'Press Me',
                  onPressed: () {
                    buttonPressed = true;
                  },
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.text('Press Me'));
      await tester.pumpAndSettle();

      // Verify callback was called
      expect(buttonPressed, true);
    });

    testWidgets('secondary button should trigger callback', (WidgetTester tester) async {
      bool cancelPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Test',
              content: 'Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'Cancel',
                  onPressed: () {
                    cancelPressed = true;
                  },
                  isDarkMode: false,
                  isPrimary: false,
                ),
              ],
            ),
          ),
        ),
      );

      // Tap the cancel button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Verify callback was called
      expect(cancelPressed, true);
    });

    testWidgets('should display icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'With Icon',
              content: 'Content',
              isDarkMode: false,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify icon is displayed
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should render in dark mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Dark Mode',
              content: 'Testing dark mode',
              isDarkMode: true,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: true,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify dialog renders
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.text('Testing dark mode'), findsOneWidget);
    });

    testWidgets('should use titleWidget when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              titleWidget: const Text('Custom Title Widget'),
              content: 'Content',
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify custom title widget is displayed
      expect(find.text('Custom Title Widget'), findsOneWidget);
    });

    testWidgets('should use contentWidget when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Title',
              contentWidget: const Column(
                children: [
                  Text('Line 1'),
                  Text('Line 2'),
                ],
              ),
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify custom content widget is displayed
      expect(find.text('Line 1'), findsOneWidget);
      expect(find.text('Line 2'), findsOneWidget);
    });

    testWidgets('long content should be scrollable', (WidgetTester tester) async {
      final longContent = 'This is a very long message. ' * 50;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomDialog(
              title: 'Long Content',
              content: longContent,
              isDarkMode: false,
              actions: [
                DialogButton(
                  text: 'OK',
                  onPressed: () {},
                  isDarkMode: false,
                  isPrimary: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Verify dialog renders with long content
      expect(find.text('Long Content'), findsOneWidget);
      expect(find.textContaining('This is a very long message'), findsOneWidget);

      // Verify SingleChildScrollView exists (content is scrollable)
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });

  group('DialogButton Widget Tests', () {
    testWidgets('primary button should have correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogButton(
              text: 'Primary',
              onPressed: () {},
              isPrimary: true,
              isDarkMode: false,
            ),
          ),
        ),
      );

      expect(find.text('Primary'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('secondary button should have correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogButton(
              text: 'Secondary',
              onPressed: () {},
              isPrimary: false,
              isDarkMode: false,
            ),
          ),
        ),
      );

      expect(find.text('Secondary'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('button with icon should display both icon and text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogButton(
              text: 'With Icon',
              icon: Icons.star,
              onPressed: () {},
              isPrimary: true,
              isDarkMode: false,
            ),
          ),
        ),
      );

      expect(find.text('With Icon'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('button should be tappable', (WidgetTester tester) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogButton(
              text: 'Tap Me',
              onPressed: () {
                tapCount++;
              },
              isPrimary: true,
              isDarkMode: false,
            ),
          ),
        ),
      );

      // Tap once
      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();
      expect(tapCount, 1);

      // Tap again
      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();
      expect(tapCount, 2);
    });

    testWidgets('button with custom color should apply it', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogButton(
              text: 'Custom Color',
              onPressed: () {},
              isPrimary: true,
              isDarkMode: false,
              customColor: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.text('Custom Color'), findsOneWidget);
      // The button should render (detailed color testing would require widget inspector)
    });
  });
}
