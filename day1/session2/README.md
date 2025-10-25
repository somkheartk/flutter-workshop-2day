# Session 2: Dart Programming Basics

## 📖 Overview

This session covers the fundamentals of Dart programming language, which is used to build Flutter applications.

> 💡 **Why Learn Dart?**: Dart is the language Flutter uses. Understanding Dart is like learning the vocabulary before writing a story. Once you know Dart, building Flutter apps becomes much easier!

**Duration:** 75 minutes  
**Difficulty:** Beginner

---

## 🎯 Learning Objectives

After this session, you will be able to:

**Core Concepts:**
- ✅ Understand what Dart is and why Flutter uses it
- ✅ Write and run basic Dart code
- ✅ Use variables and data types correctly
- ✅ Create and call functions
- ✅ Understand object-oriented programming basics

**Practical Skills:**
- 🔨 Write Dart programs using DartPad
- 🔨 Declare variables with proper types
- 🔨 Create functions that do useful things
- 🔨 Build simple classes and objects
- 🔨 Use Dart's null safety features

**Why This Matters:**
- Every Flutter widget is written in Dart
- Understanding Dart = Understanding Flutter
- Good Dart skills = Better Flutter apps

---

## 🗺️ Learning Path

> 📚 **Follow this order for best results:**

```
1. What is Dart? (10 min)
   ↓
2. Variables & Types (15 min)
   ↓
3. Control Flow (10 min)
   ↓
4. Functions (15 min)
   ↓
5. Classes & OOP (20 min)
   ↓
6. Practice Exercises (15 min)
```

---

## 1. Getting Started with Dart

### What is Dart?

> 🎓 **Simple Explanation**: Dart is a programming language, just like JavaScript, Python, or Java. It's what you use to tell Flutter what to do.

Dart is a client-optimized programming language developed by Google for:
- 🚀 **Fast apps** on any platform (mobile, web, desktop)
- 💻 **Productive development** (easy to write and read)
- 🛡️ **Sound null safety** (prevents common errors before they happen)

**Key Features:**
- **Easy to Learn**: If you know any programming language, Dart feels familiar
- **Type Safe**: Catches errors before you run the code
- **Modern**: Has all the features you'd expect in a modern language
- **Optimized**: Compiles to fast native code

### Why Flutter Uses Dart

> 💡 **Good Question!** Why not JavaScript, Python, or another popular language?

**Reasons:**
1. **Hot Reload**: Dart's architecture makes hot reload possible
2. **Performance**: Compiles to native code (ARM, x64)
3. **Single Language**: Same code runs on all platforms
4. **Productivity**: Combines best of static and dynamic languages

### Try Dart Online

> 🌐 **No Installation Needed!** You can try Dart right in your browser.

**Step 1: Open DartPad**
1. Visit [DartPad](https://dartpad.dev/)
2. You should see a code editor with a "Run" button

**Step 2: Try Your First Dart Code**

Clear everything and type:

```dart
void main() {
  print('Hello, Dart!');
  print('I am learning Flutter!');
}
```

**Step 3: Click "Run"**

**✅ Expected Output:**
```
Hello, Dart!
I am learning Flutter!
```

> 📚 **What you just did:**
> - `void main()` - Every Dart program starts here (like Flutter apps!)
> - `print()` - Displays text in the console (useful for debugging)
> - `;` - Every statement ends with a semicolon

---

## 2. Variables and Data Types

> 🎓 **Basic Knowledge**: Variables are like labeled boxes where you store information. Data types tell Dart what kind of information is in each box.

### Step-by-Step: Your First Variables

**Step 1: Understanding Variable Declaration**

> 💡 **Try This in DartPad!** Type and run each example:

```dart
void main() {
  // Type 'var' and let Dart figure out the type
  var name = 'John';
  var age = 25;
  
  print('Hello, $name!');        // Hello, John!
  print('You are $age years old'); // You are 25 years old
}
```

**✅ Expected Output:**
```
Hello, John!
You are 25 years old
```

> 📚 **What's Happening:**
> - `var` tells Dart "figure out the type automatically"
> - `$name` puts the value of `name` into the string (string interpolation)
> - Dart is smart - it knows `name` is a String and `age` is an int

**Step 2: Explicit Types (Being Specific)**

```dart
void main() {
  // Tell Dart exactly what type each variable is
  String city = 'Bangkok';
  int year = 2025;
  double price = 99.99;
  bool isActive = true;
  
  print('City: $city');
  print('Year: $year');
  print('Price: \$${price}');  // \$ escapes the dollar sign
  print('Active: $isActive');
}
```

**✅ Expected Output:**
```
City: Bangkok
Year: 2025
Price: $99.99
Active: true
```

> 💡 **When to use explicit types:**
> - When you want to be clear about what type a variable should be
> - When the type isn't obvious from the value
> - In function parameters (we'll learn this soon!)

### Basic Data Types Explained

> 📚 **The Building Blocks:** Dart has several basic data types. Let's learn them one by one!

#### Numbers (int and double)

```dart
void main() {
  // int - whole numbers
  int count = 42;
  int negative = -10;
  int zero = 0;
  
  // double - decimal numbers
  double temperature = 36.5;
  double price = 99.99;
  double pi = 3.14159;
  
  // num - can be int OR double
  num value1 = 100;      // int
  num value2 = 100.5;    // double
  
  print('Count: $count');
  print('Temperature: $temperature°C');
  print('Price: \$$price');
}
```

**🔧 Try This:** Change the values and run again!

> 💡 **When to use each:**
> - `int` - counting things, ages, scores
> - `double` - money, measurements, scientific calculations
> - `num` - when it could be either (rare)

#### Strings (Text)

```dart
void main() {
  // Different ways to create strings
  String greeting = 'Hello';           // Single quotes
  String message = "Welcome to Dart";  // Double quotes
  
  // Multi-line strings
  String multiline = '''
This is a
multi-line
string!
  ''';
  
  // String interpolation (putting values in strings)
  String name = 'Alice';
  int age = 25;
  String intro = 'My name is $name and I am $age years old';
  
  // Expression interpolation
  String calculation = 'Next year I will be ${age + 1} years old';
  
  print(intro);
  print(calculation);
}
```

**✅ Expected Output:**
```
My name is Alice and I am 25 years old
Next year I will be 26 years old
```

> 💡 **String Tips:**
> - Use `$variable` for simple values
> - Use `${expression}` for calculations or complex values
> - Both `'` and `"` work the same - pick one and be consistent

#### Booleans (True or False)

```dart
void main() {
  // bool - only two values: true or false
  bool isLoggedIn = true;
  bool hasPermission = false;
  bool isAdult = false;
  
  // Useful for conditions
  if (isLoggedIn) {
    print('Welcome back!');
  } else {
    print('Please log in');
  }
}
```

**✅ Expected Output:**
```
Welcome back!
```

> 💡 **Why booleans matter in Flutter:**
> - Show/hide widgets
> - Enable/disable buttons
> - Check states (loading, error, success)

#### Lists (Arrays of Items)

```dart
void main() {
  // List - ordered collection of items
  List<int> numbers = [1, 2, 3, 4, 5];
  var fruits = ['Apple', 'Banana', 'Orange'];  // Type inferred
  
  // Access items by index (starts at 0!)
  print('First fruit: ${fruits[0]}');      // Apple
  print('Second fruit: ${fruits[1]}');     // Banana
  
  // List properties
  print('Total fruits: ${fruits.length}'); // 3
  
  // Add items
  fruits.add('Mango');
  print('Now we have: $fruits');
  
  // Loop through lists
  for (var fruit in fruits) {
    print('I like $fruit');
  }
}
```

**✅ Expected Output:**
```
First fruit: Apple
Second fruit: Banana
Total fruits: 3
Now we have: [Apple, Banana, Orange, Mango]
I like Apple
I like Banana
I like Orange
I like Mango
```

> 💡 **Lists in Flutter:** Used everywhere!
> - List of menu items
> - List of products
> - List of chat messages
> - List of photos

#### Maps (Key-Value Pairs)

```dart
void main() {
  // Map - like a dictionary (key → value)
  Map<String, dynamic> user = {
    'name': 'John',
    'age': 25,
    'email': 'john@example.com',
    'isActive': true,
  };
  
  // Access values by key
  print('Name: ${user['name']}');
  print('Age: ${user['age']}');
  
  // Add new key-value pairs
  user['phone'] = '123-456-7890';
  
  // Check if key exists
  if (user.containsKey('email')) {
    print('Email: ${user['email']}');
  }
  
  print('All user data: $user');
}
```

**✅ Expected Output:**
```
Name: John
Age: 25
Email: john@example.com
All user data: {name: John, age: 25, email: john@example.com, isActive: true, phone: 123-456-7890}
```

> 💡 **Maps in Flutter:** Perfect for:
> - User profiles
> - API responses (JSON data)
> - Configuration settings
> - Form data

### Understanding final vs const

> 🎓 **Important Concept**: Sometimes you want a variable that never changes.

```dart
void main() {
  // final - value set at runtime, can't change later
  final currentTime = DateTime.now();  // Gets current time when program runs
  // currentTime = DateTime.now();  // ❌ Error! Can't change final variable
  
  // const - value set at compile time, never changes
  const pi = 3.14159;  // Always the same value
  const appName = 'My Flutter App';
  // pi = 3.14;  // ❌ Error! Can't change const variable
  
  print('Current time: $currentTime');
  print('Pi: $pi');
  print('App name: $appName');
}
```

> 💡 **When to use:**
> - `final` - value is set once when program runs (current date, user input, API response)
> - `const` - value never changes, known before program runs (pi, app name, colors)
> - `var` - value can change anytime

### Null Safety (Preventing Errors)

> 🎓 **Game Changer**: Dart's null safety prevents the "billion dollar mistake" - null reference errors!

```dart
void main() {
  // Non-nullable (default) - MUST have a value
  String name = 'John';  // Cannot be null
  // String name2;  // ❌ Error! Must initialize
  
  // Nullable (with ?) - CAN be null
  String? middleName;  // OK to be null
  int? age;            // OK to be null
  
  print('Name: $name');
  print('Middle name: $middleName');  // Prints: null
  
  // Safe handling of nulls
  String? nickname;
  
  // Option 1: If-null operator (??)
  print('Nickname: ${nickname ?? 'No nickname'}');  // Prints: No nickname
  
  // Option 2: Null-aware access (?.)
  String? email;
  print('Email length: ${email?.length}');  // Prints: null (doesn't crash!)
  
  // Option 3: Assert non-null (!)
  String? confirmedEmail = 'user@example.com';
  print('Email: ${confirmedEmail!.toUpperCase()}');  // USER@EXAMPLE.COM
  // Only use ! if you're 100% sure it's not null!
}
```

**✅ Expected Output:**
```
Name: John
Middle name: null
Nickname: No nickname
Email length: null
Email: USER@EXAMPLE.COM
```

> 💡 **Null Safety Rules:**
> - Variables without `?` MUST have a value
> - Variables with `?` CAN be null
> - Use `??` to provide default values
> - Use `?.` to safely access nullable values
> - Use `!` only when absolutely sure (rare!)

**🔧 Practice Exercise:**

Try this in DartPad:

```dart
void main() {
  // TODO: Create variables for a person
  var firstName = 'Your Name';
  var age = 0;  // Your age
  double? height;  // Optional, can be null
  var hobbies = ['hobby1', 'hobby2'];
  
  // TODO: Print a nice introduction
  print('Hi! I am $firstName, $age years old.');
  print('My height: ${height ?? 'not specified'}');
  print('My hobbies: $hobbies');
}
```

**Replace the values and run it!**

---

## 3. Operators (Doing Math and Comparisons)

> 🎓 **Basic Knowledge**: Operators are symbols that perform operations on values. Think of them as the "verbs" of programming.

### Arithmetic Operators (Math!)

> 💡 **Try This in DartPad:**

```dart
void main() {
  int a = 10;
  int b = 3;
  
  print('a + b = ${a + b}');   // 13 - addition
  print('a - b = ${a - b}');   // 7  - subtraction
  print('a * b = ${a * b}');   // 30 - multiplication
  print('a / b = ${a / b}');   // 3.333... - division (returns double)
  print('a ~/ b = ${a ~/ b}'); // 3  - integer division (whole number)
  print('a % b = ${a % b}');   // 1  - modulo (remainder)
}
```

**✅ Expected Output:**
```
a + b = 13
a - b = 7
a * b = 30
a / b = 3.3333333333333335
a ~/ b = 3
a % b = 1
```

> 💡 **Real-world uses in Flutter:**
> - Calculate prices (`price * quantity`)
> - Determine grid layouts (`items ~/ columns`)
> - Check if number is even/odd (`number % 2 == 0`)
> - Split screen (`width / 2`)

**🔧 Practice:** Create a simple calculator!

```dart
void main() {
  double num1 = 15.5;
  double num2 = 4.2;
  
  print('Sum: ${num1 + num2}');
  print('Difference: ${num1 - num2}');
  print('Product: ${num1 * num2}');
  print('Quotient: ${num1 / num2}');
}
```

### Comparison Operators (Comparing Values)

> 💡 **Try This:**

```dart
void main() {
  int x = 5;
  int y = 10;
  
  print('x == y: ${x == y}');  // false - equal to
  print('x != y: ${x != y}');  // true  - not equal to
  print('x > y: ${x > y}');    // false - greater than
  print('x < y: ${x < y}');    // true  - less than
  print('x >= y: ${x >= y}');  // false - greater than or equal
  print('x <= y: ${x <= y}');  // true  - less than or equal
}
```

**✅ Expected Output:**
```
x == y: false
x != y: true
x > y: false
x < y: true
x >= y: false
x <= y: true
```

> 💡 **Used in Flutter for:**
> - Form validation (`age >= 18`)
> - Conditional rendering (`isLoggedIn == true`)
> - Sorting lists (`item1.price < item2.price`)
> - Navigation logic (`currentPage != lastPage`)

### Logical Operators (Combining Conditions)

> 💡 **Try This:**

```dart
void main() {
  bool isLoggedIn = true;
  bool hasPermission = false;
  int age = 20;
  
  // AND (&&) - both must be true
  print('Can access: ${isLoggedIn && hasPermission}');  // false
  
  // OR (||) - at least one must be true
  print('Show content: ${isLoggedIn || hasPermission}'); // true
  
  // NOT (!) - opposite value
  print('Is guest: ${!isLoggedIn}');  // false
  
  // Combining multiple conditions
  bool isAdult = age >= 18;
  bool canEnter = isLoggedIn && isAdult;
  print('Can enter: $canEnter');  // true
}
```

**✅ Expected Output:**
```
Can access: false
Show content: true
Is guest: false
Can enter: true
```

> 💡 **Real Flutter scenarios:**
> - `if (isLoggedIn && hasData)` - show user dashboard
> - `if (isLoading || hasError)` - show loading/error screen
> - `if (!isComplete)` - show continue button

---

## 4. Control Flow (Making Decisions)

> 🎓 **Basic Knowledge**: Control flow determines which code runs based on conditions. It's like giving your program the ability to make decisions!

### If-Else Statements (The Decision Maker)

> 💡 **Try This Example:**

```dart
void main() {
  int score = 85;
  
  if (score >= 90) {
    print('Grade: A - Excellent!');
  } else if (score >= 80) {
    print('Grade: B - Great job!');
  } else if (score >= 70) {
    print('Grade: C - Good');
  } else if (score >= 60) {
    print('Grade: D - You can do better');
  } else {
    print('Grade: F - Need improvement');
  }
  
  // Ternary operator (short if-else)
  String result = score >= 50 ? 'Pass ✓' : 'Fail ✗';
  print('Result: $result');
}
```

**✅ Expected Output:**
```
Grade: B - Great job!
Result: Pass ✓
```

> 📚 **How it works:**
> 1. Check first condition (`score >= 90`) - false, skip
> 2. Check second condition (`score >= 80`) - true! Execute and stop
> 3. Remaining conditions are not checked

**🔧 Practice:** Age checker

```dart
void main() {
  int age = 25;
  
  if (age < 13) {
    print('You are a child');
  } else if (age < 20) {
    print('You are a teenager');
  } else if (age < 60) {
    print('You are an adult');
  } else {
    print('You are a senior');
  }
}
```

### Switch Statements (Multiple Specific Cases)

> 💡 **When to use**: When you have many specific values to check.

```dart
void main() {
  String grade = 'B';
  
  switch (grade) {
    case 'A':
      print('Excellent! 🌟');
      break;
    case 'B':
      print('Good! 👍');
      break;
    case 'C':
      print('Fair 👌');
      break;
    case 'D':
      print('Below average 😐');
      break;
    default:
      print('Need improvement 📚');
  }
}
```

**✅ Expected Output:**
```
Good! 👍
```

> 💡 **Flutter use cases:**
> - Handle different button types
> - Process different menu selections
> - Handle various API response codes

**🔧 Real-world example:**

```dart
void main() {
  String day = 'Monday';
  
  switch (day) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('It\'s a weekday - time to work! 💼');
      break;
    case 'Saturday':
    case 'Sunday':
      print('It\'s the weekend - time to relax! 🎉');
      break;
    default:
      print('Invalid day');
  }
}
```

### Loops (Repeating Actions)

> 🎓 **Basic Knowledge**: Loops let you repeat code multiple times without writing it over and over.

#### For Loop (Count-Based Repetition)

```dart
void main() {
  // Basic for loop - repeat 5 times
  print('Counting:');
  for (int i = 0; i < 5; i++) {
    print('Count: $i');
  }
  
  print('\nCountdown:');
  // Counting backwards
  for (int i = 5; i > 0; i--) {
    print('$i...');
  }
  print('Blast off! 🚀');
}
```

**✅ Expected Output:**
```
Counting:
Count: 0
Count: 1
Count: 2
Count: 3
Count: 4

Countdown:
5...
4...
3...
2...
1...
Blast off! 🚀
```

> 📚 **Understanding the loop:**
> - `int i = 0` - start at 0
> - `i < 5` - continue while i is less than 5
> - `i++` - increase i by 1 after each iteration

#### For-In Loop (Loop Through Collections)

```dart
void main() {
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  
  print('I have these fruits:');
  for (var fruit in fruits) {
    print('- $fruit');
  }
  
  // With index
  print('\nNumbered list:');
  for (int i = 0; i < fruits.length; i++) {
    print('${i + 1}. ${fruits[i]}');
  }
}
```

**✅ Expected Output:**
```
I have these fruits:
- Apple
- Banana
- Orange
- Mango

Numbered list:
1. Apple
2. Banana
3. Orange
4. Mango
```

> 💡 **Flutter use:**
> - Creating list widgets from data
> - Processing form fields
> - Building menu items

#### While Loop (Condition-Based Repetition)

```dart
void main() {
  // While loop - continues while condition is true
  int count = 0;
  while (count < 5) {
    print('Count: $count');
    count++;
  }
  
  print('\nUsing do-while:');
  // Do-While loop - runs at least once
  int number = 0;
  do {
    print('Number: $number');
    number++;
  } while (number < 3);
}
```

**✅ Expected Output:**
```
Count: 0
Count: 1
Count: 2
Count: 3
Count: 4

Using do-while:
Number: 0
Number: 1
Number: 2
```

> 💡 **When to use each:**
> - `for` - know exactly how many times to repeat
> - `for-in` - loop through a collection
> - `while` - repeat until a condition changes
> - `do-while` - must run at least once

#### forEach Method (Functional Approach)

```dart
void main() {
  List<String> tasks = ['Study', 'Code', 'Exercise', 'Sleep'];
  
  // forEach with function
  tasks.forEach((task) {
    print('✓ $task');
  });
  
  // More examples
  List<int> numbers = [1, 2, 3, 4, 5];
  
  // Calculate sum
  int sum = 0;
  numbers.forEach((num) {
    sum += num;
  });
  print('\nSum: $sum');
}
```

**✅ Expected Output:**
```
✓ Study
✓ Code
✓ Exercise
✓ Sleep

Sum: 15
```

---

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

## 5. Functions (Reusable Code Blocks)

> 🎓 **Basic Knowledge**: Functions are like recipes - you write the instructions once, then use them many times. They help organize code and avoid repetition!

### Why Functions Matter in Flutter

> 💡 **Every widget has a `build()` function!** Understanding functions is crucial for Flutter.

**Benefits:**
- ✅ Reuse code (DRY - Don't Repeat Yourself)
- ✅ Organize complex logic
- ✅ Easier testing and debugging
- ✅ Make code readable

### Basic Functions (Step by Step)

**Step 1: Simple Function (No Parameters, No Return)**

```dart
void main() {
  // Call the function
  greet();
  greet();  // Can call multiple times!
}

// Define the function
void greet() {
  print('Hello from a function!');
  print('Functions are awesome!');
}
```

**✅ Expected Output:**
```
Hello from a function!
Functions are awesome!
Hello from a function!
Functions are awesome!
```

> 📚 **Understanding:**
> - `void` = returns nothing
> - `greet` = function name
> - `()` = no parameters
> - `{}` = function body (what it does)

**Step 2: Function with Return Value**

```dart
void main() {
  String message = getMessage();
  print(message);
  
  // Can use directly
  print(getMessage());
}

String getMessage() {
  return 'Welcome to Dart!';
}
```

**✅ Expected Output:**
```
Welcome to Dart!
Welcome to Dart!
```

> 💡 **Key Point**: `return` sends a value back to whoever called the function!

**Step 3: Function with Parameters**

```dart
void main() {
  int result1 = add(5, 3);
  int result2 = add(10, 20);
  
  print('5 + 3 = $result1');
  print('10 + 20 = $result2');
  
  // Can use in expressions
  print('Total: ${add(result1, result2)}');
}

int add(int a, int b) {
  return a + b;
}
```

**✅ Expected Output:**
```
5 + 3 = 8
10 + 20 = 30
Total: 38
```

> 📚 **Understanding parameters:**
> - `int a, int b` = function expects two integers
> - `a` and `b` = variable names used inside function
> - Values passed when calling are called "arguments"

**Step 4: Arrow Functions (Shorthand)**

```dart
void main() {
  print('Multiply: ${multiply(4, 7)}');
  print('Square: ${square(5)}');
  print('Is even: ${isEven(6)}');
}

// Arrow function - single expression
int multiply(int a, int b) => a * b;

// Works for any single-line return
int square(int n) => n * n;

bool isEven(int n) => n % 2 == 0;
```

**✅ Expected Output:**
```
Multiply: 28
Square: 25
Is even: true
```

> 💡 **Use arrow functions when:**
> - Function has only ONE expression
> - Makes code cleaner and shorter
> - Common in Flutter widgets!

### Optional Parameters (Flexible Functions)

> 🎓 **Concept**: Sometimes you want parameters to be optional!

**Optional Positional Parameters [ ]**

```dart
void main() {
  print(greet('John'));
  print(greet('John', 'Mr.'));
  print(greet('Sarah', 'Dr.'));
}

String greet(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  }
  return 'Hello, $name';
}
```

**✅ Expected Output:**
```
Hello, John
Hello, Mr. John
Hello, Dr. Sarah
```

> 📚 **Square brackets [ ]** = optional positional parameters

**Optional Named Parameters { }**

```dart
void main() {
  printUser(name: 'John', age: 25);
  printUser(name: 'Jane');  // age is optional
  printUser(age: 30, name: 'Bob');  // order doesn't matter!
}

void printUser({String? name, int? age}) {
  print('Name: ${name ?? 'Unknown'}');
  print('Age: ${age ?? 'Not specified'}');
  print('---');
}
```

**✅ Expected Output:**
```
Name: John
Age: 25
---
Name: Jane
Age: Not specified
---
Name: Bob
Age: 30
---
```

> 💡 **Curly braces { }** = named parameters
> - Call using `paramName: value`
> - Order doesn't matter
> - Very common in Flutter widgets!

**Required Named Parameters**

```dart
void main() {
  createUser(name: 'John', age: 25);
  // createUser(name: 'Jane');  // ❌ Error! age is required
}

void createUser({required String name, required int age}) {
  print('Created user: $name, age $age');
}
```

> 💡 **Use `required`** for named parameters that MUST be provided

**Default Parameter Values**

```dart
void main() {
  print(greetPerson('John'));
  print(greetPerson('Jane', 'Hi'));
  print(greetPerson('Bob', 'Hey'));
}

String greetPerson(String name, [String greeting = 'Hello']) {
  return '$greeting, $name!';
}
```

**✅ Expected Output:**
```
Hello, John!
Hi, Jane!
Hey, Bob!
```

> 💡 **Default values** are used when parameter is not provided

### Real-World Function Example

```dart
void main() {
  // Calculate discount price
  double finalPrice1 = calculatePrice(100, discount: 10);
  double finalPrice2 = calculatePrice(200, discount: 25, tax: 7);
  
  print('Price 1: \$${finalPrice1.toStringAsFixed(2)}');
  print('Price 2: \$${finalPrice2.toStringAsFixed(2)}');
}

double calculatePrice(
  double basePrice, {
  double discount = 0,
  double tax = 0,
}) {
  double afterDiscount = basePrice * (1 - discount / 100);
  double withTax = afterDiscount * (1 + tax / 100);
  return withTax;
}
```

**✅ Expected Output:**
```
Price 1: $90.00
Price 2: $160.50
```

> 💡 **This is how you'll write functions in Flutter!**

### Anonymous Functions (Functions Without Names)

> 🎓 **Used extensively in Flutter!** Especially in callbacks.

```dart
void main() {
  var numbers = [1, 2, 3, 4, 5];
  
  // Anonymous function
  numbers.forEach((number) {
    print('Number: $number');
  });
  
  // Arrow function (short anonymous)
  numbers.forEach((n) => print('Value: $n'));
  
  // Filter even numbers
  var evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evenNumbers');
}
```

**✅ Expected Output:**
```
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
Value: 1
Value: 2
Value: 3
Value: 4
Value: 5
Even numbers: [2, 4]
```

> 💡 **In Flutter you'll use these for:**
> - Button press handlers: `onPressed: () { ... }`
> - List building: `.map((item) => Widget())`
> - Filtering data: `.where((item) => condition)`

---

## 6. Object-Oriented Programming (OOP)

> 🎓 **Most Important Concept!** Everything in Flutter is an object. Widgets are objects. Apps are objects!

### What is OOP?

**Think of it like this:**
- **Class** = Blueprint (recipe for making a car)
- **Object** = Actual thing (the car you built from that blueprint)
- **Properties** = Characteristics (color, model, year)
- **Methods** = Actions (drive, brake, honk)

> 💡 **In Flutter:**
> - `Text` is a class
> - `Text('Hello')` creates an object
> - `'Hello'` is a property
> - `.build()` is a method

### Classes and Objects (Step by Step)

**Step 1: Create Your First Class**

```dart
void main() {
  // Create objects (instances of the class)
  Person person1 = Person('John', 25);
  Person person2 = Person('Jane', 30);
  
  // Use the objects
  person1.introduce();
  person2.introduce();
}

// Define a class (blueprint)
class Person {
  // Properties (characteristics)
  String name;
  int age;
  
  // Constructor (how to create a Person)
  Person(this.name, this.age);
  
  // Method (what a Person can do)
  void introduce() {
    print('Hi! I am $name and I am $age years old.');
  }
}
```

**✅ Expected Output:**
```
Hi! I am John and I am 25 years old.
Hi! I am Jane and I am 30 years old.
```

> 📚 **Understanding the parts:**
> - `class Person` = define a new type called Person
> - `String name, int age` = every Person has these properties
> - `Person(this.name, this.age)` = constructor (easy way to create Persons)
> - `void introduce()` = method (something a Person can do)

**Step 2: More Constructor Types**

```dart
void main() {
  // Different ways to create users
  User user1 = User('John', 25, 'john@email.com');
  User user2 = User.guest();
  User user3 = User.fromJson({
    'name': 'Jane',
    'age': 30,
    'email': 'jane@email.com'
  });
  
  user1.display();
  user2.display();
  user3.display();
}

class User {
  String name;
  int age;
  String? email;
  
  // Default constructor
  User(this.name, this.age, [this.email]);
  
  // Named constructor - for guest users
  User.guest()
      : name = 'Guest',
        age = 0,
        email = null;
  
  // Named constructor - from JSON data
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        email = json['email'];
  
  void display() {
    print('User: $name, Age: $age, Email: ${email ?? 'none'}');
  }
}
```

**✅ Expected Output:**
```
User: John, Age: 25, Email: john@email.com
User: Guest, Age: 0, Email: none
User: Jane, Age: 30, Email: jane@email.com
```

> 💡 **Named constructors** like `User.fromJson()` are very common in Flutter!

**Step 3: Getters and Setters**

```dart
void main() {
  Rectangle rect = Rectangle(5, 10);
  
  print('Width: ${rect.width}');
  print('Height: ${rect.height}');
  print('Area: ${rect.area}');  // Getter - calculated on demand!
  print('Perimeter: ${rect.perimeter}');
  
  // Update dimensions
  rect.dimensions = [7, 14];
  print('\nAfter update:');
  print('New area: ${rect.area}');
}

class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  // Getter - like a property but calculated
  double get area => width * height;
  
  double get perimeter => 2 * (width + height);
  
  // Setter - special method to set values
  set dimensions(List<double> values) {
    width = values[0];
    height = values[1];
  }
}
```

**✅ Expected Output:**
```
Width: 5.0
Height: 10.0
Area: 50.0
Perimeter: 30.0

After update:
New area: 98.0
```

> 💡 **Getters in Flutter:**
> - Access like properties but can include logic
> - Example: `widget.child` might be a getter

**Step 4: Inheritance (Sharing Behavior)**

```dart
void main() {
  Dog dog = Dog('Buddy', 'Golden Retriever');
  Cat cat = Cat('Whiskers', 'Tabby');
  
  dog.makeSound();
  dog.fetch();
  
  cat.makeSound();
  cat.scratch();
}

// Base class (parent)
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('$name makes a sound');
  }
}

// Derived class (child) - inherits from Animal
class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  @override  // Override parent method
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }
  
  void fetch() {
    print('$name fetches the ball!');
  }
}

class Cat extends Animal {
  String color;
  
  Cat(String name, this.color) : super(name);
  
  @override
  void makeSound() {
    print('$name meows: Meow!');
  }
  
  void scratch() {
    print('$name scratches the furniture!');
  }
}
```

**✅ Expected Output:**
```
Buddy barks: Woof! Woof!
Buddy fetches the ball!
Whiskers meows: Meow!
Whiskers scratches the furniture!
```

> 💡 **Inheritance in Flutter:**
> - All widgets inherit from `Widget`
> - `StatelessWidget` and `StatefulWidget` are specialized types
> - You extend them to create your own widgets!

### Real-World Flutter-Style Example

```dart
void main() {
  Product phone = Product('iPhone 15', 999.99);
  Product laptop = Product('MacBook Pro', 1999.99);
  
  ShoppingCart cart = ShoppingCart();
  cart.addItem(phone, 1);
  cart.addItem(laptop, 1);
  cart.displayCart();
}

class Product {
  final String name;
  final double price;
  
  Product(this.name, this.price);
  
  @override
  String toString() => '$name (\$${price.toStringAsFixed(2)})';
}

class ShoppingCart {
  List<Product> items = [];
  List<int> quantities = [];
  
  void addItem(Product product, int quantity) {
    items.add(product);
    quantities.add(quantity);
    print('Added ${product.name} (x$quantity) to cart');
  }
  
  double get total {
    double sum = 0;
    for (int i = 0; i < items.length; i++) {
      sum += items[i].price * quantities[i];
    }
    return sum;
  }
  
  void displayCart() {
    print('\n=== Shopping Cart ===');
    for (int i = 0; i < items.length; i++) {
      print('${items[i].name} x${quantities[i]} = \$${(items[i].price * quantities[i]).toStringAsFixed(2)}');
    }
    print('---');
    print('Total: \$${total.toStringAsFixed(2)}');
    print('===================');
  }
}
```

**✅ Expected Output:**
```
Added iPhone 15 (x1) to cart
Added MacBook Pro (x1) to cart

=== Shopping Cart ===
iPhone 15 x1 = $999.99
MacBook Pro x1 = $1999.99
---
Total: $2999.98
===================
```

> 🎉 **This is how you'll structure Flutter apps!**
> - Classes for data models
> - Methods for business logic
> - Getters for computed properties

---

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

## 💻 Hands-on Exercises

> 🎯 **Time to practice!** Try these exercises in DartPad to reinforce what you've learned.

### Exercise 1: Personal Information Card 👤

**Goal**: Practice variables, string interpolation, and printing.

```dart
void main() {
  // TODO: Create variables for:
  // - Your first name (String)
  // - Your age (int)
  // - Your city (String)
  // - Are you a student? (bool)
  // - Your hobbies (List<String>)
  
  // Example solution (replace with your info):
  var firstName = 'Alex';
  var age = 25;
  var city = 'Bangkok';
  bool isStudent = true;
  var hobbies = ['Coding', 'Reading', 'Gaming'];
  
  // TODO: Print a nice formatted card
  print('=== Personal Card ===');
  print('Name: $firstName');
  print('Age: $age');
  print('City: $city');
  print('Student: ${isStudent ? 'Yes' : 'No'}');
  print('Hobbies: ${hobbies.join(', ')}');
  print('====================');
}
```

**Expected Output:**
```
=== Personal Card ===
Name: Alex
Age: 25
City: Bangkok
Student: Yes
Hobbies: Coding, Reading, Gaming
====================
```

---

### Exercise 2: BMI Calculator 🏃

**Goal**: Practice functions, parameters, and calculations.

```dart
void main() {
  // Test your function
  double bmi1 = calculateBMI(70, 1.75);
  double bmi2 = calculateBMI(65, 1.68);
  
  print('BMI 1: ${bmi1.toStringAsFixed(1)}');
  print('BMI 2: ${bmi2.toStringAsFixed(1)}');
  
  // Bonus: Interpret the BMI
  print(interpretBMI(bmi1));
}

// TODO: Create a function that calculates BMI
// Formula: BMI = weight(kg) / (height(m) * height(m))
double calculateBMI(double weight, double height) {
  return weight / (height * height);
}

// BONUS: Interpret BMI value
String interpretBMI(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 25) {
    return 'Normal weight';
  } else if (bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}
```

**Expected Output:**
```
BMI 1: 22.9
BMI 2: 23.0
Normal weight
```

---

### Exercise 3: Product Class 🛍️

**Goal**: Practice creating classes, constructors, and methods.

```dart
void main() {
  // Create some products
  Product laptop = Product('Laptop', 999.99, 2);
  Product mouse = Product('Mouse', 29.99, 5);
  Product keyboard = Product('Keyboard', 79.99, 3);
  
  // Display product info
  laptop.displayInfo();
  mouse.displayInfo();
  keyboard.displayInfo();
  
  // Calculate total inventory value
  double total = laptop.getTotalPrice() + 
                 mouse.getTotalPrice() + 
                 keyboard.getTotalPrice();
  print('\nTotal inventory value: \$${total.toStringAsFixed(2)}');
}

// TODO: Create a Product class with:
// - Properties: name, price, quantity
// - Constructor
// - Method: getTotalPrice() - returns price * quantity
// - Method: displayInfo() - prints product information

class Product {
  String name;
  double price;
  int quantity;
  
  // Constructor
  Product(this.name, this.price, this.quantity);
  
  // Calculate total price
  double getTotalPrice() {
    return price * quantity;
  }
  
  // Display product information
  void displayInfo() {
    print('Product: $name');
    print('  Price: \$${price.toStringAsFixed(2)} each');
    print('  Quantity: $quantity');
    print('  Total: \$${getTotalPrice().toStringAsFixed(2)}');
  }
}
```

**Expected Output:**
```
Product: Laptop
  Price: $999.99 each
  Quantity: 2
  Total: $1999.98
Product: Mouse
  Price: $29.99 each
  Quantity: 5
  Total: $149.95
Product: Keyboard
  Price: $79.99 each
  Quantity: 3
  Total: $239.97

Total inventory value: $2389.90
```

---

### Exercise 4: Number Operations 🔢

**Goal**: Practice lists, loops, and filtering.

```dart
void main() {
  // Create a list of numbers
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // TODO: Filter even numbers
  List<int> evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  
  // TODO: Calculate sum of even numbers
  int sum = 0;
  for (var num in evenNumbers) {
    sum += num;
  }
  
  // TODO: Find the maximum number
  int max = numbers.reduce((a, b) => a > b ? a : b);
  
  // Print results
  print('All numbers: $numbers');
  print('Even numbers: $evenNumbers');
  print('Sum of even numbers: $sum');
  print('Maximum number: $max');
  print('Average: ${sum / evenNumbers.length}');
}
```

**Expected Output:**
```
All numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Even numbers: [2, 4, 6, 8, 10]
Sum of even numbers: 30
Maximum number: 10
Average: 6.0
```

---

### Challenge Exercise: Bank Account 💰

**Goal**: Combine everything you've learned!

```dart
void main() {
  BankAccount account = BankAccount('John Doe', 1000);
  
  account.displayBalance();
  account.deposit(500);
  account.withdraw(200);
  account.withdraw(2000);  // Should fail - insufficient funds
  account.displayBalance();
  account.displayHistory();
}

class BankAccount {
  String ownerName;
  double balance;
  List<String> transactionHistory = [];
  
  BankAccount(this.ownerName, this.balance) {
    transactionHistory.add('Account created with \$${balance}');
  }
  
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactionHistory.add('Deposited: +\$${amount}');
      print('✅ Deposited \$${amount}. New balance: \$${balance}');
    } else {
      print('❌ Invalid deposit amount');
    }
  }
  
  void withdraw(double amount) {
    if (amount > balance) {
      print('❌ Insufficient funds! Balance: \$${balance}, Requested: \$${amount}');
    } else if (amount > 0) {
      balance -= amount;
      transactionHistory.add('Withdrew: -\$${amount}');
      print('✅ Withdrew \$${amount}. New balance: \$${balance}');
    } else {
      print('❌ Invalid withdrawal amount');
    }
  }
  
  void displayBalance() {
    print('\n💰 Account Balance for $ownerName: \$${balance.toStringAsFixed(2)}');
  }
  
  void displayHistory() {
    print('\n📜 Transaction History:');
    for (var transaction in transactionHistory) {
      print('  - $transaction');
    }
  }
}
```

**Expected Output:**
```
💰 Account Balance for John Doe: $1000.00
✅ Deposited $500.0. New balance: $1500.0
✅ Withdrew $200.0. New balance: $1300.0
❌ Insufficient funds! Balance: $1300.0, Requested: $2000.0

💰 Account Balance for John Doe: $1300.00

📜 Transaction History:
  - Account created with $1000.0
  - Deposited: +$500.0
  - Withdrew: -$200.0
```

---

## 🎉 Congratulations!

**You've completed Session 2!** Here's what you now know:

### ✅ What You Learned

**Basic Concepts:**
- ✅ What Dart is and why Flutter uses it
- ✅ How to use DartPad to practice
- ✅ Variables and data types (int, double, String, bool, List, Map)
- ✅ Null safety and how to handle nullable values
- ✅ String interpolation

**Control Flow:**
- ✅ Arithmetic, comparison, and logical operators
- ✅ If-else statements and ternary operators
- ✅ Switch statements
- ✅ For, while, and forEach loops

**Functions:**
- ✅ Creating and calling functions
- ✅ Parameters and return values
- ✅ Optional and named parameters
- ✅ Arrow functions
- ✅ Anonymous functions

**Object-Oriented Programming:**
- ✅ Classes and objects
- ✅ Constructors (default and named)
- ✅ Properties and methods
- ✅ Getters and setters
- ✅ Inheritance and method overriding

### 🎯 Why This Matters for Flutter

> 💡 **Everything you just learned is used in every Flutter app!**

- **Variables**: Store widget state
- **Functions**: Build methods, event handlers
- **Classes**: Every widget is a class
- **Lists/Maps**: Display dynamic data
- **Inheritance**: All custom widgets extend base widgets
- **Named parameters**: Flutter widgets use them extensively

---

## 📚 Additional Resources

**Official Documentation:**
- 📖 [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- 🎯 [Dart Cheatsheet](https://dart.dev/codelabs/dart-cheatsheet)
- 💻 [DartPad](https://dartpad.dev/) - Practice online

**Video Tutorials:**
- 🎥 [Dart Programming Tutorial](https://www.youtube.com/watch?v=Ej_Pcr4uC2Q)
- 🎥 [Dart in 100 Seconds](https://www.youtube.com/watch?v=NrO0CJCbYLA)

**Interactive Learning:**
- 🧪 [Dart Codelabs](https://dart.dev/codelabs)
- 📝 [Exercism - Dart Track](https://exercism.org/tracks/dart)

---

## 🆘 Quick Reference

### Common Data Types
```dart
int age = 25;
double price = 99.99;
String name = 'John';
bool isActive = true;
List<String> items = ['a', 'b', 'c'];
Map<String, int> scores = {'Alice': 95, 'Bob': 87};
```

### Function Syntax
```dart
// Basic function
ReturnType functionName(Type param) {
  return value;
}

// Arrow function
ReturnType functionName(Type param) => expression;

// Named parameters
void functionName({required Type param}) { }
```

### Class Syntax
```dart
class ClassName {
  Type property;
  
  ClassName(this.property);
  
  ReturnType method() {
    return value;
  }
  
  Type get getter => property;
}
```

---

## 🔜 Next Steps

**You're ready when:**
- ✅ You can create and use variables
- ✅ You understand functions and how to call them
- ✅ You can create simple classes
- ✅ You've completed at least 3 exercises
- ✅ You understand the difference between classes and objects

**Continue to:** [Session 3: Flutter Widgets & Layouts](../session3/README.md)

In Session 3, you'll use your Dart knowledge to build real Flutter UIs! 🎨

---

**[← Back to Day 1 Overview](../README.md)**
