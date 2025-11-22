import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper functions for testing

/// Pumps a widget wrapped in necessary providers for testing
Future<void> pumpTestWidget(
  WidgetTester tester,
  Widget widget, {
  List<Override>? overrides,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides ?? [],
      child: MaterialApp(
        home: widget,
      ),
    ),
  );
}

/// Sets up mock SharedPreferences with initial values
void setupMockSharedPreferences([Map<String, Object>? initialValues]) {
  SharedPreferences.setMockInitialValues(initialValues ?? {});
}

/// Creates a mock cache entry for questions
Map<String, String> createMockQuestionCache({
  required String gameMode,
  required String category,
  required String languageCode,
  required List<Map<String, dynamic>> questions,
  DateTime? cachedAt,
  String version = '1.0',
}) {
  final cacheKey = 'question_cache_${gameMode}_${category}_$languageCode';
  final cacheData = {
    'questions': questions,
    'cachedAt': (cachedAt ?? DateTime.now()).toIso8601String(),
    'version': version,
  };

  return {cacheKey: _encodeJson(cacheData)};
}

/// Encodes JSON for SharedPreferences
String _encodeJson(Map<String, dynamic> data) {
  // Simple JSON encoding (you might want to use dart:convert in real implementation)
  return data.toString();
}

/// Advances time for testing time-based logic
void advanceTime(Duration duration) {
  // This would be used with FakeAsync in actual tests
  // For now, it's a placeholder
}

/// Creates a mock Supabase response
Map<String, dynamic> createMockSupabaseResponse({
  required List<Map<String, dynamic>> data,
  int? count,
}) {
  return {
    'data': data,
    'count': count ?? data.length,
    'error': null,
  };
}

/// Creates a mock error response
Map<String, dynamic> createMockErrorResponse({
  required String message,
  String? code,
}) {
  return {
    'data': null,
    'error': {
      'message': message,
      'code': code ?? 'unknown_error',
    },
  };
}

/// Waits for all animations and rebuilds to complete
Future<void> waitForBuild(WidgetTester tester) async {
  await tester.pump();
  await tester.pumpAndSettle();
}

/// Finds a widget by its text content
Finder findText(String text) => find.text(text);

/// Finds a widget by its type
Finder findByType<T>() => find.byType(T);

/// Verifies that a widget exists
void expectWidgetExists(Finder finder) {
  expect(finder, findsOneWidget);
}

/// Verifies that a widget does not exist
void expectWidgetNotExists(Finder finder) {
  expect(finder, findsNothing);
}

/// Taps a widget and waits for the tap to complete
Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

/// Swipes a widget in a direction
Future<void> swipeWidget(
  WidgetTester tester,
  Finder finder,
  Offset offset,
) async {
  await tester.drag(finder, offset);
  await tester.pumpAndSettle();
}

/// Creates a standard swipe left gesture (for card swiping)
Future<void> swipeLeft(WidgetTester tester, Finder finder) async {
  await swipeWidget(tester, finder, const Offset(-400, 0));
}

/// Creates a standard swipe right gesture
Future<void> swipeRight(WidgetTester tester, Finder finder) async {
  await swipeWidget(tester, finder, const Offset(400, 0));
}
