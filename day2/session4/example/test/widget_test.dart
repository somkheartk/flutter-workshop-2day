import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/main.dart';

void main() {
  group('CounterPage Widget Tests', () {
    testWidgets('displays initial counter value', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Verify initial state
      expect(find.text('0'), findsOneWidget);
      expect(find.text('Counter Value:'), findsOneWidget);
    });

    testWidgets('increment button increases counter', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Verify initial value
      expect(find.text('0'), findsOneWidget);

      // Tap the increment button
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      // Verify counter increased
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Tap again
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('decrement button decreases counter', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // First increment to 3
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      expect(find.text('3'), findsOneWidget);

      // Now decrement
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsNothing);
    });

    testWidgets('decrement does not go below zero', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Try to decrement from 0
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();

      // Should still be 0
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('reset button sets counter to zero', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Increment to 5
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

    testWidgets('all buttons are present', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Verify all buttons exist
      expect(find.byKey(const Key('increment_button')), findsOneWidget);
      expect(find.byKey(const Key('decrement_button')), findsOneWidget);
      expect(find.byKey(const Key('reset_button')), findsOneWidget);

      // Verify button icons
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('complex interaction sequence', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Start at 0
      expect(find.text('0'), findsOneWidget);

      // Increment 3 times
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('increment_button')));
        await tester.pump();
      }
      expect(find.text('3'), findsOneWidget);

      // Decrement once
      await tester.tap(find.byKey(const Key('decrement_button')));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Increment twice more
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('4'), findsOneWidget);

      // Reset to 0
      await tester.tap(find.byKey(const Key('reset_button')));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('info card is displayed', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(const MyApp());

      // Verify info card content
      expect(find.text('This app demonstrates:'), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });
  });
}
