// Utility functions for testing
class Calculator {
  int add(int a, int b) => a + b;
  
  int subtract(int a, int b) => a - b;
  
  int multiply(int a, int b) => a * b;
  
  double divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }
}

class Counter {
  int _value = 0;
  
  int get value => _value;
  
  void increment() {
    _value++;
  }
  
  void decrement() {
    if (_value > 0) {
      _value--;
    }
  }
  
  void reset() {
    _value = 0;
  }
}

class TodoItem {
  final String title;
  bool isCompleted;
  
  TodoItem({required this.title, this.isCompleted = false});
  
  void toggle() {
    isCompleted = !isCompleted;
  }
}

class TodoList {
  final List<TodoItem> _items = [];
  
  List<TodoItem> get items => List.unmodifiable(_items);
  
  void addItem(String title) {
    if (title.isNotEmpty) {
      _items.add(TodoItem(title: title));
    }
  }
  
  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }
  
  void toggleItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index].toggle();
    }
  }
  
  int get completedCount {
    return _items.where((item) => item.isCompleted).length;
  }
  
  int get activeCount {
    return _items.where((item) => !item.isCompleted).length;
  }
}
