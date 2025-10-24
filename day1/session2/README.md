# Session 2: Dart Programming Basics

## 📖 Overview

This session covers the fundamentals of Dart programming language, which is used to build Flutter applications.

---

## 🎯 Learning Objectives

After this session, you will be able to:
- Write basic Dart code
- Use variables, data types, and operators
- Create functions and classes
- Understand object-oriented programming in Dart

---

## 1. Getting Started with Dart

### What is Dart?

Dart is a client-optimized programming language developed by Google for:
- Fast apps on any platform
- Productive development
- Sound null safety

### Try Dart Online

Visit [DartPad](https://dartpad.dev/) to write and run Dart code in your browser.

---

## 2. Variables and Data Types

### Variable Declaration

```dart
// var - type inference
var name = 'John';
var age = 25;

// explicit type
String city = 'Bangkok';
int year = 2025;
double price = 99.99;
bool isActive = true;

// final - runtime constant
final currentDate = DateTime.now();

// const - compile-time constant
const PI = 3.14159;
```

### Basic Data Types

```dart
// Numbers
int count = 42;
double temperature = 36.5;
num value = 100; // can be int or double

// Strings
String greeting = 'Hello';
String message = "Welcome to Flutter";
String multiline = '''
This is a
multi-line string
''';

// Booleans
bool isLoggedIn = true;
bool hasPermission = false;

// Lists (Arrays)
List<int> numbers = [1, 2, 3, 4, 5];
var fruits = ['Apple', 'Banana', 'Orange'];

// Maps (Dictionaries)
Map<String, dynamic> user = {
  'name': 'John',
  'age': 25,
  'email': 'john@example.com'
};

// Sets
Set<String> colors = {'Red', 'Green', 'Blue'};
```

### Null Safety

```dart
// Non-nullable (default)
String name = 'John'; // cannot be null

// Nullable (with ?)
String? middleName; // can be null
int? age;

// Using nullable values
String? getName() {
  return null;
}

void printName() {
  String? name = getName();
  
  // Null-aware operator
  print(name ?? 'Unknown'); // 'Unknown' if null
  
  // Null-aware access
  print(name?.length); // null if name is null
  
  // Assert non-null
  print(name!.length); // throws if null
}
```

### String Interpolation

```dart
String name = 'John';
int age = 25;

// Simple interpolation
print('Hello, $name');

// Expression interpolation
print('Next year you will be ${age + 1}');

// String concatenation
String fullMessage = 'Hello, ' + name + '!';
```

---

## 3. Operators

### Arithmetic Operators

```dart
int a = 10, b = 3;

print(a + b);  // 13 - addition
print(a - b);  // 7  - subtraction
print(a * b);  // 30 - multiplication
print(a / b);  // 3.333... - division
print(a ~/ b); // 3  - integer division
print(a % b);  // 1  - modulo
```

### Comparison Operators

```dart
int x = 5, y = 10;

print(x == y);  // false - equal to
print(x != y);  // true  - not equal to
print(x > y);   // false - greater than
print(x < y);   // true  - less than
print(x >= y);  // false - greater than or equal
print(x <= y);  // true  - less than or equal
```

### Logical Operators

```dart
bool a = true, b = false;

print(a && b);  // false - AND
print(a || b);  // true  - OR
print(!a);      // false - NOT
```

---

## 4. Control Flow

### If-Else Statements

```dart
int score = 85;

if (score >= 90) {
  print('Grade: A');
} else if (score >= 80) {
  print('Grade: B');
} else if (score >= 70) {
  print('Grade: C');
} else {
  print('Grade: F');
}

// Ternary operator
String result = score >= 50 ? 'Pass' : 'Fail';
```

### Switch Statements

```dart
String grade = 'B';

switch (grade) {
  case 'A':
    print('Excellent!');
    break;
  case 'B':
    print('Good!');
    break;
  case 'C':
    print('Fair');
    break;
  default:
    print('Need improvement');
}
```

### Loops

```dart
// For loop
for (int i = 0; i < 5; i++) {
  print('Count: $i');
}

// For-in loop
List<String> fruits = ['Apple', 'Banana', 'Orange'];
for (var fruit in fruits) {
  print(fruit);
}

// While loop
int count = 0;
while (count < 5) {
  print('Count: $count');
  count++;
}

// Do-While loop
int number = 0;
do {
  print('Number: $number');
  number++;
} while (number < 3);

// forEach
fruits.forEach((fruit) {
  print('I like $fruit');
});
```

---

## 5. Functions

### Basic Functions

```dart
// Simple function
void greet() {
  print('Hello!');
}

// Function with return value
String getMessage() {
  return 'Welcome to Flutter';
}

// Function with parameters
int add(int a, int b) {
  return a + b;
}

// Arrow function (for single expressions)
int multiply(int a, int b) => a * b;

// Calling functions
greet();
print(getMessage());
print(add(5, 3));
print(multiply(4, 7));
```

### Optional Parameters

```dart
// Optional positional parameters
String greet(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  }
  return 'Hello, $name';
}

print(greet('John'));           // Hello, John
print(greet('John', 'Mr.'));    // Hello, Mr. John

// Optional named parameters
void printUser({String? name, int? age}) {
  print('Name: $name, Age: $age');
}

printUser(name: 'John', age: 25);
printUser(name: 'Jane');

// Required named parameters
void createUser({required String name, required int age}) {
  print('User: $name, Age: $age');
}

createUser(name: 'John', age: 25);

// Default parameter values
String greetPerson(String name, [String greeting = 'Hello']) {
  return '$greeting, $name';
}

print(greetPerson('John'));              // Hello, John
print(greetPerson('John', 'Hi'));        // Hi, John
```

### Anonymous Functions

```dart
// Anonymous function
var list = [1, 2, 3, 4, 5];

list.forEach((item) {
  print('Item: $item');
});

// Arrow function
list.forEach((item) => print('Number: $item'));

// Function as parameter
List<int> filterNumbers(List<int> numbers, bool Function(int) test) {
  List<int> result = [];
  for (var number in numbers) {
    if (test(number)) {
      result.add(number);
    }
  }
  return result;
}

var evenNumbers = filterNumbers([1, 2, 3, 4, 5, 6], (n) => n % 2 == 0);
print(evenNumbers); // [2, 4, 6]
```

---

## 6. Object-Oriented Programming

### Classes and Objects

```dart
// Define a class
class Person {
  // Properties
  String name;
  int age;
  
  // Constructor
  Person(this.name, this.age);
  
  // Method
  void introduce() {
    print('Hi, I am $name and I am $age years old.');
  }
}

// Create objects
var person1 = Person('John', 25);
var person2 = Person('Jane', 30);

person1.introduce(); // Hi, I am John and I am 25 years old.
person2.introduce(); // Hi, I am Jane and I am 30 years old.
```

### Constructors

```dart
class User {
  String name;
  int age;
  String? email;
  
  // Default constructor
  User(this.name, this.age, [this.email]);
  
  // Named constructor
  User.guest() : name = 'Guest', age = 0;
  
  // Named constructor with parameters
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        email = json['email'];
}

// Usage
var user1 = User('John', 25, 'john@example.com');
var user2 = User.guest();
var user3 = User.fromJson({
  'name': 'Jane',
  'age': 30,
  'email': 'jane@example.com'
});
```

### Getters and Setters

```dart
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  // Getter
  double get area => width * height;
  
  // Setter
  set dimensions(List<double> values) {
    width = values[0];
    height = values[1];
  }
}

var rect = Rectangle(5, 10);
print(rect.area);           // 50.0
rect.dimensions = [3, 4];
print(rect.area);           // 12.0
```

### Inheritance

```dart
// Base class
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('$name makes a sound');
  }
}

// Derived class
class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  @override
  void makeSound() {
    print('$name barks');
  }
  
  void fetch() {
    print('$name fetches the ball');
  }
}

var dog = Dog('Buddy', 'Golden Retriever');
dog.makeSound(); // Buddy barks
dog.fetch();     // Buddy fetches the ball
```

---

## 💻 Hands-on Exercise

### Exercise 1: Variables and Types

```dart
void main() {
  // TODO: Create variables for your personal info
  // name, age, city, isStudent
  
  // TODO: Print a formatted message using string interpolation
}
```

### Exercise 2: Functions

```dart
// TODO: Create a function that calculates BMI
// BMI = weight(kg) / (height(m) * height(m))
double calculateBMI(double weight, double height) {
  // Your code here
}

void main() {
  // Test your function
  print(calculateBMI(70, 1.75));
}
```

### Exercise 3: Classes

```dart
// TODO: Create a Product class with:
// - Properties: name, price, quantity
// - Method: getTotalPrice()
// - Constructor

void main() {
  // Create product objects and test
}
```

### Exercise 4: Collections

```dart
void main() {
  // TODO: Create a list of numbers
  // TODO: Filter even numbers
  // TODO: Calculate sum of even numbers
  // TODO: Print the result
}
```

---

## 📚 Practice Resources

- [DartPad](https://dartpad.dev/) - Online Dart editor
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Dart Cheatsheet](https://dart.dev/codelabs/dart-cheatsheet)

---

## ✅ Checklist

- [ ] Understand Dart variables and data types
- [ ] Know how to use operators
- [ ] Can write control flow statements
- [ ] Can create and use functions
- [ ] Understand classes and objects
- [ ] Completed practice exercises

---

## 🔜 Next Steps

Continue to [Session 3: Flutter Widgets & Layouts](../session3/README.md)

---

[← Back to Day 1](../README.md)
