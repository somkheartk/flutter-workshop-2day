// Session 2: Dart Programming Basics Examples
// Run with: dart 01_variables.dart

void main() {
  print('=== Variables and Data Types ===\n');
  
  // Variables with type inference
  var name = 'John Doe';
  var age = 25;
  var height = 1.75;
  var isStudent = true;
  
  print('Name: $name');
  print('Age: $age');
  print('Height: $height m');
  print('Is Student: $isStudent');
  
  // Explicit types
  String city = 'Bangkok';
  int year = 2025;
  double price = 99.99;
  bool hasPermission = false;
  
  print('\nExplicit Types:');
  print('City: $city');
  print('Year: $year');
  print('Price: ฿$price');
  print('Has Permission: $hasPermission');
  
  // Constants
  final currentDate = DateTime.now();
  const PI = 3.14159;
  
  print('\nConstants:');
  print('Current Date: $currentDate');
  print('PI: $PI');
  
  // Lists
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  print('\nFruits: $fruits');
  print('First fruit: ${fruits[0]}');
  print('Number of fruits: ${fruits.length}');
  
  // Maps
  Map<String, dynamic> user = {
    'name': 'Jane Smith',
    'age': 30,
    'email': 'jane@example.com',
    'isActive': true,
  };
  
  print('\nUser Info:');
  print('Name: ${user['name']}');
  print('Email: ${user['email']}');
  print('Age: ${user['age']}');
  
  // Null Safety
  String? middleName; // Can be null
  print('\nNull Safety:');
  print('Middle Name: ${middleName ?? "Not provided"}');
  
  // String Interpolation
  String greeting = 'Hello, $name! You are $age years old.';
  String nextYear = 'Next year you will be ${age + 1} years old.';
  
  print('\nString Interpolation:');
  print(greeting);
  print(nextYear);
}
