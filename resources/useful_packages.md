# Useful Flutter Packages

## 📦 Popular and Recommended Packages

---

## 🌐 Networking & API

### http
**Purpose**: Make HTTP requests
```yaml
http: ^1.1.0
```
```dart
import 'package:http/http.dart' as http;

final response = await http.get(Uri.parse('https://api.example.com/data'));
```

### dio
**Purpose**: Advanced HTTP client with interceptors
```yaml
dio: ^5.3.0
```

---

## 🗃️ State Management

### provider
**Purpose**: Simple and recommended state management
```yaml
provider: ^6.0.0
```

### riverpod
**Purpose**: Next-generation Provider
```yaml
flutter_riverpod: ^2.4.0
```

### bloc
**Purpose**: Business Logic Component pattern
```yaml
flutter_bloc: ^8.1.0
```

### get
**Purpose**: All-in-one solution (state, routing, dependency injection)
```yaml
get: ^4.6.0
```

---

## 💾 Local Storage & Database

### shared_preferences
**Purpose**: Simple key-value storage
```yaml
shared_preferences: ^2.2.0
```

### hive
**Purpose**: Fast NoSQL database
```yaml
hive: ^2.2.3
hive_flutter: ^1.1.0
```

### sqflite
**Purpose**: SQLite database
```yaml
sqflite: ^2.3.0
```

### isar
**Purpose**: Fast, cross-platform database
```yaml
isar: ^3.1.0
isar_flutter_libs: ^3.1.0
```

---

## 🎨 UI & Widgets

### google_fonts
**Purpose**: Use any Google Font
```yaml
google_fonts: ^6.1.0
```
```dart
Text('Hello', style: GoogleFonts.roboto(fontSize: 20))
```

### flutter_svg
**Purpose**: Display SVG images
```yaml
flutter_svg: ^2.0.0
```

### cached_network_image
**Purpose**: Cache and display network images
```yaml
cached_network_image: ^3.3.0
```

### lottie
**Purpose**: Beautiful animations from JSON
```yaml
lottie: ^2.7.0
```

### shimmer
**Purpose**: Loading shimmer effect
```yaml
shimmer: ^3.0.0
```

---

## 🧭 Navigation & Routing

### go_router
**Purpose**: Declarative routing
```yaml
go_router: ^12.0.0
```

### auto_route
**Purpose**: Code generation for routing
```yaml
auto_route: ^7.8.0
```

---

## 🔐 Authentication & Security

### firebase_auth
**Purpose**: Firebase authentication
```yaml
firebase_auth: ^4.12.0
```

### flutter_secure_storage
**Purpose**: Secure storage for sensitive data
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
