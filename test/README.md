# Automated Testing Guide

This directory contains automated tests for the Connect talking game application.

## 📊 Current Test Coverage

- **Total Tests**: 57
- **Unit Tests**: 40 (Premium/free logic, category locking, Spark access, question limits)
- **Widget Tests**: 15 (CustomDialog and DialogButton components)
- **Infrastructure Tests**: 2 (Basic test framework verification)

## 🗂️ Test Organization

```
test/
├── unit/
│   └── providers/
│       └── unlock_provider_simple_test.dart  (40 tests)
├── widget/
│   └── custom_dialog_test.dart               (15 tests)
├── integration/                               (ready for future tests)
├── mocks/
│   └── mock_supabase_client.dart              (Mock infrastructure)
├── helpers/
│   ├── test_data.dart                         (Test fixtures)
│   └── test_helpers.dart                      (Helper functions)
└── widget_test.dart                           (Basic tests)
```

## 🚀 Running Tests

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/unit/providers/unlock_provider_simple_test.dart
flutter test test/widget/custom_dialog_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### Watch Mode (Re-run on changes)
```bash
flutter test --watch
```

## 📈 What's Tested

### UnlockProvider (Premium/Free Logic)
✅ **Subscription Tiers** (Premium, Premium+, Free, Basic)
✅ **Ad Display Logic** (Every 7 questions for free users)
✅ **Category Locking** (Free categories vs premium-only)
✅ **Question Limits** (75 for premium, 30 for free, 5 preview for locked)
✅ **Spark Access** (Premium and Premium+ only)
✅ **Spark Quotas** (150 for premium, 400 for premium+)
✅ **State Management** (Question counts, reset functionality)

### CustomDialog Widget
✅ **UI Rendering** (Title, content, icons)
✅ **Dark/Light Mode** (Theme support)
✅ **Button Interactions** (Primary/secondary buttons)
✅ **Callbacks** (onConfirm, onCancel)
✅ **Custom Widgets** (titleWidget, contentWidget)
✅ **Long Content** (Scrollable content)

## 🤖 Continuous Integration

Tests run automatically on every push/PR via GitHub Actions.

See `.github/workflows/test.yml` for the CI configuration.

### CI Pipeline:
1. ✅ Install Flutter
2. ✅ Get dependencies
3. ✅ Check code formatting
4. ✅ Run static analysis
5. ✅ Run all tests
6. ✅ Generate coverage report
7. ✅ Upload to Codecov (optional)

## 🧪 Test Philosophy

These tests focus on:

1. **Business Logic** - Core functionality like premium/free tiers, ad logic, quotas
2. **User-Facing Features** - UI components, dialogs, buttons
3. **Edge Cases** - Boundary conditions, empty states, long content
4. **Isolation** - Tests don't touch real Supabase database (uses mocks)

## 🔍 Test Coverage Areas

### ✅ Currently Covered
- Subscription tier management
- Premium vs free user experience
- Ad display logic
- Spark access and quotas
- Category locking
- Dialog components

### 🔜 Future Coverage (Not Yet Implemented)
- SupabaseService (caching, offline mode)
- PandoraService (multiplayer sessions)
- SparkService (AI generation)
- AnalyticsService (tracking)
- GamePage (main game flow)
- Integration tests (full user journeys)

## 📚 Adding New Tests

### Unit Test Template
```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('YourFeature', () {
    test('should do something', () {
      // Arrange
      final input = 'test';

      // Act
      final result = yourFunction(input);

      // Assert
      expect(result, 'expected output');
    });
  });
}
```

### Widget Test Template
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget description', (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(
      MaterialApp(
        home: YourWidget(),
      ),
    );

    // Verify
    expect(find.text('Some Text'), findsOneWidget);
  });
}
```

## 🎯 Best Practices

1. **Test Names** - Use descriptive names that explain what's being tested
2. **AAA Pattern** - Arrange, Act, Assert
3. **One Assert Per Test** - Each test should verify one thing
4. **Isolation** - Tests should not depend on each other
5. **Mocks** - Use mocks to avoid external dependencies (database, API calls)
6. **Fast** - Tests should run quickly (milliseconds, not seconds)

## 🔧 Troubleshooting

### Tests fail with Supabase initialization error
- Tests are isolated and don't initialize Supabase
- Use the mock infrastructure in `test/mocks/`
- See `unlock_provider_simple_test.dart` for examples

### Coverage file not generated
- Run: `flutter test --coverage`
- Coverage file will be at: `coverage/lcov.info`

### Tests pass locally but fail in CI
- Check Flutter version (CI uses 3.9.2)
- Ensure all dependencies are in `pubspec.yaml`
- Check for environment-specific code

## 📊 Coverage Reports

After running `flutter test --coverage`:

1. **View in terminal**: Coverage summary is displayed
2. **HTML Report**: Use `genhtml` to generate browsable report
3. **Codecov**: Automatically uploaded by CI

```bash
# Generate HTML coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🎉 Test Results

All tests passing! 🟢

```
✅ 57 tests passed
⚡ Run time: ~3 seconds
📦 Zero impact on production app
🔒 Tests are completely isolated
```

---

**Next Steps:**
- Add service layer tests (Supabase, Pandora, Spark)
- Add integration tests for user flows
- Increase coverage to 70%+
- Set up coverage badges
