# Runnable Code Examples

This directory contains complete, runnable Flutter example projects for each session of the workshop.

## 📂 Day 1: Flutter Fundamentals

### Session 1: Introduction to Flutter & Setup
**Location:** [`day1/session1/example/`](./day1/session1/example/)

A basic Flutter counter application demonstrating:
- Basic Flutter app structure
- StatefulWidget
- setState() for state management
- FloatingActionButton

**Run:** `cd day1/session1/example && flutter run`

---

### Session 2: Dart Programming Basics
**Location:** [`day1/session2/examples/`](./day1/session2/examples/)

Four Dart command-line examples covering:
- Variables and data types (`01_variables.dart`)
- Control flow (`02_control_flow.dart`)
- Functions (`03_functions.dart`)
- Object-oriented programming (`04_oop.dart`)

**Run:** `cd day1/session2/examples && dart 01_variables.dart`

---

### Session 3: Flutter Widgets & Layouts
**Location:** [`day1/session3/example/`](./day1/session3/example/)

Comprehensive widgets demonstration including:
- Card, Row, Column layouts
- Container styling
- Icons and buttons
- ListView with items
- SnackBar notifications

**Run:** `cd day1/session3/example && flutter run`

---

### Session 4: Building Your First App
**Location:** [`day1/session4/examples/`](./day1/session4/examples/)

Three complete applications:

#### Counter App
Enhanced counter with increment, decrement, and reset.

**Run:** `cd day1/session4/examples/counter_app && flutter run`

#### Profile Card
Interactive profile with follow/unfollow and dynamic stats.

**Run:** `cd day1/session4/examples/profile_card && flutter run`

#### Todo List
Complete todo app with add, toggle, and delete.

**Run:** `cd day1/session4/examples/todo_list && flutter run`

---

## 📂 Day 2: Advanced Features & Deployment

### Session 1: State Management with Provider
**Location:** [`day2/session1/example/`](./day2/session1/example/)

Shopping cart application demonstrating:
- Provider package
- ChangeNotifier
- Consumer widget
- context.read() and context.watch()
- Shared state across screens

**Run:** `cd day2/session1/example && flutter pub get && flutter run`

---

### Session 2: Navigation & Routing
**Location:** [`day2/session2/example/`](./day2/session2/example/)

Multi-screen app showing:
- Named routes
- Navigator.push/pop
- Passing data between screens
- Multiple screen types (Home, Profile, Settings, Details)

**Run:** `cd day2/session2/example && flutter run`

---

### Session 3: API Integration & Data
**Location:** [`day2/session3/example/`](./day2/session3/example/)

API integration demo featuring:
- HTTP package
- GET/POST requests
- JSON parsing
- FutureBuilder
- Error handling
- Loading states

**Run:** `cd day2/session3/example && flutter pub get && flutter run`

**Note:** Requires internet connection.

---

### Session 4: Testing, Building & Deployment
**Location:** [`day2/session4/example/`](./day2/session4/example/)

Testing examples including:
- Unit tests (Calculator, Counter, TodoList)
- Widget tests (UI interactions)
- Test groups and setUp/tearDown
- Coverage reports

**Run App:** `cd day2/session4/example && flutter run`

**Run Tests:** `cd day2/session4/example && flutter test`

**Coverage:** `cd day2/session4/example && flutter test --coverage`

---

## 🚀 Quick Start

### Prerequisites
- Flutter SDK installed
- IDE (VS Code or Android Studio) with Flutter extensions
- Android Emulator or iOS Simulator running
- OR a physical device connected

### Running Any Example

1. Navigate to the example directory:
   ```bash
   cd day1/session1/example
   ```

2. Get dependencies (if needed):
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Running Dart Examples (Session 2)

```bash
cd day1/session2/examples
dart 01_variables.dart
dart 02_control_flow.dart
dart 03_functions.dart
dart 04_oop.dart
```

## 📝 Notes

- Each example is a complete, standalone project
- Examples progress in complexity from Day 1 to Day 2
- All examples include README files with detailed explanations
- Code is well-commented for learning purposes
- Examples follow Flutter best practices

## 🤝 Using These Examples

- **Study**: Read the code and comments to understand concepts
- **Practice**: Modify the code and see the results
- **Experiment**: Try adding new features
- **Debug**: Use hot reload to test changes quickly

## 📚 What You'll Learn

By working through these examples, you'll learn:

**Day 1:**
- Flutter basics and Dart language
- Widget fundamentals and layouts
- State management with setState()
- Building simple apps

**Day 2:**
- Advanced state management (Provider)
- Navigation patterns
- REST API integration
- Testing and best practices

## ⚠️ Troubleshooting

If you encounter issues:

1. **Check Flutter installation:**
   ```bash
   flutter doctor
   ```

2. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **Update Flutter:**
   ```bash
   flutter upgrade
   ```

## 💡 Tips

- Use hot reload (press 'r') to see changes instantly
- Use hot restart (press 'R') for major changes
- Check the terminal for error messages
- Read the README in each example directory
- Refer back to the main session documentation

---

**Happy Coding! 🎉**

For more information, see the main [workshop README](../README.md).
