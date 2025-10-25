# Flutter Cheat Sheet
# คู่มืออ้างอิงฉบับย่อ Flutter

## 📚 Quick Reference Guide / คู่มืออ้างอิงอย่างรวดเร็ว

---

## Basic Widgets / วิดเจ็ตพื้นฐาน

### Text / ข้อความ
```dart
Text('Hello')
Text('Styled', style: TextStyle(fontSize: 20, color: Colors.blue))
```

### Image / รูปภาพ
```dart
Image.network('url')
Image.asset('assets/image.png')
```

### Button / ปุ่ม
```dart
ElevatedButton(onPressed: () {}, child: Text('Click'))
TextButton(onPressed: () {}, child: Text('Click'))
IconButton(icon: Icon(Icons.add), onPressed: () {})
```

### Container / คอนเทนเนอร์
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text('Content'),
)
```

---

## Layout Widgets / วิดเจ็ตเลย์เอาต์

### Column (Vertical) / คอลัมน์ (แนวตั้ง)
```dart
Column(
  children: [
    Text('One'),
    Text('Two'),
  ],
)
```

### Row (Horizontal) / แถว (แนวนอน)
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
  ],
)
```

### ListView / รายการแบบเลื่อนได้
```dart
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
  ],
)
```

### Stack (Overlay) / สแต็ก (วางซ้อนกัน)
```dart
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(top: 10, child: Text('Top')),
  ],
)
```

---

## Navigation / การนำทาง

### Push (Go to new screen) / ไปยังหน้าจอใหม่
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
```

### Pop (Go back) / กลับหน้าจอก่อนหน้า
```dart
Navigator.pop(context);
```

### Named Routes / เส้นทางที่มีชื่อ
```dart
// Define in MaterialApp / กำหนดใน MaterialApp
MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/second': (context) => SecondPage(),
  },
)

// Navigate / นำทาง
Navigator.pushNamed(context, '/second');
```

---

## State Management / การจัดการ State

### setState / การตั้งค่า State
```dart
class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }
}
```

### Provider
```dart
// Create a ChangeNotifier
class Counter extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

// Provide
ChangeNotifierProvider(
  create: (context) => Counter(),
  child: MyApp(),
)

// Consume
Consumer<Counter>(
  builder: (context, counter, child) {
    return Text('${counter.count}');
  },
)

// Or use Provider.of
final counter = Provider.of<Counter>(context);
```

---

## Async Operations

### Future
```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded';
}

void loadData() async {
  String data = await fetchData();
  print(data);
}
```

### FutureBuilder
```dart
FutureBuilder<String>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data!);
    } else if (snapshot.hasError) {
      return Text('Error');
    }
    return CircularProgressIndicator();
  },
)
```

---

## HTTP Requests

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// GET
Future<void> fetchData() async {
  final response = await http.get(
    Uri.parse('https://api.example.com/data'),
  );
  
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  }
}

// POST
Future<void> sendData() async {
  final response = await http.post(
    Uri.parse('https://api.example.com/data'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'name': 'John', 'age': 25}),
  );
}
```

---

## Common Patterns

### Scaffold Structure
```dart
Scaffold(
  appBar: AppBar(title: Text('Title')),
  body: Center(child: Text('Content')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  drawer: Drawer(),
  bottomNavigationBar: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ],
  ),
)
```

### Form with Validation
```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

---

## Styling

### Theme
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16),
    ),
  ),
)
```

### Custom Colors
```dart
Color(0xFF42A5F5)
Colors.blue.shade500
Colors.blue[500]
```

### EdgeInsets
```dart
EdgeInsets.all(8.0)
EdgeInsets.symmetric(horizontal: 16, vertical: 8)
EdgeInsets.only(left: 10, top: 20)
```

---

## Useful Commands

### Create Project
```bash
flutter create my_app
```

### Run App
```bash
flutter run
flutter run -d chrome  # Run on web
```

### Build
```bash
flutter build apk       # Android APK
flutter build appbundle # Android App Bundle
flutter build ios       # iOS
```

### Pub Commands
```bash
flutter pub get     # Install dependencies
flutter pub upgrade # Update dependencies
flutter pub outdated # Check for updates
```

### Clean and Get
```bash
flutter clean
flutter pub get
```

---

## Keyboard Shortcuts

### Hot Reload
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

### VS Code
- `F5` - Start debugging
- `Shift+F5` - Stop debugging
- `Ctrl+Shift+P` - Command palette

---

## Useful Packages

### Common Packages
```yaml
dependencies:
  # HTTP requests
  http: ^1.1.0
  
  # State management
  provider: ^6.0.0
  
  # Local storage
  shared_preferences: ^2.2.0
  
  # JSON serialization
  json_annotation: ^4.8.0
  
  # Icons
  font_awesome_flutter: ^10.5.0
  
  # Images
  cached_network_image: ^3.3.0
  
  # Navigation
  go_router: ^12.0.0
```

---

## Debugging

### Print Statements
```dart
print('Debug: $variable');
debugPrint('Debug message');
```

### Debug Paint
```dart
MaterialApp(
  debugShowCheckedModeBanner: false,
  showPerformanceOverlay: true,
)
```

### Flutter Inspector
- Open in VS Code or Android Studio
- Inspect widget tree
- View layout constraints

---

## Tips

- Use `const` constructors when possible for better performance
- Use `ListView.builder` for long lists
- Avoid deep widget trees
- Use `keys` for stateful widgets in lists
- Always handle errors in async operations
- Test on real devices, not just emulators

---

**Keep this cheat sheet handy while coding!** 🚀
