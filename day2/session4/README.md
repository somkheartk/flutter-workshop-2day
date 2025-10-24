# Session 4: Testing, Building & Deployment

## 📖 Overview

Learn how to ensure code quality through testing, build production-ready apps, and prepare for app store deployment. This session transforms your development app into a polished, production-ready application!

**Duration:** 1.75 hours  
**Difficulty:** Intermediate to Advanced

---

## 🎯 Learning Objectives

After this session, you will be able to:

### Testing Skills
- ✅ **Unit Tests**: Test business logic and functions
- ✅ **Widget Tests**: Test UI components and interactions
- ✅ **Integration Tests**: Test complete user flows
- ✅ **Test Coverage**: Measure and improve test coverage

### Build & Polish Skills
- 🎨 **App Icons**: Create platform-specific app icons
- 🌅 **Splash Screens**: Design loading screens
- 📦 **Release Builds**: Build optimized production versions
- 🔐 **Code Signing**: Configure certificates and keys

### Deployment Skills
- 📱 **Android**: Build APK and AAB files
- 🍎 **iOS**: Build and archive for App Store
- 🚀 **Publishing**: Prepare store listings
- 📊 **Version Management**: Handle app versions

---

## 🗺️ Session Flow

```
Part 1: Testing (45 min)
├─ Unit tests
├─ Widget tests
├─ Integration tests
└─ Coverage reports
        ↓
Part 2: App Polish (20 min)
├─ App icons
├─ Splash screens
└─ App name & branding
        ↓
Part 3: Building (25 min)
├─ Android builds (APK/AAB)
├─ iOS builds (IPA)
└─ Build configurations
        ↓
Part 4: Deployment (15 min)
├─ Store requirements
├─ Upload process
└─ Review checklist
```

---

## 📚 Complete Deployment Workflow

### End-to-End Deployment Flow

```
1. Write Tests
   ↓
2. Run Tests (All Pass)
   ↓
3. Create App Icon
   ↓
4. Setup Splash Screen
   ↓
5. Update Version Number
   ↓
6. Build Release Version
   ↓
7. Test Release Build
   ↓
8. Sign App (Production)
   ↓
9. Generate Store Assets
   ↓
10. Submit to Store
   ↓
11. Wait for Review
   ↓
12. 🎉 App Published!
```

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

## 📋 Complete Pre-Deployment Checklist

### ✅ Code Quality Checklist

**Before Building:**
- [ ] All tests pass (`flutter test`)
- [ ] No analyzer errors (`flutter analyze`)
- [ ] Code formatted (`flutter format .`)
- [ ] No debug print statements in production code
- [ ] Environment variables secured (API keys, secrets)
- [ ] Error handling implemented throughout
- [ ] Loading states handled
- [ ] Network error handling added

### ✅ App Polish Checklist

**Visual & UX:**
- [ ] Custom app icon created and configured
- [ ] Splash screen implemented
- [ ] App name finalized
- [ ] All placeholder text replaced
- [ ] Images optimized for size
- [ ] Colors consistent throughout
- [ ] Fonts loaded correctly
- [ ] Dark mode tested (if applicable)
- [ ] RTL layout tested (if applicable)

### ✅ Android Build Checklist

**Configuration:**
- [ ] `android/app/build.gradle` version updated
  ```gradle
  defaultConfig {
      applicationId "com.yourcompany.yourapp"
      minSdkVersion 21
      targetSdkVersion 33
      versionCode 1
      versionName "1.0.0"
  }
  ```
- [ ] Package name unique and correct
- [ ] App permissions declared in `AndroidManifest.xml`
- [ ] Signing key generated (`keytool -genkey`)
- [ ] `key.properties` file created
- [ ] `build.gradle` configured for signing
- [ ] ProGuard rules added (if needed)

**Building:**
- [ ] Release APK built and tested
  ```bash
  flutter build apk --release
  ```
- [ ] AAB built for Play Store
  ```bash
  flutter build appbundle --release
  ```
- [ ] File size checked (<100MB for AAB)
- [ ] Tested on multiple Android versions
- [ ] Tested on different screen sizes

**Play Store Assets:**
- [ ] Screenshots (2-8 images, min 320px)
  - Phone: 1080x1920 or 1920x1080
  - Tablet: 1920x1200 or 1200x1920
- [ ] Feature graphic (1024x500)
- [ ] App icon (512x512, PNG)
- [ ] Privacy policy URL
- [ ] App description (short & full)
- [ ] Contact email
- [ ] Content rating questionnaire completed

### ✅ iOS Build Checklist (macOS only)

**Configuration:**
- [ ] Xcode project opened and configured
- [ ] Bundle identifier set correctly
- [ ] Version and build number updated
- [ ] Deployment target set (iOS 12.0+)
- [ ] Required device capabilities set
- [ ] App permissions described in `Info.plist`
  ```xml
  <key>NSCameraUsageDescription</key>
  <string>We need camera access for...</string>
  ```

**Signing:**
- [ ] Apple Developer account active ($99/year)
- [ ] Certificates created
  - Development certificate
  - Distribution certificate
- [ ] App ID registered
- [ ] Provisioning profiles created
- [ ] Signing configured in Xcode

**Building:**
- [ ] Archive created in Xcode
  ```bash
  flutter build ios --release
  # Then use Xcode to archive
  ```
- [ ] Archive validated
- [ ] Tested on real iOS device
- [ ] Tested on different iOS versions
- [ ] TestFlight beta testing completed

**App Store Assets:**
- [ ] Screenshots (all required sizes)
  - 6.5" Display: 1242x2688, 2688x1242
  - 5.5" Display: 1242x2208, 2208x1242
- [ ] App icon (1024x1024, no transparency)
- [ ] App preview video (optional)
- [ ] Privacy policy URL
- [ ] App description
- [ ] Keywords (up to 100 characters)
- [ ] Support URL
- [ ] Marketing URL (optional)
- [ ] Age rating completed

### ✅ Testing Checklist

**Functional Testing:**
- [ ] All features work as expected
- [ ] Navigation flows correctly
- [ ] Forms validate properly
- [ ] API calls succeed
- [ ] Error messages are user-friendly
- [ ] Back button works correctly
- [ ] App state persists correctly

**Performance Testing:**
- [ ] App starts quickly (<3 seconds)
- [ ] No memory leaks
- [ ] Smooth scrolling (60 FPS)
- [ ] Images load efficiently
- [ ] Network requests are cached when possible
- [ ] Battery usage acceptable

**Device Testing:**
- [ ] Tested on small screen (4")
- [ ] Tested on medium screen (5-6")
- [ ] Tested on large screen (6"+)
- [ ] Tested on tablet
- [ ] Tested in portrait mode
- [ ] Tested in landscape mode
- [ ] Tested offline behavior

**Edge Cases:**
- [ ] No internet connection
- [ ] Slow internet connection
- [ ] API server down
- [ ] Invalid user input
- [ ] Empty states
- [ ] Error states
- [ ] Long text handling
- [ ] Special characters in text

### ✅ Security Checklist

**Data Security:**
- [ ] API keys not hardcoded
- [ ] Sensitive data encrypted
- [ ] HTTPS used for all API calls
- [ ] User sessions handled securely
- [ ] Data validated on both client & server
- [ ] SQL injection prevented (if using SQL)
- [ ] XSS attacks prevented

**Privacy:**
- [ ] Privacy policy created and linked
- [ ] GDPR compliance (if applicable)
- [ ] User consent obtained for data collection
- [ ] Analytics configured properly
- [ ] Crash reporting configured
- [ ] Personal data can be deleted

### ✅ Store Submission Checklist

**Google Play Store:**
1. [ ] Developer account created ($25 one-time)
2. [ ] App created in Play Console
3. [ ] AAB uploaded
4. [ ] Store listing completed
   - Title (max 50 chars)
   - Short description (max 80 chars)
   - Full description (max 4000 chars)
5. [ ] Content rating completed
6. [ ] Pricing & distribution set
7. [ ] App release created
8. [ ] Review notes added (optional)
9. [ ] Submit for review
10. [ ] **Wait 1-3 days for review**

**Apple App Store:**
1. [ ] Developer account active ($99/year)
2. [ ] App created in App Store Connect
3. [ ] Build uploaded via Xcode/Transporter
4. [ ] Store listing completed
   - Name (max 30 chars)
   - Subtitle (max 30 chars)
   - Description (max 4000 chars)
5. [ ] Keywords set (max 100 chars)
6. [ ] Age rating completed
7. [ ] Pricing set
8. [ ] App review information provided
   - Demo account (if needed)
   - Review notes
9. [ ] Export compliance answered
10. [ ] Submit for review
11. [ ] **Wait 1-5 days for review**

### ✅ Post-Launch Checklist

**After App is Live:**
- [ ] Test download from store
- [ ] Verify app installs correctly
- [ ] Check all features work in production
- [ ] Monitor crash reports
- [ ] Monitor user reviews
- [ ] Respond to user feedback
- [ ] Plan first update
- [ ] Analytics tracking verified
- [ ] Marketing materials ready
- [ ] Social media announcement

**Monitoring:**
- [ ] Set up Firebase/Crashlytics
- [ ] Configure analytics
- [ ] Set up performance monitoring
- [ ] Create alerts for critical errors
- [ ] Monitor app ratings
- [ ] Track active users
- [ ] Monitor API usage
- [ ] Track app size over updates

---

## 🚀 Deployment Timeline

### Typical Timeline for First Release

**Week 1-2: Development**
- Build core features
- Implement UI
- Add state management
- API integration

**Week 3: Testing**
- Write tests
- Fix bugs
- Optimize performance
- Test on devices

**Week 4: Polish**
- Create app icon
- Add splash screen
- Refine UI/UX
- Final testing

**Week 5: Preparation**
- Create store assets
- Write descriptions
- Build release versions
- Final device testing

**Week 6: Submission**
- Submit to stores
- Wait for review (1-5 days)
- Address review feedback (if any)
- Launch! 🎉

---

## 💻 Hands-on Exercise

### Complete Deployment Exercise

**Task:** Prepare your workshop app for deployment

1. **Write Tests** (15 min)
   - Add 3 unit tests
   - Add 2 widget tests
   - Run all tests: `flutter test`

2. **Create App Icon** (10 min)
   - Design 512x512 icon
   - Use flutter_launcher_icons
   - Generate icons: `flutter pub run flutter_launcher_icons`

3. **Add Splash Screen** (10 min)
   - Choose background color
   - Add logo/icon
   - Test on device

4. **Build Release** (15 min)
   - Update version number
   - Build APK: `flutter build apk --release`
   - Find APK: `build/app/outputs/flutter-apk/`
   - Test on real device

5. **Create Store Assets** (15 min)
   - Take 3-5 screenshots
   - Write app description
   - List key features
   - Prepare promotional text

---

## 📚 Resources

### Official Documentation
- 📖 [Testing Flutter Apps](https://docs.flutter.dev/testing)
- 🏗️ [Building and Releasing - Android](https://docs.flutter.dev/deployment/android)
- 🍎 [Building and Releasing - iOS](https://docs.flutter.dev/deployment/ios)
- 📱 [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
- 🌅 [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)

### Store Resources
- 🤖 [Google Play Console](https://play.google.com/console)
- 🍎 [App Store Connect](https://appstoreconnect.apple.com/)
- 📋 [Google Play Requirements](https://support.google.com/googleplay/android-developer)
- 📋 [App Store Guidelines](https://developer.apple.com/app-store/review/guidelines/)

### Tools & Services
- 🔨 [Fastlane](https://fastlane.tools/) - Automate deployment
- 📊 [Firebase Crashlytics](https://firebase.google.com/products/crashlytics)
- 📈 [Firebase Analytics](https://firebase.google.com/products/analytics)
- 🔔 [Firebase Cloud Messaging](https://firebase.google.com/products/cloud-messaging)

---

## ✅ Final Workshop Checklist

### Skills Acquired

**Day 1 - Fundamentals:**
- [x] Set up Flutter development environment
- [x] Understand Dart programming language
- [x] Create Flutter widgets
- [x] Build layouts
- [x] Manage local state with setState()
- [x] Build first Flutter apps

**Day 2 - Advanced:**
- [x] Implement state management with Provider
- [x] Create multi-screen navigation
- [x] Integrate REST APIs
- [x] Parse JSON data
- [x] Store data locally
- [x] Write tests
- [x] Build release versions
- [x] Understand deployment process

---

## 🎉 Workshop Complete!

### Congratulations! 🎊

You've completed the **Flutter 2-Day Workshop**!

### What You've Learned:

1. **✅ Flutter Fundamentals**
   - Widget tree and composition
   - Stateless and Stateful widgets
   - Material Design components

2. **✅ Dart Programming**
   - Variables, functions, classes
   - Async/await programming
   - Null safety

3. **✅ UI Development**
   - Layout widgets
   - Styling and theming
   - Responsive design

4. **✅ State Management**
   - setState basics
   - Provider pattern
   - ChangeNotifier

5. **✅ Navigation**
   - Push/pop navigation
   - Named routes
   - Bottom navigation

6. **✅ API Integration**
   - HTTP requests
   - JSON parsing
   - Error handling

7. **✅ Data Persistence**
   - SharedPreferences
   - Local storage

8. **✅ Testing**
   - Unit tests
   - Widget tests
   - Test coverage

9. **✅ Deployment**
   - App icons & splash screens
   - Release builds
   - Store submission process

### Next Steps:

1. **🚀 Build Your Own App**
   - Start with a simple idea
   - Apply what you've learned
   - Publish to stores

2. **📚 Continue Learning**
   - Explore advanced topics
   - Try different state management (GetX, Riverpod, Bloc)
   - Learn animations
   - Study custom painters

3. **🤝 Join the Community**
   - Follow Flutter on Twitter
   - Join Flutter Discord
   - Contribute to open source
   - Share your apps!

4. **💼 Portfolio**
   - Build 2-3 showcase apps
   - Publish to stores
   - Share on GitHub
   - Create case studies

### Resources for Continued Learning:

- 📺 [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)
- 📖 [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- 💬 [Flutter Community](https://flutter.dev/community)
- 📱 [Awesome Flutter](https://github.com/Solido/awesome-flutter)
- 🎓 [Flutter Courses](https://flutter.dev/learn)

---

**Keep coding and building amazing apps! 🚀💙**

Thank you for participating in this workshop!

---

[← Back to Day 2](../README.md) | [Main README](../../README.md)
