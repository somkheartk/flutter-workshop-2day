# Flutter Testing Example

A comprehensive demonstration of testing in Flutter, including unit tests and widget tests.

## Features

### Testing Types Demonstrated
1. **Unit Tests** - Testing business logic in isolation
   - Calculator functions
   - Counter class
   - TodoList class
   - TodoItem class

2. **Widget Tests** - Testing UI components and interactions
   - Button taps
   - State changes
   - UI updates
   - Complex interactions

## How to Run

### Run the App
```bash
flutter run
```

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/utils_test.dart
flutter test test/widget_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### View Coverage Report
```bash
# Install lcov (Mac)
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser
open coverage/html/index.html
```

## Test Structure

```
test/
├── utils_test.dart       # Unit tests for business logic
└── widget_test.dart      # Widget tests for UI
```

## Key Testing Concepts

### Unit Tests

```dart
test('description of test', () {
  // Arrange
  final calculator = Calculator();
  
  // Act
  final result = calculator.add(2, 3);
  
  // Assert
  expect(result, 5);
});
```

### Test Groups

```dart
group('Calculator Tests', () {
  test('addition', () { /* ... */ });
  test('subtraction', () { /* ... */ });
});
```

### setUp and tearDown

```dart
group('Tests', () {
  late MyClass instance;
  
  setUp(() {
    // Runs before each test
    instance = MyClass();
  });
  
  tearDown(() {
    // Runs after each test
    instance.dispose();
  });
  
  test('...', () { /* use instance */ });
});
```

### Widget Tests

```dart
testWidgets('description', (WidgetTester tester) async {
  // Build the widget
  await tester.pumpWidget(MyApp());
  
  // Find widgets
  expect(find.text('Hello'), findsOneWidget);
  
  // Interact with widgets
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump(); // Rebuild after interaction
  
  // Verify changes
  expect(find.text('1'), findsOneWidget);
});
```

### Common Test Matchers

```dart
// Equality
expect(actual, expected);
expect(actual, equals(expected));

// Numeric comparisons
expect(value, greaterThan(5));
expect(value, lessThan(10));

// Boolean
expect(value, isTrue);
expect(value, isFalse);

// Null
expect(value, isNull);
expect(value, isNotNull);

// Exceptions
expect(() => function(), throwsException);
expect(() => function(), throwsArgumentError);

// Widget finders
expect(find.text('Hello'), findsOneWidget);
expect(find.text('Hello'), findsNothing);
expect(find.byType(Button), findsNWidgets(3));
```

## Tests Included

### Unit Tests (utils_test.dart)
- ✅ Calculator: add, subtract, multiply, divide
- ✅ Calculator: division by zero error
- ✅ Counter: increment, decrement, reset
- ✅ Counter: doesn't go below zero
- ✅ TodoList: add, remove, toggle items
- ✅ TodoList: count completed/active items
- ✅ TodoItem: creation and toggle

### Widget Tests (widget_test.dart)
- ✅ Initial display state
- ✅ Increment button functionality
- ✅ Decrement button functionality
- ✅ Reset button functionality
- ✅ Decrement doesn't go below zero
- ✅ All buttons present
- ✅ Complex interaction sequences
- ✅ Info card display

## Best Practices

1. **Write testable code** - Separate business logic from UI
2. **Use descriptive test names** - Clear what is being tested
3. **Test edge cases** - Not just happy path
4. **One assertion per test** - Keep tests focused
5. **Use setUp/tearDown** - Clean test initialization
6. **Test user interactions** - Not just initial state
7. **Use keys for widgets** - Easier to find in tests
8. **Mock external dependencies** - Keep tests isolated

## Running Tests in CI/CD

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
      - run: flutter test --coverage
```

## Learning Points

1. How to write unit tests for business logic
2. How to write widget tests for UI
3. Using test groups and setUp/tearDown
4. Testing user interactions with widgets
5. Using matchers and assertions
6. Testing edge cases and errors
7. Generating and viewing coverage reports
8. Best practices for Flutter testing
