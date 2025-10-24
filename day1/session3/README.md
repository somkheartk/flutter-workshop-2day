# Session 3: Flutter Widgets & Layouts

## 📖 Overview

Learn about Flutter widgets and how to create beautiful user interfaces through hands-on practice and progressive examples.

**Duration:** 2 hours  
**Difficulty:** Beginner to Intermediate

---

## 🎯 Learning Objectives

After this session, you will be able to:

### Core Concepts
- ✅ **Widget Tree**: Understand how widgets compose to build UIs
- ✅ **Stateless vs Stateful**: Know when to use each widget type
- ✅ **BuildContext**: Understand the context parameter

### Practical Skills
- 🎨 **Basic Widgets**: Use Text, Image, Icon, Button widgets effectively
- 📦 **Containers**: Style and position widgets with Container
- 📐 **Layouts**: Create complex layouts with Row, Column, Stack
- 📜 **Lists**: Display scrollable content with ListView
- 🎭 **Styling**: Apply colors, fonts, and decorations

### Output Goals
- 🎯 Build a profile card UI
- 🎯 Create a product list layout
- 🎯 Design a responsive form screen

---

## 🗺️ Session Flow

```
Part 1: Fundamentals (30 min)
├─ Widget tree concept
├─ Stateless vs Stateful
└─ Widget lifecycle
        ↓
Part 2: Basic Widgets (30 min)
├─ Text, Image, Icon
├─ Container, Padding
└─ Button widgets
        ↓
Part 3: Layout Widgets (40 min)
├─ Row and Column
├─ Stack and Positioned
└─ ListView and GridView
        ↓
Part 4: Styling (20 min)
├─ Colors and Themes
├─ TextStyle
└─ BoxDecoration
        ↓
Hands-on Lab (Remaining time)
└─ Build complete UI examples
```

---

## 📚 Learning Path

### Step-by-Step Approach

```
1. Read Concepts        (15 min)
   ↓
2. See Code Examples    (15 min)
   ↓
3. Run Examples         (10 min)
   ↓
4. Modify & Experiment  (30 min)
   ↓
5. Build From Scratch   (40 min)
   ↓
6. Review & Q&A         (10 min)
```

---

## 1. Widget Fundamentals

### 🧩 Everything is a Widget

**Core Concept:** In Flutter, EVERYTHING you see on screen is a widget.

```
Visual Elements = Widgets
├─ Text → Widget
├─ Button → Widget
├─ Image → Widget
├─ Container → Widget
├─ Layout → Widget
└─ Even the App → Widget!
```

**Think of widgets as:**
- 🧱 Building blocks of your UI
- 📦 Lego pieces that snap together
- 🎯 Composable and reusable components

### 📊 Widget Tree Visualization

**Concept:**
Widgets are arranged in a tree structure, where each widget can contain other widgets as children.

```
MaterialApp                          ← Root Widget
  └─ HomePage                        ← Screen Widget
      └─ Scaffold                    ← Structure Widget
          ├─ AppBar                  ← Header Widget
          │   ├─ Text                ← Title
          │   └─ IconButton          ← Actions
          └─ Body                    ← Main Content Area
              └─ Column              ← Layout Widget
                  ├─ Text            ← Leaf Widget
                  ├─ Image           ← Leaf Widget
                  └─ ElevatedButton  ← Leaf Widget
                      └─ Text        ← Button Label
```

**Real Example:**
```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(              // Root
      home: Scaffold(                // Structure
        appBar: AppBar(              // Header
          title: Text('Widget Tree'), // Title
        ),
        body: Column(                // Layout
          children: [
            Text('Hello'),           // Child 1
            Text('World'),           // Child 2
            ElevatedButton(          // Child 3
              child: Text('Click'),  // Button's child
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
```

### 🔄 Stateless vs Stateful Widgets

#### Understanding State

**State** = Data that can change over time and affect the UI

```
No State Changes → Stateless Widget
State Changes    → Stateful Widget
```

#### Stateless Widget

**When to use:**
- ✅ Static content that never changes
- ✅ Widgets that depend only on configuration (constructor parameters)
- ✅ Purely presentational widgets

**Structure:**
```dart
class MyStatelessWidget extends StatelessWidget {
  // 1. Constructor (optional)
  const MyStatelessWidget({super.key});

  // 2. Build method (required)
  @override
  Widget build(BuildContext context) {
    return Text('I never change');
  }
}
```

**Complete Example:**
```dart
class WelcomeScreen extends StatelessWidget {
  final String userName;
  
  const WelcomeScreen({
    super.key, 
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, $userName!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'This is a stateless widget.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage:
// WelcomeScreen(userName: 'John')
```

#### Stateful Widget

**When to use:**
- ✅ Content that changes over time
- ✅ User interactions (button clicks, form inputs)
- ✅ Animations or timers
- ✅ Data fetched from APIs

**Structure:**
```dart
// Part 1: Widget class (immutable)
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

// Part 2: State class (mutable)
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // 1. State variables
  int _counter = 0;

  // 2. Methods to modify state
  void _incrementCounter() {
    setState(() {           // ← IMPORTANT: Always use setState()
      _counter++;
    });
  }

  // 3. Build method
  @override
  Widget build(BuildContext context) {
    return Text('Counter: $_counter');
  }
}
```

**Complete Example:**
```dart
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: _counter < 0 ? Colors.red : Colors.blue,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### 🔄 Widget Lifecycle

**Stateless Widget Lifecycle:**
```
1. Constructor called
   ↓
2. build() method called
   ↓
3. Widget displayed
   ↓
4. (Widget removed from tree)
```

**Stateful Widget Lifecycle:**
```
1. Constructor called
   ↓
2. createState() called
   ↓
3. initState() called (once)
   ↓
4. didChangeDependencies() called
   ↓
5. build() method called
   ↓
6. setState() triggers rebuild
   ↓ (loops back to step 5)
7. dispose() called (cleanup)
```

**Lifecycle Methods Example:**
```dart
class LifecycleDemo extends StatefulWidget {
  @override
  State<LifecycleDemo> createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    print('1. initState called - Initialize data here');
    // Good for: Setting initial values, starting timers
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('2. didChangeDependencies called');
    // Good for: Accessing InheritedWidget data
  }

  @override
  Widget build(BuildContext context) {
    print('3. build called - Widget is rendered');
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
    print('4. dispose called - Cleanup here');
    // Good for: Cancel timers, close streams, remove listeners
  }
}
```

### 📝 BuildContext Explained

**What is BuildContext?**
- 📍 Location of a widget in the widget tree
- 🗺️ Handle to access information about ancestors
- 🔑 Required to access themes, media queries, navigation

**Common Uses:**
```dart
// Access theme
Theme.of(context).primaryColor

// Access media query (screen size)
MediaQuery.of(context).size.width

// Navigate to new screen
Navigator.of(context).push(...)

// Show snackbar
ScaffoldMessenger.of(context).showSnackBar(...)
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
