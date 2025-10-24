# Session 1: Introduction to Flutter & Setup

## 📖 Overview

This session introduces you to Flutter framework and helps you set up your development environment.

---

## 🎯 Learning Objectives

After this session, you will be able to:
- Understand what Flutter is and why it's useful
- Install Flutter SDK and set up development tools
- Create your first Flutter project
- Run Flutter apps on emulators and devices

---

## 1. What is Flutter?

### Introduction

Flutter is Google's **UI toolkit** for building natively compiled applications for mobile, web, and desktop from a single codebase.

### Key Features

- **Fast Development**: Hot reload helps you quickly experiment and build UIs
- **Beautiful UIs**: Rich set of customizable widgets
- **Native Performance**: Compiled to native ARM code
- **Single Codebase**: Write once, deploy to iOS, Android, Web, and Desktop

### Flutter Architecture

```
┌─────────────────────────────────────┐
│         Your App Code               │
│           (Dart)                    │
├─────────────────────────────────────┤
│        Flutter Framework            │
│       (Widgets, Rendering)          │
├─────────────────────────────────────┤
│         Flutter Engine              │
│      (Skia, Dart Runtime)           │
├─────────────────────────────────────┤
│    Platform (iOS/Android/Web)       │
└─────────────────────────────────────┘
```

### Why Choose Flutter?

✅ **Single codebase** for multiple platforms
✅ **Hot reload** for fast iteration
✅ **Rich widget library**
✅ **High performance**
✅ **Strong community** and ecosystem
✅ **Backed by Google**

---

## 2. Development Environment Setup

### System Requirements

**Windows:**
- Operating Systems: Windows 10 or later (64-bit)
- Disk Space: 2.5 GB
- Tools: Git for Windows, PowerShell 5.0 or newer

**macOS:**
- Operating Systems: macOS 10.14 or later
- Disk Space: 2.5 GB
- Tools: Xcode (for iOS development)

**Linux:**
- Operating Systems: 64-bit distribution
- Disk Space: 600 MB
- Tools: bash, curl, git, mkdir, rm, unzip, which, xz-utils

### Install Flutter SDK

#### macOS

```bash
# Download Flutter SDK
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Add to shell profile for persistence
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc

# Or use Homebrew
brew install flutter
```

#### Windows

1. Download Flutter SDK from: https://docs.flutter.dev/get-started/install/windows
2. Extract the zip file to desired location (e.g., `C:\src\flutter`)
3. Add Flutter to PATH:
   - Search for "Environment Variables"
   - Edit PATH variable
   - Add `C:\src\flutter\bin`

#### Linux

```bash
# Download Flutter SDK
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# Add Flutter to PATH
export PATH="$PATH:$HOME/development/flutter/bin"

# Add to shell profile
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc
```

### Run Flutter Doctor

```bash
flutter doctor
```

This command checks your environment and displays a report:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on macOS 13.x.x)
[✓] Android toolchain - develop for Android devices
[✓] Xcode - develop for iOS and macOS
[✓] Chrome - develop for the web
[✓] Android Studio
[✓] VS Code
[✓] Connected device
```

### Install Android Studio

1. Download from: https://developer.android.com/studio
2. Install Android Studio
3. Open Android Studio
4. Go to Settings/Preferences → Plugins
5. Install Flutter plugin
6. Install Dart plugin

### Install VS Code (Alternative)

1. Download from: https://code.visualstudio.com/
2. Install VS Code
3. Open Extensions (Ctrl+Shift+X / Cmd+Shift+X)
4. Install "Flutter" extension (includes Dart)

### Set Up Android Emulator

**Via Android Studio:**
1. Open Android Studio
2. Tools → AVD Manager
3. Create Virtual Device
4. Select a device definition
5. Download a system image
6. Finish setup

**Check available devices:**
```bash
flutter emulators
flutter emulators --launch <emulator_id>
```

### Set Up iOS Simulator (macOS only)

```bash
# Open iOS Simulator
open -a Simulator

# Or install Xcode Command Line Tools
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

---

## 3. Creating Your First Flutter Project

### Create a New Project

```bash
# Navigate to your projects directory
cd ~/projects

# Create a new Flutter project
flutter create hello_flutter

# Navigate to project directory
cd hello_flutter
```

### Project Structure

```
hello_flutter/
├── android/          # Android native code
├── ios/              # iOS native code
├── lib/              # Dart code (main.dart)
├── test/             # Test files
├── pubspec.yaml      # Project dependencies
└── README.md         # Project documentation
```

### Understanding Key Files

**pubspec.yaml**
```yaml
name: hello_flutter
description: A new Flutter project.

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```

**lib/main.dart**
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

---

## 4. Running Your First App

### Start an Emulator/Simulator

```bash
# List available devices
flutter devices

# Start an emulator
flutter emulators --launch <emulator_id>
```

### Run the App

```bash
# Run in debug mode
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in release mode
flutter run --release
```

### Hot Reload

While the app is running:
- Press `r` to hot reload
- Press `R` to hot restart
- Press `q` to quit

### VS Code Run Configuration

1. Open the project in VS Code
2. Press F5 or click "Run and Debug"
3. Select "Flutter" configuration
4. App will start running

---

## 💻 Hands-on Exercise

### Exercise 1: Setup Verification

1. Run `flutter doctor` and resolve any issues
2. Create a new project: `flutter create my_first_app`
3. Run the project on an emulator
4. Verify hot reload works:
   - Change the app title
   - Press 'r' to hot reload
   - See the change immediately

### Exercise 2: Explore the Default App

1. Click the floating action button
2. Observe the counter increment
3. Read through the code in `main.dart`
4. Try changing:
   - App title
   - Primary color
   - Button icon
   - Counter increment value

---

## 📚 Resources

- [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)
- [Flutter Doctor](https://docs.flutter.dev/get-started/flutter-doctor)
- [Flutter for Beginners](https://www.youtube.com/watch?v=1ukSR1GRtMU)

---

## ✅ Checklist

- [ ] Flutter SDK installed
- [ ] `flutter doctor` shows no critical issues
- [ ] IDE set up (VS Code or Android Studio)
- [ ] Emulator/Simulator configured
- [ ] First Flutter project created
- [ ] App successfully runs on device/emulator
- [ ] Hot reload tested and working

---

## 🔜 Next Steps

Continue to [Session 2: Dart Programming Basics](../session2/README.md)

---

[← Back to Day 1](../README.md)
