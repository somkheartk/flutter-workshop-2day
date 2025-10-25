# Useful Flutter Packages
# แพ็คเกจ Flutter ที่มีประโยชน์

## 📦 Popular and Recommended Packages / แพ็คเกจยอดนิยมและแนะนำ

---

## 🌐 Networking & API / เครือข่ายและ API

### http
**Purpose / วัตถุประสงค์**: Make HTTP requests / ทำคำขอ HTTP
```yaml
http: ^1.1.0
```
```dart
import 'package:http/http.dart' as http;

final response = await http.get(Uri.parse('https://api.example.com/data'));
```

### dio
**Purpose / วัตถุประสงค์**: Advanced HTTP client with interceptors / HTTP client ขั้นสูงพร้อม interceptors
```yaml
dio: ^5.3.0
```

---

## 🗃️ State Management / การจัดการ State

### provider
**Purpose / วัตถุประสงค์**: Simple and recommended state management / การจัดการ state ที่เรียบง่ายและแนะนำ
```yaml
provider: ^6.0.0
```

### riverpod
**Purpose / วัตถุประสงค์**: Next-generation Provider / Provider รุ่นใหม่
```yaml
flutter_riverpod: ^2.4.0
```

### bloc
**Purpose / วัตถุประสงค์**: Business Logic Component pattern / รูปแบบ Business Logic Component
```yaml
flutter_bloc: ^8.1.0
```

### get
**Purpose / วัตถุประสงค์**: All-in-one solution (state, routing, dependency injection) / โซลูชันครบวงจร (state, routing, dependency injection)
```yaml
get: ^4.6.0
```

---

## 💾 Local Storage & Database / การจัดเก็บข้อมูลและฐานข้อมูลในเครื่อง

### shared_preferences
**Purpose / วัตถุประสงค์**: Simple key-value storage / การจัดเก็บแบบคีย์-ค่าง่ายๆ
```yaml
shared_preferences: ^2.2.0
```

### hive
**Purpose / วัตถุประสงค์**: Fast NoSQL database / ฐานข้อมูล NoSQL ที่รวดเร็ว
```yaml
hive: ^2.2.3
hive_flutter: ^1.1.0
```

### sqflite
**Purpose / วัตถุประสงค์**: SQLite database / ฐานข้อมูล SQLite
```yaml
sqflite: ^2.3.0
```

### isar
**Purpose / วัตถุประสงค์**: Fast, cross-platform database / ฐานข้อมูลข้ามแพลตฟอร์มที่รวดเร็ว
```yaml
isar: ^3.1.0
isar_flutter_libs: ^3.1.0
```

---

## 🎨 UI & Widgets / UI และวิดเจ็ต

### google_fonts
**Purpose / วัตถุประสงค์**: Use any Google Font / ใช้ฟอนต์ Google ใดก็ได้
```yaml
google_fonts: ^6.1.0
```
```dart
Text('Hello', style: GoogleFonts.roboto(fontSize: 20))
```

### flutter_svg
**Purpose / วัตถุประสงค์**: Display SVG images / แสดงรูปภาพ SVG
```yaml
flutter_svg: ^2.0.0
```

### cached_network_image
**Purpose / วัตถุประสงค์**: Cache and display network images / แคชและแสดงรูปภาพจากเครือข่าย
```yaml
cached_network_image: ^3.3.0
```

### lottie
**Purpose / วัตถุประสงค์**: Beautiful animations from JSON / แอนิเมชันสวยงามจาก JSON
```yaml
lottie: ^2.7.0
```

### shimmer
**Purpose / วัตถุประสงค์**: Loading shimmer effect / เอฟเฟกต์ shimmer ขณะโหลด
```yaml
shimmer: ^3.0.0
```

---

## 🧭 Navigation & Routing / การนำทางและเส้นทาง

### go_router
**Purpose / วัตถุประสงค์**: Declarative routing / การกำหนดเส้นทางแบบประกาศ
```yaml
go_router: ^12.0.0
```

### auto_route
**Purpose / วัตถุประสงค์**: Code generation for routing / สร้างโค้ดสำหรับการกำหนดเส้นทาง
```yaml
auto_route: ^7.8.0
```

---

## 🔐 Authentication & Security / การยืนยันตัวตนและความปลอดภัย

### firebase_auth
**Purpose / วัตถุประสงค์**: Firebase authentication / การยืนยันตัวตนด้วย Firebase
```yaml
firebase_auth: ^4.12.0
```

### flutter_secure_storage
**Purpose / วัตถุประสงค์**: Secure storage for sensitive data / การจัดเก็บข้อมูลที่ละเอียดอ่อนอย่างปลอดภัย
```yaml
flutter_secure_storage: ^9.0.0
```

### local_auth
**Purpose**: Biometric authentication
```yaml
local_auth: ^2.1.0
```

---

## 🔔 Notifications

### flutter_local_notifications
**Purpose**: Local notifications
```yaml
flutter_local_notifications: ^16.1.0
```

### firebase_messaging
**Purpose**: Push notifications via Firebase
```yaml
firebase_messaging: ^14.7.0
```

---

## 📱 Device Features

### image_picker
**Purpose**: Pick images from gallery or camera
```yaml
image_picker: ^1.0.0
```

### camera
**Purpose**: Access device camera
```yaml
camera: ^0.10.5
```

### geolocator
**Purpose**: Get device location
```yaml
geolocator: ^10.1.0
```

### url_launcher
**Purpose**: Launch URLs, emails, phone numbers
```yaml
url_launcher: ^6.2.0
```

### share_plus
**Purpose**: Share content to other apps
```yaml
share_plus: ^7.2.0
```

### path_provider
**Purpose**: Access common file locations
```yaml
path_provider: ^2.1.0
```

---

## 📊 Charts & Visualization

### fl_chart
**Purpose**: Beautiful charts
```yaml
fl_chart: ^0.65.0
```

### syncfusion_flutter_charts
**Purpose**: Professional charts
```yaml
syncfusion_flutter_charts: ^23.2.0
```

---

## 🌍 Internationalization

### intl
**Purpose**: Internationalization and localization
```yaml
intl: ^0.18.0
```

### flutter_localizations
**Purpose**: Built-in localization support
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

---

## 🧪 Testing & Development

### mockito
**Purpose**: Mock objects for testing
```yaml
dev_dependencies:
  mockito: ^5.4.0
```

### flutter_test
**Purpose**: Built-in testing framework
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```

### integration_test
**Purpose**: Integration testing
```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
```

---

## 🛠️ Utilities

### equatable
**Purpose**: Simplify equality comparisons
```yaml
equatable: ^2.0.0
```

### freezed
**Purpose**: Code generation for immutable classes
```yaml
dev_dependencies:
  freezed: ^2.4.0
  build_runner: ^2.4.0
```

### json_serializable
**Purpose**: JSON serialization
```yaml
dev_dependencies:
  json_serializable: ^6.7.0
  build_runner: ^2.4.0
```

### logger
**Purpose**: Pretty logging
```yaml
logger: ^2.0.0
```

---

## 🎥 Media & Video

### video_player
**Purpose**: Play videos
```yaml
video_player: ^2.8.0
```

### audioplayers
**Purpose**: Play audio files
```yaml
audioplayers: ^5.2.0
```

---

## 🌟 Popular Firebase Packages

### firebase_core
**Purpose**: Core Firebase functionality
```yaml
firebase_core: ^2.22.0
```

### cloud_firestore
**Purpose**: Cloud Firestore database
```yaml
cloud_firestore: ^4.13.0
```

### firebase_storage
**Purpose**: Cloud storage
```yaml
firebase_storage: ^11.5.0
```

### firebase_analytics
**Purpose**: Analytics
```yaml
firebase_analytics: ^10.7.0
```

---

## 📱 App Configuration

### flutter_launcher_icons
**Purpose**: Generate app icons
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.0

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/icon.png"
```

### flutter_native_splash
**Purpose**: Create native splash screens
```yaml
dev_dependencies:
  flutter_native_splash: ^2.3.0
```

---

## 🔍 Search & Filter

### flutter_typeahead
**Purpose**: Autocomplete text field
```yaml
flutter_typeahead: ^4.8.0
```

---

## 💳 Payment Integration

### stripe_flutter
**Purpose**: Stripe payment integration
```yaml
flutter_stripe: ^10.0.0
```

---

## 📝 Forms

### flutter_form_builder
**Purpose**: Build complex forms easily
```yaml
flutter_form_builder: ^9.1.0
```

---

## 📅 Date & Time

### table_calendar
**Purpose**: Calendar widget
```yaml
table_calendar: ^3.0.0
```

### flutter_datetime_picker
**Purpose**: Date and time picker
```yaml
flutter_datetime_picker: ^1.5.0
```

---

## 💡 Tips for Using Packages

1. **Check Popularity**: Look at pub.dev likes and pub points
2. **Check Maintenance**: Look for recent updates
3. **Read Documentation**: Always read the package documentation
4. **Check Platform Support**: Ensure it supports your target platforms
5. **Consider Bundle Size**: Too many packages can increase app size
6. **Security**: Use well-maintained packages for sensitive operations

---

## 🔗 Resources

- [Pub.dev](https://pub.dev/) - Official package repository
- [Flutter Favorites](https://pub.dev/flutter-favorites) - Google-recommended packages
- [Awesome Flutter](https://github.com/Solido/awesome-flutter) - Curated list

---

**Remember to run `flutter pub get` after adding packages!** 📦
