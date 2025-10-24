# Day 1 Exercises

Complete these exercises to practice what you learned today.

---

## Exercise 1: Login Screen UI

### Objective
Create a login screen with a clean, modern design.

### Requirements
- [ ] App bar with title "Login"
- [ ] Logo or app icon at the top
- [ ] TextField for email/username
- [ ] TextField for password (obscured text)
- [ ] "Remember me" checkbox (optional)
- [ ] Login button (ElevatedButton)
- [ ] "Forgot Password?" link (TextButton)
- [ ] "Don't have an account? Sign up" link at bottom
- [ ] Proper padding and spacing
- [ ] Use Card or Container for better visual grouping

### Starter Code

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add your UI widgets here
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

---

## Exercise 2: Product List

### Objective
Create a product listing screen with cards showing product information.

### Requirements
- [ ] AppBar with title "Products"
- [ ] ListView with at least 5 products
- [ ] Each product card should show:
  - Product image (use Icon or Image.network)
  - Product name
  - Product description
  - Price
  - "Add to Cart" button
- [ ] Products should be stored in a List
- [ ] Use a separate widget for product card
- [ ] Add proper styling and colors

### Starter Code

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of products
    final products = <Product>[
      // Add products here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          // TODO: Return ProductCard widget
          return Container();
        },
      ),
    );
  }
}

// TODO: Create ProductCard widget
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: Build your product card UI
    return Card(
      child: Container(),
    );
  }
}
```

---

## Exercise 3: Calculator UI

### Objective
Create a calculator user interface (UI only, no functionality required).

### Requirements
- [ ] AppBar with title "Calculator"
- [ ] Display area for numbers/results
- [ ] Number buttons (0-9)
- [ ] Operation buttons (+, -, ×, ÷)
- [ ] Equal (=) button
- [ ] Clear (C) button
- [ ] Use GridView for button layout
- [ ] Proper button styling and colors
- [ ] Professional appearance

### Starter Code

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';

  void _onButtonPressed(String value) {
    setState(() {
      // TODO: Handle button press (optional for now)
      if (_display == '0') {
        _display = value;
      } else {
        _display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24),
              color: Colors.black87,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // TODO: Add buttons using GridView
          Expanded(
            flex: 5,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

// TODO: Create CalculatorButton widget
class CalculatorButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Build button
    return Container();
  }
}
```

---

## Bonus Exercise: Profile Card App

### Objective
Create a personal profile card with interactive elements.

### Requirements
- [ ] Profile picture (use CircleAvatar with Icon or Image)
- [ ] Name and title
- [ ] Short bio
- [ ] Contact information (email, phone)
- [ ] Social media icons (tap to show SnackBar)
- [ ] "Edit Profile" button
- [ ] Beautiful card design with shadows
- [ ] Responsive layout

### Challenge
Make the profile editable:
- Add an "Edit" button
- When pressed, show TextFields to edit name, bio, etc.
- Save changes and update the UI

---

## Tips for Success

1. **Start Simple**: Begin with basic structure, then add styling
2. **Use Hot Reload**: Test your changes immediately with hot reload
3. **Experiment**: Try different widgets and properties
4. **Read Documentation**: Check Flutter widget documentation when stuck
5. **Ask for Help**: Don't hesitate to ask questions

---

## Submission (Optional)

If this is part of a course:
1. Create a new Flutter project for each exercise
2. Take screenshots of your completed UI
3. Share your code repository or screenshots with the instructor

---

## Additional Practice

After completing these exercises, try:
- Combining multiple screens into one app
- Adding animations and transitions
- Making the UI responsive for different screen sizes
- Adding form validation
- Creating your own custom widgets

---

**Good luck! Happy coding! 🚀**

---

[← Back to Day 1](../README.md)
