/// Widget Tests for CounterPage
/// 
/// This file demonstrates WIDGET TESTING in Flutter:
/// - Testing UI components and interactions
/// - Simulating user actions (taps, swipes, etc.)
/// - Verifying widget behavior and state changes
/// - No real device needed - runs in test environment
/// 
/// DIFFERENCE from Unit Tests:
/// - Unit tests: Pure logic, no UI (fast)
/// - Widget tests: UI components (medium speed)
/// - Integration tests: Full app (slow)
/// 
/// To run: flutter test test/widget_test.dart
/// Or run all: flutter test
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/main.dart';

void main() {
  /// GROUP: Widget tests for CounterPage
  /// 
  /// These tests verify the CounterPage UI and interactions
  group('CounterPage Widget Tests', () {
    
    /// WIDGET TEST: Initial UI state
    /// 
    /// testWidgets: Special function for widget tests
    /// WidgetTester: Tool to interact with widgets
    /// 
    /// Every widget test needs these two parameters
    testWidgets('displays initial counter value', (WidgetTester tester) async {
      /// STEP 1: BUILD THE WIDGET
      /// 
      /// pumpWidget: Renders the widget in test environment
      /// Like running the app, but in a test
      /// 
      /// await: Wait for the widget to build
      /// const MyApp(): Creates the app (MaterialApp + CounterPage)
      await tester.pumpWidget(const MyApp());

      /// STEP 2: VERIFY INITIAL STATE
      /// 
      /// find: Locates widgets in the widget tree
      /// find.text('0'): Finds a Text widget containing '0'
      /// 
      /// findsOneWidget: Matcher that expects exactly 1 widget
      /// Test fails if 0 or 2+ widgets are found
      expect(find.text('0'), findsOneWidget);
      expect(find.text('Counter Value:'), findsOneWidget);
    });

    /// WIDGET TEST: Button interaction
    /// 
    /// Tests that tapping increment button updates the counter
    /// Simulates real user interaction
    testWidgets('increment button increases counter', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Verify initial value
      expect(find.text('0'), findsOneWidget);

      /// STEP 3: SIMULATE USER ACTION
      /// 
      /// tester.tap(): Simulates a tap on a widget
      /// find.byKey(): Finds widget by its Key
      /// 
      /// Key('increment_button'): Unique identifier for the button
      /// We set this in main.dart: key: Key('increment_button')
      /// 
      /// This is MORE RELIABLE than finding by icon or text
      /// which might change
      await tester.tap(find.byKey(const Key('increment_button')));
      
      /// STEP 4: REBUILD WIDGET
      /// 
      /// pump(): Triggers a single frame rebuild
      /// After setState() is called, we need pump() to see changes
      /// 
      /// Think of it as: "Update the UI now"
      await tester.pump();

      /// STEP 5: VERIFY NEW STATE
      /// 
      /// Counter should now be 1
      /// Old value (0) should not be found anymore
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);  // findsNothing: Expects 0 matches

      // Test multiple taps
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });

    /// WIDGET TEST: Decrement button
    testWidgets('decrement button decreases counter', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // First increment to 3 (setup state)
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      expect(find.text('3'), findsOneWidget);

      // Now test decrement
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsNothing);
    });

    /// WIDGET TEST: Business rule verification
    /// 
    /// Tests that counter respects business rule: cannot go below 0
    /// This is IMPORTANT - tests that UI enforces business logic
    testWidgets('decrement does not go below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Try to decrement from 0
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();

      // Should still be 0 (not negative!)
      expect(find.text('0'), findsOneWidget);
    });

    /// WIDGET TEST: Reset functionality
    testWidgets('reset button sets counter to zero', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Increment to 5 using a loop (cleaner than 5 separate taps)
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byKey(const Key('increment_button')));
        await tester.pump();
      }

      expect(find.text('5'), findsOneWidget);

      // Tap reset button
      await tester.tap(find.byKey(const Key('reset_button')));
      await tester.pump();

      // Should be back to 0
      expect(find.text('0'), findsOneWidget);
      expect(find.text('5'), findsNothing);
    });

    /// WIDGET TEST: Widget presence verification
    /// 
    /// Verifies that all expected buttons exist in the UI
    /// Tests layout/structure rather than behavior
    testWidgets('all buttons are present', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      /// FIND BY KEY: Most reliable way to find widgets
      /// Verifies each button exists exactly once
      expect(find.byKey(const Key('increment_button')), findsOneWidget);
      expect(find.byKey(const Key('decrement_button')), findsOneWidget);
      expect(find.byKey(const Key('reset_button')), findsOneWidget);

      /// FIND BY ICON: Alternative way to find widgets
      /// Useful when you don't have keys
      /// Less reliable if multiple widgets use same icon
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    /// WIDGET TEST: Complex interaction sequence
    /// 
    /// Tests multiple interactions in sequence
    /// Simulates realistic user behavior
    /// Verifies state is maintained correctly throughout
    testWidgets('complex interaction sequence', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Start at 0
      expect(find.text('0'), findsOneWidget);

      // Increment 3 times: 0 → 3
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('increment_button')));
        await tester.pump();
      }
      expect(find.text('3'), findsOneWidget);

      // Decrement once: 3 → 2
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Increment twice more: 2 → 4
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('4'), findsOneWidget);

      // Reset to 0: 4 → 0
      await tester.tap(find.byKey(const Key('reset_button')));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });

    /// WIDGET TEST: Informational content
    /// 
    /// Verifies that info card is displayed with correct content
    testWidgets('info card is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify info card content exists
      expect(find.text('This app demonstrates:'), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });
  });
}

/// WIDGET TESTING CONCEPTS
/// 
/// 1. WidgetTester Methods:
///    - pumpWidget(): Build widget for testing
///    - pump(): Rebuild after state change (one frame)
///    - pumpAndSettle(): Rebuild until animations complete
///    - tap(): Simulate tap gesture
///    - drag(): Simulate drag gesture
///    - enterText(): Type into text field
/// 
/// 2. Finder Methods:
///    - find.text('Hello'): Find by text content
///    - find.byKey(Key('my_key')): Find by unique key
///    - find.byIcon(Icons.add): Find by icon
///    - find.byType(ElevatedButton): Find by widget type
///    - find.byWidgetPredicate(): Find by custom condition
/// 
/// 3. Matchers:
///    - findsOneWidget: Expects exactly 1 match
///    - findsNothing: Expects 0 matches
///    - findsNWidgets(n): Expects exactly n matches
///    - findsWidgets: Expects 1 or more matches
/// 
/// 4. Why Use Keys?
///    - Unique identification of widgets
///    - More reliable than find.text() or find.byIcon()
///    - Text/icons might change, keys stay stable
///    - Essential for lists and dynamic widgets
/// 
/// 5. When to Use pump() vs pumpAndSettle():
///    - pump(): Single frame - for immediate state changes
///    - pumpAndSettle(): Wait for animations - for delayed changes
/// 
/// 6. Best Practices:
///    - Test user interactions, not implementation
///    - Use keys for important interactive widgets
///    - Test edge cases and error states
///    - Keep tests focused (one behavior per test)
///    - Clean test names that describe behavior
