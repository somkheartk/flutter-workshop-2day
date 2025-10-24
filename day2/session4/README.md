# Session 4: Testing, Building & Deployment

## 📖 Overview

Learn how to test, build, and deploy your Flutter applications.

---

## 🎯 Learning Objectives

- Write unit and widget tests
- Build release versions
- Create app icons and splash screens
- Prepare for app store deployment

---

## 1. Testing

### Unit Tests

```dart
// test/counter_test.dart
import 'package:flutter_test/flutter_test.dart';

int add(int a, int b) => a + b;

void main() {
  test('adds two numbers', () {
    expect(add(2, 3), 5);
    expect(add(-1, 1), 0);
  });
}
```

### Widget Tests

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(MyApp());

    // Verify initial state
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/counter_test.dart

# Run with coverage
flutter test --coverage
```

---

## 2. App Icons

### Using flutter_launcher_icons

**pubspec.yaml:**
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.0

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/icon.png"
  adaptive_icon_background: "#ffffff"
  adaptive_icon_foreground: "assets/icon/icon.png"
```

**Generate icons:**
```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

---

## 3. Splash Screen

### Using flutter_native_splash

**pubspec.yaml:**
```yaml
dev_dependencies:
  flutter_native_splash: ^2.3.0

flutter_native_splash:
  color: "#42a5f5"
  image: assets/splash/splash.png
  android: true
  ios: true
```

**Generate splash:**
```bash
flutter pub run flutter_native_splash:create
```

---

## 4. Building for Production

### Android

```bash
# Build APK (for testing)
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS

```bash
# Build iOS app
flutter build ios --release

# Build IPA (requires Xcode)
flutter build ipa
```

---

## 5. App Signing

### Android

Create keystore:
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

**android/key.properties:**
```properties
storePassword=<password>
keyPassword=<password>
keyAlias=key
storeFile=<path-to-key.jks>
```

**android/app/build.gradle:**
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

---

## 6. Deployment Checklist

### Google Play Store

- [ ] App icon (512x512 PNG)
- [ ] Feature graphic (1024x500)
- [ ] Screenshots (2-8 images)
- [ ] App description
- [ ] Privacy policy URL
- [ ] Content rating
- [ ] Signed APK/AAB
- [ ] Developer account ($25 one-time fee)

### Apple App Store

- [ ] App icon (1024x1024 PNG)
- [ ] Screenshots for all devices
- [ ] App description
- [ ] Privacy policy
- [ ] Apple Developer account ($99/year)
- [ ] App Store Connect setup
- [ ] TestFlight testing

---

## 7. Version Management

**pubspec.yaml:**
```yaml
version: 1.0.0+1
# 1.0.0 = version name
# +1 = build number
```

**Increment for updates:**
```yaml
version: 1.0.1+2  # Bug fix
version: 1.1.0+3  # New features
version: 2.0.0+4  # Major changes
```

---

## 8. Performance Optimization

### Best Practices

```dart
// Use const constructors
const Text('Hello');

// Avoid rebuilding unnecessarily
const SizedBox(height: 10);

// Use ListView.builder for long lists
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => ListTile(title: Text('$index')),
);

// Cache images
CachedNetworkImage(imageUrl: url);
```

---

## 9. Debugging

### Flutter DevTools

```bash
# Run app in debug mode
flutter run

# Open DevTools
flutter devtools
```

### Debug Commands

```bash
# Check for issues
flutter doctor

# Analyze code
flutter analyze

# Format code
flutter format .

# Clean build
flutter clean
flutter pub get
```

---

## 💻 Hands-on Exercise

1. Write tests for your app
2. Create custom app icon
3. Add splash screen
4. Build release APK
5. Test on real device

---

## 📚 Resources

- [Testing Flutter Apps](https://docs.flutter.dev/testing)
- [Building and Releasing](https://docs.flutter.dev/deployment)
- [Google Play Console](https://play.google.com/console)
- [App Store Connect](https://appstoreconnect.apple.com/)

---

## ✅ Checklist

- [ ] Can write unit tests
- [ ] Can write widget tests
- [ ] Created app icon
- [ ] Added splash screen
- [ ] Built release version
- [ ] Understand deployment process

---

## 🎉 Workshop Complete!

Congratulations! You've completed the 2-day Flutter workshop!

You now know:
- Flutter fundamentals
- Dart programming
- UI development
- State management
- Navigation
- API integration
- Testing and deployment

**Keep building amazing apps!** 🚀

---

[← Back to Day 2](../README.md)
