import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connect/main.dart';  // Changed from flutter_first_app

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TalkingGameApp());

    // Verify that the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}