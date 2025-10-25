/// Utility Classes for Unit Testing Examples
/// 
/// This file contains simple classes to demonstrate unit testing in Flutter:
/// 1. Calculator - Mathematical operations
/// 2. Counter - State management
/// 3. TodoItem - Data model
/// 4. TodoList - Business logic
/// 
/// These classes represent common patterns you'll test in real apps

/// Calculator - Simple mathematical operations
/// 
/// Purpose: Demonstrates testing pure functions (no side effects)
/// Testing focus: Input/output correctness, edge cases, error handling
class Calculator {
  /// Add two numbers
  /// Example: add(2, 3) → 5
  int add(int a, int b) => a + b;
  
  /// Subtract b from a
  /// Example: subtract(5, 3) → 2
  int subtract(int a, int b) => a - b;
  
  /// Multiply two numbers
  /// Example: multiply(3, 4) → 12
  int multiply(int a, int b) => a * b;
  
  /// Divide a by b
  /// 
  /// Throws ArgumentError if b is 0 (cannot divide by zero)
  /// Returns double to allow decimal results
  /// 
  /// Example: divide(10, 4) → 2.5
  /// Example: divide(5, 0) → throws ArgumentError
  double divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
}

/// Counter - State management example
/// 
/// Purpose: Demonstrates testing stateful objects
/// Testing focus: State changes, business rules (e.g., no negative values)
/// 
/// Similar to a real counter app's business logic
class Counter {
  // Private variable - only accessible through methods
  int _value = 0;
  
  /// Current counter value (read-only)
  int get value => _value;
  
  /// Increment counter by 1
  /// No upper limit - can increment indefinitely
  void increment() {
    _value++;
  }
  
  /// Decrement counter by 1
  /// RULE: Counter cannot go below 0 (business logic to test!)
  void decrement() {
    if (_value > 0) {
      _value--;
    }
  }
  
  /// Reset counter to 0
  /// Useful for starting fresh
  void reset() {
    _value = 0;
  }
}

/// TodoItem - Individual task in a todo list
/// 
/// Purpose: Demonstrates testing data models
/// Testing focus: Property behavior, state toggling
/// 
/// Represents a single task with completion state
class TodoItem {
  /// Task description
  final String title;
  
  /// Whether task is completed
  /// Can be changed via toggle() method
  bool isCompleted;
  
  /// Constructor
  /// [title] is required
  /// [isCompleted] defaults to false (new tasks are incomplete)
  TodoItem({required this.title, this.isCompleted = false});
  
  /// Toggle completion state
  /// If false → true, if true → false
  /// 
  /// Example:
  /// ```dart
  /// todo.isCompleted; // false
  /// todo.toggle();
  /// todo.isCompleted; // true
  /// ```
  void toggle() {
    isCompleted = !isCompleted;
  }
}

/// TodoList - Manages a collection of todo items
/// 
/// Purpose: Demonstrates testing business logic with collections
/// Testing focus: CRUD operations, computed properties, edge cases
/// 
/// This is like the "model" or "service" in a real app
/// Contains the business rules for managing todos
class TodoList {
  // Private list - only accessible through getters/methods
  final List<TodoItem> _items = [];
  
  /// Get all items (immutable copy)
  /// Using List.unmodifiable prevents external modification
  /// This enforces that only our methods can change the list
  List<TodoItem> get items => List.unmodifiable(_items);
  
  /// Add new todo item
  /// 
  /// RULE: Cannot add empty titles (business logic to test!)
  /// 
  /// Example:
  /// ```dart
  /// todoList.addItem('Buy milk'); // ✓ Added
  /// todoList.addItem('');         // ✗ Not added (empty)
  /// ```
  void addItem(String title) {
    if (title.isNotEmpty) {
      _items.add(TodoItem(title: title));
    }
  }
  
  /// Remove item at index
  /// 
  /// RULE: Index must be valid (0 to length-1)
  /// Does nothing if index is out of bounds (safe behavior)
  /// 
  /// Example:
  /// ```dart
  /// // List has 3 items
  /// todoList.removeItem(1);  // ✓ Removes 2nd item
  /// todoList.removeItem(10); // ✗ Does nothing (index too high)
  /// ```
  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }
  
  /// Toggle completion state of item at index
  /// 
  /// RULE: Index must be valid
  /// Does nothing if index is out of bounds (safe behavior)
  void toggleItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index].toggle();
    }
  }
  
  /// Computed property: Count of completed items
  /// 
  /// Uses where() to filter completed items
  /// Returns count dynamically (no stored value)
  /// 
  /// Example: If list has [✓, ✗, ✓, ✗], returns 2
  int get completedCount {
    return _items.where((item) => item.isCompleted).length;
  }
  
  /// Computed property: Count of active (incomplete) items
  /// 
  /// Opposite of completedCount
  /// 
  /// Example: If list has [✓, ✗, ✓, ✗], returns 2
  int get activeCount {
    return _items.where((item) => !item.isCompleted).length;
  }
}
