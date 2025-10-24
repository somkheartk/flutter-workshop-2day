# Session 3: Flutter Widgets & Layouts

## 📖 Overview

Learn about Flutter widgets and how to create beautiful user interfaces.

---

## 🎯 Learning Objectives

After this session, you will be able to:
- Understand the widget tree concept
- Use common Flutter widgets
- Create layouts with Row, Column, and Stack
- Style widgets with custom properties

---

## 1. Widget Fundamentals

### Everything is a Widget

In Flutter, everything you see on screen is a widget:
- Text is a widget
- Button is a widget
- Layout is a widget
- Even the app itself is a widget!

### Widget Tree

```
MaterialApp
  └─ HomePage
      └─ Scaffold
          ├─ AppBar
          │   └─ Text
          └─ Body
              └─ Column
                  ├─ Text
                  ├─ Image
                  └─ ElevatedButton
```

### Stateless vs Stateful Widgets

**Stateless Widget**: Immutable, doesn't change over time

```dart
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('I never change');
  }
}
```

**Stateful Widget**: Can change and rebuild

```dart
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $_counter');
  }
}
```

---

## 2. Basic Widgets

### Text Widget

```dart
Text(
  'Hello, Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  ),
)
```

### Image Widget

```dart
// From network
Image.network('https://example.com/image.jpg')

// From assets (add to pubspec.yaml first)
Image.asset('assets/images/logo.png')

// With properties
Image.network(
  'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

### Icon Widget

```dart
Icon(
  Icons.favorite,
  color: Colors.red,
  size: 40,
)
```

### Container Widget

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Text('Container'),
)
```

### Button Widgets

```dart
// Elevated Button
ElevatedButton(
  onPressed: () {
    print('Button pressed');
  },
  child: Text('Click Me'),
)

// Text Button
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)

// Icon Button
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
)

// Outlined Button
OutlinedButton(
  onPressed: () {},
  child: Text('Outlined Button'),
)
```

### TextField Widget

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Enter your name',
    hintText: 'John Doe',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),
  ),
  onChanged: (value) {
    print('Text changed: $value');
  },
)
```

---

## 3. Layout Widgets

### Column (Vertical Layout)

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

### Row (Horizontal Layout)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Text('4.5'),
  ],
)
```

### Stack (Overlapping Layout)

```dart
Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),
    Positioned(
      top: 20,
      left: 20,
      child: Text('Overlaid Text'),
    ),
  ],
)
```

### ListView

```dart
// Simple ListView
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.map),
      title: Text('Map'),
    ),
    ListTile(
      leading: Icon(Icons.photo),
      title: Text('Album'),
    ),
    ListTile(
      leading: Icon(Icons.phone),
      title: Text('Phone'),
    ),
  ],
)

// ListView.builder (for large lists)
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item $index'),
    );
  },
)
```

### GridView

```dart
GridView.count(
  crossAxisCount: 2,
  children: List.generate(20, (index) {
    return Card(
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }),
)
```

### Expanded and Flexible

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(color: Colors.red, height: 100),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.blue, height: 100),
    ),
  ],
)
```

---

## 4. Padding and Alignment

### Padding

```dart
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text('Padded text'),
)

// Different padding
Padding(
  padding: EdgeInsets.only(
    left: 20,
    right: 20,
    top: 10,
    bottom: 10,
  ),
  child: Text('Custom padding'),
)
```

### Center

```dart
Center(
  child: Text('Centered text'),
)
```

### Align

```dart
Align(
  alignment: Alignment.topRight,
  child: Text('Top Right'),
)
```

---

## 5. Complete Example

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
      title: 'Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Card with image and text
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/400/200',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Beautiful Image',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'This is a sample description for the image.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.thumb_up),
                                label: const Text('Like'),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.share),
                                label: const Text('Share'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // List of items
              ...List.generate(5, (index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Description for item ${index + 1}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## 💻 Hands-on Exercise

### Exercise 1: Profile Card
Create a profile card with:
- Profile picture (use Icon or Image)
- Name (Text widget)
- Bio (Text widget)
- Social media buttons (Icon buttons)

### Exercise 2: Product List
Create a product list with ListView containing:
- Product image
- Product name
- Price
- Add to cart button

### Exercise 3: Grid Gallery
Create a photo gallery using GridView with:
- 2 or 3 columns
- Image cards
- On tap, show image title

---

## 📚 Resources

- [Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Layout Tutorial](https://docs.flutter.dev/development/ui/layout/tutorial)
- [Widget of the Week](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)

---

## ✅ Checklist

- [ ] Understand widget tree concept
- [ ] Can use basic widgets (Text, Image, Button)
- [ ] Can create layouts with Row and Column
- [ ] Can use ListView for lists
- [ ] Can style widgets
- [ ] Completed practice exercises

---

## 🔜 Next Steps

Continue to [Session 4: Building Your First App](../session4/README.md)

---

[← Back to Day 1](../README.md)
