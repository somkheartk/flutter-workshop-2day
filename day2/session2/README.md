# Session 2: Navigation & Routing

## 📖 Overview

Learn how to navigate between screens in Flutter applications.

---

## 🎯 Learning Objectives

- Navigate between screens with Navigator
- Pass data between screens
- Use named routes
- Implement bottom navigation and drawers

---

## 1. Basic Navigation

### Push and Pop

```dart
// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// Go back
Navigator.pop(context);
```

### Passing Data Forward

```dart
// Send data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(data: 'Hello'),
  ),
);

// Receive data
class DetailScreen extends StatelessWidget {
  final String data;
  const DetailScreen({required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(data),
    );
  }
}
```

### Returning Data

```dart
// Wait for result
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SelectionScreen()),
);

// Return data
Navigator.pop(context, 'Selected Value');
```

---

## 2. Named Routes

### Define Routes

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/second': (context) => SecondScreen(),
    '/detail': (context) => DetailScreen(),
  },
)
```

### Navigate with Named Routes

```dart
// Navigate
Navigator.pushNamed(context, '/second');

// Navigate with arguments
Navigator.pushNamed(
  context,
  '/detail',
  arguments: {'id': 1, 'name': 'Item'},
);

// Receive arguments
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Text('ID: ${args['id']}, Name: ${args['name']}'),
    );
  }
}
```

---

## 3. Bottom Navigation Bar

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    HomeTab(),
    SearchTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

---

## 4. Drawer Navigation

```dart
Scaffold(
  appBar: AppBar(title: Text('App')),
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Menu', style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    ),
  ),
)
```

---

## 💻 Hands-on Exercise

Build a multi-screen app with:
- Home screen with navigation buttons
- Detail screen that receives data
- Settings screen
- Bottom navigation bar
- Drawer menu

---

## 📚 Resources

- [Navigation Documentation](https://docs.flutter.dev/cookbook/navigation)
- [Named Routes](https://docs.flutter.dev/cookbook/navigation/named-routes)

---

[← Back to Day 2](../README.md) | [Next: API Integration →](../session3/README.md)
