/// Unit Tests for Utility Classes
/// 
/// This file demonstrates UNIT TESTING in Flutter:
/// - Testing individual functions and classes
/// - No UI testing (that's widget tests)
/// - Fast execution (no rendering)
/// - Focus on business logic correctness
/// 
/// To run these tests: flutter test test/utils_test.dart
/// Or run all tests: flutter test
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/utils.dart';

/// Main entry point for tests
/// Tests are organized in groups for better structure
void main() {
  /// GROUP: Calculator Tests
  /// 
  /// Groups organize related tests together
  /// Makes test output easier to read
  /// Can run specific groups: flutter test --name="Calculator"
  group('Calculator Tests', () {
    /// late: Variable that will be initialized before each test
    /// Calculator instance used in all tests in this group
    late Calculator calculator;

    /// setUp: Runs before EACH test in this group
    /// 
    /// Purpose: Initialize fresh state for each test
    /// Ensures tests don't affect each other
    /// Creates new Calculator instance for each test
    setUp(() {
      calculator = Calculator();
    });

    /// TEST: Individual test case
    /// 
    /// Format: test('description', () { /* test code */ })
    /// 
    /// Good test descriptions:
    /// ✓ "addition works correctly"
    /// ✗ "test1"
    /// 
    /// Each test should verify ONE specific behavior
    test('addition works correctly', () {
      /// expect: Assert that something is true
      /// Format: expect(actual, matcher)
      /// 
      /// If expectation fails, test fails with helpful message
      
      // Test basic addition
      expect(calculator.add(2, 3), 5);
      
      // Test negative numbers
      expect(calculator.add(-1, 1), 0);
      
      // Test edge case: zero
      expect(calculator.add(0, 0), 0);
    });

    test('subtraction works correctly', () {
      expect(calculator.subtract(5, 3), 2);
      expect(calculator.subtract(0, 5), -5);  // Result can be negative
      expect(calculator.subtract(10, 10), 0); // Same numbers = 0
    });

    test('multiplication works correctly', () {
      expect(calculator.multiply(2, 3), 6);
      expect(calculator.multiply(-2, 3), -6);  // Negative numbers
      expect(calculator.multiply(0, 5), 0);    // Zero multiplication
    });

    test('division works correctly', () {
      expect(calculator.divide(6, 2), 3);
      expect(calculator.divide(10, 4), 2.5);  // Decimal result
      expect(calculator.divide(0, 5), 0);     // Zero divided = 0
    });

    /// TEST: Exception testing
    /// 
    /// throwsArgumentError: Matcher for ArgumentError exception
    /// () => code: Lambda function that throws the exception
    /// 
    /// This verifies that divide(5, 0) throws an error (expected behavior)
    test('division by zero throws error', () {
      expect(() => calculator.divide(5, 0), throwsArgumentError);
    });
  });

  /// GROUP: Counter Tests
  /// 
  /// Tests stateful object with business rules
  group('Counter Tests', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    /// TEST: Initial state
    /// 
    /// IMPORTANT: Always test initial/default state
    /// Verifies object starts in expected state
    test('initial value is zero', () {
      expect(counter.value, 0);
    });

    /// TEST: State change
    /// 
    /// Tests that calling increment() changes state correctly
    test('increment increases value', () {
      counter.increment();
      expect(counter.value, 1);
      
      // Test multiple increments
      counter.increment();
      expect(counter.value, 2);
    });

    test('decrement decreases value', () {
      // First set up state (value = 3)
      counter.increment();
      counter.increment();
      counter.increment();
      expect(counter.value, 3);
      
      // Now test decrement
      counter.decrement();
      expect(counter.value, 2);
    });

    /// TEST: Business rule
    /// 
    /// Counter has a rule: Cannot go below 0
    /// This test verifies that rule is enforced
    /// 
    /// This is WHY testing is important - catches bugs in business logic!
    test('decrement does not go below zero', () {
      // Try to decrement from 0
      counter.decrement();
      expect(counter.value, 0);  // Should still be 0
      
      // Try again
      counter.decrement();
      expect(counter.value, 0);  // Still 0 (not negative!)
    });

    test('reset sets value to zero', () {
      // Set up: Increment to 3
      counter.increment();
      counter.increment();
      counter.increment();
      expect(counter.value, 3);
      
      // Action: Reset
      counter.reset();
      
      // Verify: Back to 0
      expect(counter.value, 0);
    });
  });

  /// GROUP: TodoList Tests
  /// 
  /// Tests complex business logic with collections
  group('TodoList Tests', () {
    late TodoList todoList;

    setUp(() {
      todoList = TodoList();
    });

    /// TEST: Initial state of collection
    test('initially empty', () {
      expect(todoList.items.length, 0);
      expect(todoList.completedCount, 0);
      expect(todoList.activeCount, 0);
    });

    /// TEST: Adding items
    test('can add items', () {
      todoList.addItem('Buy groceries');
      
      // Verify item was added
      expect(todoList.items.length, 1);
      
      // Verify item content is correct
      expect(todoList.items[0].title, 'Buy groceries');
    });

    /// TEST: Business rule - cannot add empty items
    /// 
    /// This prevents invalid data in the list
    test('cannot add empty items', () {
      todoList.addItem('');
      
      // List should still be empty
      expect(todoList.items.length, 0);
    });

    /// TEST: Removing items
    test('can remove items', () {
      // Setup: Add 2 items
      todoList.addItem('Task 1');
      todoList.addItem('Task 2');
      expect(todoList.items.length, 2);
      
      // Action: Remove first item (index 0)
      todoList.removeItem(0);
      
      // Verify: Only 1 item left, and it's Task 2
      expect(todoList.items.length, 1);
      expect(todoList.items[0].title, 'Task 2');
    });

    /// TEST: Toggling completion state
    test('can toggle item completion', () {
      todoList.addItem('Task 1');
      
      // Initially incomplete
      expect(todoList.items[0].isCompleted, false);
      
      // Toggle to complete
      todoList.toggleItem(0);
      expect(todoList.items[0].isCompleted, true);
      
      // Toggle back to incomplete
      todoList.toggleItem(0);
      expect(todoList.items[0].isCompleted, false);
    });

    /// TEST: Computed properties
    /// 
    /// Tests that completedCount and activeCount are calculated correctly
    /// These properties should always reflect the current state
    test('counts completed items correctly', () {
      // Add 3 tasks
      todoList.addItem('Task 1');
      todoList.addItem('Task 2');
      todoList.addItem('Task 3');
      
      // All incomplete
      expect(todoList.completedCount, 0);
      expect(todoList.activeCount, 3);
      
      // Complete first task
      todoList.toggleItem(0);
      expect(todoList.completedCount, 1);
      expect(todoList.activeCount, 2);
      
      // Complete second task
      todoList.toggleItem(1);
      expect(todoList.completedCount, 2);
      expect(todoList.activeCount, 1);
    });
  });

  /// GROUP: TodoItem Tests
  /// 
  /// Tests simple data model
  group('TodoItem Tests', () {
    test('creates with correct initial state', () {
      final todo = TodoItem(title: 'Test Task');
      
      // Verify properties
      expect(todo.title, 'Test Task');
      expect(todo.isCompleted, false);  // Default is incomplete
    });

    test('can create completed item', () {
      final todo = TodoItem(title: 'Test Task', isCompleted: true);
      expect(todo.isCompleted, true);
    });

    test('toggle changes completion state', () {
      final todo = TodoItem(title: 'Test Task');
      expect(todo.isCompleted, false);
      
      todo.toggle();
      expect(todo.isCompleted, true);
      
      todo.toggle();
      expect(todo.isCompleted, false);
    });
  });
}

/// TESTING BEST PRACTICES
/// 
/// 1. One assertion per test (when possible)
///    - Makes failures easier to understand
///    - Clear test purpose
/// 
/// 2. AAA Pattern: Arrange, Act, Assert
///    - Arrange: Set up test data
///    - Act: Execute the code being tested
///    - Assert: Verify the result
/// 
/// 3. Test edge cases
///    - Empty values, null, zero
///    - Boundary conditions
///    - Error cases
/// 
/// 4. Use descriptive test names
///    - What behavior is being tested
///    - What the expected outcome is
/// 
/// 5. Keep tests independent
///    - Each test should be able to run alone
///    - Use setUp for fresh state
///    - Don't rely on test execution order
/// 
/// 6. Fast tests
///    - Unit tests should be very fast (milliseconds)
///    - Don't use real network, databases, etc.
///    - Use mocks/stubs for dependencies
