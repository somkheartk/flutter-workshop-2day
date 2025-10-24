# Navigation and Routing Demo

A comprehensive demonstration of Flutter navigation and routing patterns.

## Features

### Navigation Methods Demonstrated
1. **Named Routes** - Using route names for navigation
2. **Passing Data** - Sending data between screens
3. **Navigator.push** - Push new screen onto stack
4. **Navigator.pop** - Return to previous screen

### Screens
- **Home Screen** - Main entry point with navigation buttons
- **Profile Screen** - User profile with information cards
- **Settings Screen** - Settings with switches, sliders, and state
- **Details Screen** - Product details receiving data from previous screen

## How to Run

```bash
flutter run
```

## Key Concepts

### Named Routes
```dart
// Define routes in MaterialApp
routes: {
  '/': (context) => HomeScreen(),
  '/profile': (context) => ProfileScreen(),
}

// Navigate using route name
Navigator.pushNamed(context, '/profile');
```

### Passing Data
```dart
// Send data
Navigator.pushNamed(
  context,
  '/details',
  arguments: {'title': 'Product', 'price': 999.99},
);

// Receive data
final args = ModalRoute.of(context)?.settings.arguments as Map?;
```

### Navigation Stack
- `Navigator.push()` - Add screen to stack
- `Navigator.pop()` - Remove current screen
- `Navigator.pushReplacement()` - Replace current screen
- `Navigator.popUntil()` - Pop until condition

## Project Structure

```
lib/
├── main.dart              # App entry with route definitions
└── screens/
    ├── home_screen.dart       # Home page
    ├── profile_screen.dart    # Profile page
    ├── settings_screen.dart   # Settings page
    └── details_screen.dart    # Details page with arguments
```

## Learning Points

1. Setting up named routes in MaterialApp
2. Navigating between screens with Navigator
3. Passing data to new screens
4. Receiving data in destination screens
5. Going back to previous screens
6. Using different navigation patterns
7. Managing navigation stack
8. Handling back button behavior
