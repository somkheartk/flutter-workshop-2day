# Navigation and Routing Demo

A comprehensive demonstration of Flutter navigation and routing patterns with detailed explanations in code.

## 📋 What You'll Learn

This example teaches you:
- ✅ **Named Routes** - Organizing routes in a central location
- ✅ **Navigator.pushNamed** - Navigating using route names
- ✅ **Passing Data** - Sending data between screens
- ✅ **Receiving Data** - Getting data in destination screens
- ✅ **Navigation Stack** - Understanding how screens are managed
- ✅ **Navigator.pop** - Returning to previous screens

## 🎯 Features

### Navigation Methods Demonstrated
1. **Named Routes** - Clean, maintainable route management
2. **Data Passing** - Send complex data between screens
3. **Navigator.push** - Add screens to navigation stack
4. **Navigator.pop** - Remove screens from stack

### Screens Included
- **🏠 Home Screen** - Landing page with navigation buttons
- **👤 Profile Screen** - User profile demonstration  
- **⚙️ Settings Screen** - Settings with interactive controls
- **📄 Details Screen** - Product details receiving data from home

## 🚀 How to Run

### Prerequisites
- Flutter SDK installed (`flutter doctor` to verify)
- An emulator/simulator or physical device
- Internet connection for dependencies

### Step-by-Step Instructions

1. **Navigate to the example directory:**
   ```bash
   cd day2/session2/example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
   
   You should see: `Got dependencies!`

3. **Run the app:**
   ```bash
   flutter run
   ```
   
   Select your device if prompted.

### Expected Output

When the app launches:

**Home Screen (First Screen):**
- 🏠 Blue AppBar with "Home Screen" title
- Large home icon in center
- Welcome message: "Welcome to Navigation Demo"
- Three navigation buttons:
  1. "Go to Profile" - Simple navigation example
  2. "Go to Settings" - Another simple navigation
  3. "View Details (with data)" - Navigation WITH data passing
- Tip box explaining back button behavior

**What Happens When You Navigate:**

1. **Click "Go to Profile":**
   - Navigates to Profile Screen
   - Back button appears in AppBar
   - Navigation Stack: [Home] → [Home, Profile]
   - Press back to return to Home

2. **Click "Go to Settings":**
   - Navigates to Settings Screen
   - Shows various setting controls
   - Navigation Stack: [Home] → [Home, Settings]
   - Press back to return to Home

3. **Click "View Details (with data)":**
   - Navigates to Details Screen
   - **Sends data**: title, description, and price
   - Details Screen **receives and displays** this data
   - Navigation Stack: [Home] → [Home, Details]
   - Shows product information with the passed data
   - "Add to Cart" and "Back" buttons at bottom

**Details Screen Shows:**
- Purple AppBar
- Product image placeholder
- Title (from navigation data)
- Price (from navigation data) in Thai Baht
- Description (from navigation data)
- Features list with checkmarks
- Action buttons
- Info box explaining data flow

**Navigation Back:**
- Press device back button
- Or press "<" in AppBar
- Or press "Back" button (on Details screen)
- Returns to previous screen

## 📁 Project Structure

```
lib/
├── main.dart                  # App entry, route definitions
│   ├── main()                # Entry point
│   ├── MyApp                 # Root widget with routes
│   └── Route Configuration    # Named routes map
│
└── screens/
    ├── home_screen.dart          # Landing page
    │   └── Navigation examples   # 3 different navigation patterns
    │
    ├── profile_screen.dart       # Profile page
    │   └── User info display     # Sample profile UI
    │
    ├── settings_screen.dart      # Settings page  
    │   └── Interactive controls  # Switches, sliders
    │
    └── details_screen.dart       # Details page
        ├── Receives data         # Gets data via ModalRoute
        └── Displays data         # Shows received information
```

## 🎓 Key Concepts Explained

### 1. Named Routes Setup (in main.dart)
```dart
MaterialApp(
  initialRoute: '/',           // Starting screen
  routes: {
    '/': (context) => HomeScreen(),        // Home route
    '/profile': (context) => ProfileScreen(), // Profile route
    '/details': (context) => DetailsScreen(), // Details route
  },
)
```

**Why use named routes?**
- ✅ Cleaner code
- ✅ Easy to maintain
- ✅ Centralized navigation logic
- ✅ Easy to add deep linking

### 2. Simple Navigation
```dart
// Navigate to profile screen
Navigator.pushNamed(context, '/profile');

// Navigation Stack: [Home] → [Home, Profile]
```

### 3. Navigation with Data
```dart
// Send data to details screen
Navigator.pushNamed(
  context,
  '/details',
  arguments: {
    'title': 'Product Name',
    'price': 99.99,
  },
);

// Navigation Stack: [Home] → [Home, Details]
// Data: {title, price} → Details Screen
```

### 4. Receiving Data
```dart
// In DetailsScreen.dart:
final args = ModalRoute.of(context)?.settings.arguments as Map?;
final title = args?['title'] ?? 'Default';
final price = args?['price'] ?? 0.0;

// Now use title and price to build UI
```

### 5. Going Back
```dart
// Return to previous screen
Navigator.pop(context);

// Navigation Stack: [Home, Details] → [Home]
```

### Navigation Stack Visualization
```
Action                    Stack
─────────────────────────────────────────
App Start                [Home]
pushNamed('/profile')    [Home, Profile]
pop()                    [Home]
pushNamed('/details')    [Home, Details]
pop()                    [Home]
```

## 🎯 Learning Challenges

Try these modifications:

### Easy:
1. Add a fourth screen (e.g., "About")
2. Change the colors of AppBars
3. Add more buttons to Home screen

### Medium:
4. Pass user data from Home → Profile
5. Add a confirmation dialog before navigating
6. Implement Navigator.pushReplacement
7. Create a "Settings changed" message that shows when returning from Settings

### Hard:
8. Implement Bottom Navigation Bar with 3 tabs
9. Add a Drawer with navigation menu
10. Create a nested navigation structure
11. Implement deep linking with named routes
12. Return data FROM Details TO Home screen

## 🐛 Troubleshooting

**Problem:** "Could not find a generator for route"
```
# Solution: Check route name spelling
# Make sure route name in Navigator.pushNamed
# matches exactly with routes map in main.dart
Navigator.pushNamed(context, '/profile');  # ← Must match
routes: {'/profile': ...}                   # ← This
```

**Problem:** "Null check operator used on null value" when getting arguments
```dart
# Solution: Use null-safe operators
// Bad:
final args = ModalRoute.of(context)!.settings.arguments as Map;

// Good:
final args = ModalRoute.of(context)?.settings.arguments as Map?;
final title = args?['title'] ?? 'Default Title';
```

**Problem:** Back button doesn't appear
- **Cause:** You're on the initial route ('/')
- **Solution:** Initial route doesn't have back button (by design)
- Only screens pushed onto stack have back buttons

**Problem:** Can't pass complex objects
- **Cause:** Arguments can be any type, but be careful with types
- **Solution:** Use Models/Classes or stick with Maps for simple data

## 📚 Related Documentation

- [Navigation Basics](https://docs.flutter.dev/cookbook/navigation/navigation-basics) - Flutter cookbook
- [Named Routes](https://docs.flutter.dev/cookbook/navigation/named-routes) - Official guide
- [Passing Data](https://docs.flutter.dev/cookbook/navigation/passing-data) - Data passing tutorial
- [Navigator Class](https://api.flutter.dev/flutter/widgets/Navigator-class.html) - API reference

## 💡 Next Steps

After mastering this example:
1. ✅ Combine navigation with Provider (share state across screens)
2. ✅ Learn about Bottom Navigation Bar
3. ✅ Explore Drawer Navigation
4. ✅ Study advanced routing packages (go_router, auto_route)
5. ✅ Move to Session 3: API Integration

---

**💙 Great job!** You now understand Flutter navigation fundamentals. These patterns are used in almost every Flutter app!
