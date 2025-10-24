import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/utils.dart';

void main() {
  group('Calculator Tests', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    test('addition works correctly', () {
      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-1, 1), 0);
      expect(calculator.add(0, 0), 0);
    });

    test('subtraction works correctly', () {
      expect(calculator.subtract(5, 3), 2);
      expect(calculator.subtract(0, 5), -5);
      expect(calculator.subtract(10, 10), 0);
    });

    test('multiplication works correctly', () {
      expect(calculator.multiply(2, 3), 6);
      expect(calculator.multiply(-2, 3), -6);
      expect(calculator.multiply(0, 5), 0);
    });

    test('division works correctly', () {
      expect(calculator.divide(6, 2), 3);
      expect(calculator.divide(10, 4), 2.5);
      expect(calculator.divide(0, 5), 0);
    });

    test('division by zero throws error', () {
      expect(() => calculator.divide(5, 0), throwsArgumentError);
    });
  });

  group('Counter Tests', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('initial value is zero', () {
      expect(counter.value, 0);
    });

    test('increment increases value', () {
      counter.increment();
      expect(counter.value, 1);
      
      counter.increment();
      expect(counter.value, 2);
    });

    test('decrement decreases value', () {
      counter.increment();
      counter.increment();
      counter.increment();
      expect(counter.value, 3);
      
      counter.decrement();
      expect(counter.value, 2);
    });

    test('decrement does not go below zero', () {
      counter.decrement();
      expect(counter.value, 0);
      
      counter.decrement();
      expect(counter.value, 0);
    });

    test('reset sets value to zero', () {
      counter.increment();
      counter.increment();
      counter.increment();
      expect(counter.value, 3);
      
      counter.reset();
      expect(counter.value, 0);
    });
  });

  group('TodoList Tests', () {
    late TodoList todoList;

    setUp(() {
      todoList = TodoList();
    });

    test('initially empty', () {
      expect(todoList.items.length, 0);
      expect(todoList.completedCount, 0);
      expect(todoList.activeCount, 0);
    });

    test('can add items', () {
      todoList.addItem('Buy groceries');
      expect(todoList.items.length, 1);
      expect(todoList.items[0].title, 'Buy groceries');
    });

    test('cannot add empty items', () {
      todoList.addItem('');
      expect(todoList.items.length, 0);
    });

    test('can remove items', () {
      todoList.addItem('Task 1');
      todoList.addItem('Task 2');
      expect(todoList.items.length, 2);
      
      todoList.removeItem(0);
      expect(todoList.items.length, 1);
      expect(todoList.items[0].title, 'Task 2');
    });

    test('can toggle item completion', () {
      todoList.addItem('Task 1');
      expect(todoList.items[0].isCompleted, false);
      
      todoList.toggleItem(0);
      expect(todoList.items[0].isCompleted, true);
      
      todoList.toggleItem(0);
      expect(todoList.items[0].isCompleted, false);
    });

    test('counts completed items correctly', () {
      todoList.addItem('Task 1');
      todoList.addItem('Task 2');
      todoList.addItem('Task 3');
      
      expect(todoList.completedCount, 0);
      expect(todoList.activeCount, 3);
      
      todoList.toggleItem(0);
      expect(todoList.completedCount, 1);
      expect(todoList.activeCount, 2);
      
      todoList.toggleItem(1);
      expect(todoList.completedCount, 2);
      expect(todoList.activeCount, 1);
    });
  });

  group('TodoItem Tests', () {
    test('creates with correct initial state', () {
      final todo = TodoItem(title: 'Test Task');
      expect(todo.title, 'Test Task');
      expect(todo.isCompleted, false);
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
