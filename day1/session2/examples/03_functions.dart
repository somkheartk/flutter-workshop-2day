// Session 2: Functions Examples
// Run with: dart 03_functions.dart

void main() {
  print('=== Functions ===\n');
  
  // Simple functions
  print('1. Simple Functions:');
  greet();
  String message = getMessage();
  print(message);
  
  // Functions with parameters
  print('\n2. Functions with Parameters:');
  int sum = add(5, 3);
  print('5 + 3 = $sum');
  
  int product = multiply(4, 7);
  print('4 × 7 = $product');
  
  // Optional parameters
  print('\n3. Optional Parameters:');
  print(greetPerson('John'));
  print(greetPerson('Jane', 'Ms.'));
  
  // Named parameters
  print('\n4. Named Parameters:');
  printUser(name: 'Alice', age: 28);
  printUser(name: 'Bob', age: 35, city: 'Bangkok');
  
  // Required named parameters
  print('\n5. Required Named Parameters:');
  createUser(name: 'Charlie', email: 'charlie@example.com');
  
  // Default parameter values
  print('\n6. Default Parameter Values:');
  print(greetWithDefault('David'));
  print(greetWithDefault('Emma', 'Good morning'));
  
  // Anonymous functions
  print('\n7. Anonymous Functions:');
  var numbers = [1, 2, 3, 4, 5];
  numbers.forEach((num) => print('Number: $num'));
  
  // Function as parameter
  print('\n8. Function as Parameter:');
  var evenNumbers = filterNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (n) => n % 2 == 0);
  print('Even numbers: $evenNumbers');
  
  var numbersGreaterThan5 = filterNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (n) => n > 5);
  print('Numbers > 5: $numbersGreaterThan5');
}

// Simple function without return
void greet() {
  print('Hello, welcome to Flutter!');
}

// Function with return value
String getMessage() {
  return 'Welcome to Dart programming!';
}

// Function with parameters
int add(int a, int b) {
  return a + b;
}

// Arrow function (for single expressions)
int multiply(int a, int b) => a * b;

// Optional positional parameters
String greetPerson(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  }
  return 'Hello, $name';
}

// Optional named parameters
void printUser({required String name, int? age, String? city}) {
  print('User: $name${age != null ? ", Age: $age" : ""}${city != null ? ", City: $city" : ""}');
}

// Required named parameters
void createUser({required String name, required String email}) {
  print('Created user: $name ($email)');
}

// Default parameter values
String greetWithDefault(String name, [String greeting = 'Hello']) {
  return '$greeting, $name!';
}

// Function accepting another function as parameter
List<int> filterNumbers(List<int> numbers, bool Function(int) test) {
  List<int> result = [];
  for (var number in numbers) {
    if (test(number)) {
      result.add(number);
    }
  }
  return result;
}
