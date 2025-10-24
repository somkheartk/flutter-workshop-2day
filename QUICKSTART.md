# Quick Start Guide - เริ่มต้นใช้งานใน 10 นาที

Get started with the Flutter Workshop quickly and efficiently!

## 🎯 Overview Flow

```
Prerequisites Check → Install Flutter → Setup Device → Clone Repo → Run First App → Start Learning
     (2 min)             (3 min)         (2 min)       (1 min)        (1 min)        (Ready!)
```

---

## ✅ Step 0: Prerequisites Check (2 minutes)

### Before You Start

**Check Your System:**
```bash
# Check RAM (should be 8GB+)
# macOS/Linux:
free -h

# Windows (PowerShell):
Get-ComputerInfo | Select-Object CsName, CsTotalPhysicalMemory

# Check available disk space (should be 10GB+)
df -h  # macOS/Linux
```

**Required:**
- ✅ Computer with 8GB+ RAM (16GB recommended)
- ✅ 10GB+ free disk space
- ✅ Internet connection (stable, not metered)
- ✅ Basic programming knowledge in any language

**Recommended:**
- 💡 Familiarity with mobile apps
- 💡 Basic understanding of Object-Oriented Programming
- 💡 Terminal/Command line basics

---

## 📥 Step 1: Install Flutter (3 minutes)

### Installation Flow

```
Choose Your OS → Download SDK → Extract/Install → Add to PATH → Verify → Done!
```

### macOS

**🎯 Recommended: Homebrew Method**
```bash
# 1. Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Flutter via Homebrew
brew install flutter

# 3. Verify installation
flutter --version

# 4. Check everything is working
flutter doctor
```

**⚙️ Alternative: Manual Method**
```bash
# 1. Download Flutter SDK
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# 2. Add to PATH (zsh - default on modern macOS)
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc

# 3. Reload shell
source ~/.zshrc

# 4. Verify
flutter --version
```

### Windows

**Step-by-Step:**

1. **Download Flutter SDK**
   - Visit: https://docs.flutter.dev/get-started/install/windows
   - Click "flutter_windows_3.x.x-stable.zip"
   - Save to Downloads folder

2. **Extract the Archive**
   ```powershell
   # Create a directory (avoid Program Files)
   New-Item -ItemType Directory -Path C:\src

   # Extract Flutter SDK
   # Right-click the zip file → Extract All → C:\src\
   # Final path should be: C:\src\flutter\
   ```

3. **Add Flutter to PATH**
   ```powershell
   # Open Environment Variables:
   # 1. Press Win + R
   # 2. Type: sysdm.cpl
   # 3. Click "Environment Variables..."
   # 4. Under "User variables", select "Path"
   # 5. Click "Edit" → "New"
   # 6. Add: C:\src\flutter\bin
   # 7. Click "OK" on all windows
   ```

4. **Verify Installation**
   ```powershell
   # Open NEW Command Prompt or PowerShell
   flutter --version
   flutter doctor
   ```

### Linux (Ubuntu/Debian)

```bash
# 1. Install prerequisites
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# 2. Download Flutter SDK
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# 3. Add to PATH
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc

# 4. Reload bash
source ~/.bashrc

# 5. Verify
flutter --version
flutter doctor
```

### ✅ Verify Flutter Installation

**Run Flutter Doctor:**
```bash
flutter doctor
```

**Expected Output:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.16.x, on ...)
[!] Android toolchain - develop for Android devices
[!] Xcode - develop for iOS and macOS (macOS only)
[✓] Chrome - develop for the web
[!] Android Studio (not installed)
[!] VS Code (not installed)
```

**Don't worry about ❌ or ⚠️ marks yet!** We'll fix them in the next steps.

---

## ✅ Step 2: Verify & Fix Installation (2 minutes)

### Understanding Flutter Doctor Output

```bash
# Run with verbose flag for detailed info
flutter doctor -v
```

### Common Issues & Quick Fixes

#### ❌ Android Licenses Not Accepted

**Error:**
```
[!] Android toolchain
    ✗ Android licenses not accepted
```

**Fix:**
```bash
flutter doctor --android-licenses
# Press 'y' for each license (usually 5-7 licenses)
```

#### ❌ Command Line Tools Not Found

**Error:**
```
[!] Android toolchain
    ✗ cmdline-tools component is missing
```

**Fix:**
```bash
# Option 1: Through Android Studio
# 1. Open Android Studio
# 2. Settings → Appearance & Behavior → System Settings → Android SDK
# 3. Click "SDK Tools" tab
# 4. Check "Android SDK Command-line Tools (latest)"
# 5. Click "Apply"

# Option 2: Through command line (advanced)
sdkmanager "cmdline-tools;latest"
```

#### ⚠️ Android Studio Not Found

**Fix:**
```bash
# Download and install from:
# https://developer.android.com/studio

# After installation, open Android Studio once
# to complete initial setup
```

### Final Verification

```bash
# Check Flutter version
flutter --version

# Ensure no critical errors
flutter doctor

# You should see at least:
# ✓ Flutter
# ✓ Chrome (or other device)
```

---

## 📱 Step 3: Set Up Device (2 minutes)

### Device Setup Flow

```
Choose Platform → Setup Device → Verify Connection → Ready!
```

### Option A: Android Emulator (All Platforms)

**Quick Setup:**

1. **Install Android Studio** (if not already)
   - Download: https://developer.android.com/studio
   - Run installer and follow prompts

2. **Create Virtual Device**
   ```bash
   # Open Android Studio
   # Method 1: Welcome screen → "More Actions" → "Virtual Device Manager"
   # Method 2: Tools → Device Manager
   ```

3. **Configure Emulator**
   - Click "Create Device"
   - Select **Phone** → **Pixel 5** (recommended)
   - Click "Next"
   - Select **API Level 33** (Android 13) or higher
   - Click "Download" if needed
   - Click "Next" → "Finish"

4. **Launch Emulator**
   ```bash
   # Option 1: Through Flutter
   flutter emulators
   flutter emulators --launch <emulator_id>

   # Option 2: Through Android Studio
   # Click ▶️ play button next to your emulator
   ```

5. **Verify Connection**
   ```bash
   flutter devices
   # Should show your emulator
   ```

**Expected Output:**
```
3 connected devices:

sdk gphone64 arm64 (mobile) • emulator-5554 • android-arm64  • Android 13 (API 33)
```

### Option B: iOS Simulator (macOS Only)

**Quick Setup:**

1. **Install Xcode** (if not already)
   ```bash
   # Install from App Store (free)
   # Search for "Xcode"
   # Click "Get" or "Install"
   # Wait... (it's large, ~12GB)
   ```

2. **Accept Xcode License**
   ```bash
   sudo xcodebuild -license accept
   ```

3. **Install Command Line Tools**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

4. **Open Simulator**
   ```bash
   open -a Simulator
   ```

5. **Verify Connection**
   ```bash
   flutter devices
   # Should show iPhone Simulator
   ```

**Expected Output:**
```
2 connected devices:

iPhone 15 (mobile) • <UUID> • ios • iOS 17.0 (simulator)
```

### Option C: Physical Device

#### Android Device

1. **Enable Developer Options**
   - Settings → About phone
   - Tap "Build number" 7 times
   - Go back → Developer options now visible

2. **Enable USB Debugging**
   - Developer options → USB debugging → ON

3. **Connect Device**
   - Connect via USB cable
   - Allow USB debugging prompt on phone
   - Trust this computer

4. **Verify**
   ```bash
   flutter devices
   ```

#### iOS Device (macOS Only)

1. **Connect Device**
   - Connect via USB cable
   - Trust this computer on iPhone

2. **Open Xcode**
   - Window → Devices and Simulators
   - Select your device
   - Click "Use for Development"

3. **Verify**
   ```bash
   flutter devices
   ```

### Option D: Chrome (Web Development)

**Setup:**
```bash
# Enable web support
flutter config --enable-web

# Verify
flutter devices
# Should show Chrome
```

### ✅ Verification Checklist

```bash
# Run this command
flutter devices
```

**You should see at least ONE device:**
- ✅ Android Emulator, OR
- ✅ iOS Simulator, OR
- ✅ Physical Device, OR
- ✅ Chrome Browser

**Example Success:**
```
3 connected devices:

sdk gphone64 arm64 (mobile) • emulator-5554      • android-arm64  • Android 13
macOS (desktop)             • macos              • darwin-arm64   • macOS 14.0
Chrome (web)                • chrome             • web-javascript • Google Chrome 120.0
```

---

## 🎓 Step 4: Access Workshop Materials (1 minute)

### Download Options

#### Option A: Clone Repository (Recommended)

```bash
# 1. Open Terminal/Command Prompt

# 2. Navigate to your projects folder
cd ~/projects  # macOS/Linux
cd C:\projects  # Windows

# 3. Clone the repository
git clone https://github.com/somkheartk/flutter-workshop-2day.git

# 4. Enter the directory
cd flutter-workshop-2day

# 5. Explore the structure
ls -la  # macOS/Linux
dir     # Windows
```

#### Option B: Download ZIP

```bash
# 1. Visit: https://github.com/somkheartk/flutter-workshop-2day
# 2. Click "Code" → "Download ZIP"
# 3. Extract to your projects folder
# 4. Open in Terminal/Command Prompt
```

#### Option C: Fork and Clone

```bash
# 1. Visit: https://github.com/somkheartk/flutter-workshop-2day
# 2. Click "Fork" button (top-right)
# 3. Clone YOUR fork:
git clone https://github.com/YOUR_USERNAME/flutter-workshop-2day.git
```

### 📂 Understanding the Structure

```
flutter-workshop-2day/
├── README.md              ← Start here! Overview and setup
├── QUICKSTART.md          ← You are here! Quick start guide
├── EXAMPLES.md            ← List of all runnable examples
│
├── day1/                  ← Day 1: Fundamentals
│   ├── README.md          ← Day 1 overview
│   ├── session1/          ← Introduction & Setup
│   ├── session2/          ← Dart Basics
│   ├── session3/          ← Widgets & Layouts
│   ├── session4/          ← First Apps
│   └── exercises/         ← Day 1 practice
│
├── day2/                  ← Day 2: Advanced
│   ├── README.md          ← Day 2 overview
│   ├── session1/          ← State Management
│   ├── session2/          ← Navigation
│   ├── session3/          ← API Integration
│   ├── session4/          ← Testing & Deployment
│   └── exercises/         ← Day 2 practice
│
└── resources/             ← Additional resources
    ├── cheatsheet.md      ← Quick reference
    ├── useful_packages.md ← Package recommendations
    └── references.md      ← Learning resources
```

---

## 🏃 Step 5: Run Your First App (1 minute)

### Quick Start Flow

```
Choose Example → Navigate → Install → Run → Success!
```

### Method A: Run Hello Flutter (Counter App)

```bash
# 1. Navigate to the first example
cd day1/session1/example

# 2. Get dependencies
flutter pub get

# 3. Check connected devices
flutter devices

# 4. Run the app!
flutter run

# Or run on specific device:
flutter run -d <device-id>
```

**What Happens:**
1. 🔨 Flutter builds your app
2. 📦 Installs on device/emulator
3. 🚀 Launches the app
4. 🎉 Counter app appears!

**Try These:**
- ➕ Click the + button to increment counter
- Press `r` in terminal → Hot reload (instant changes!)
- Press `R` in terminal → Hot restart (full restart)
- Press `q` to quit

### Method B: Run Dart Examples

```bash
# Navigate to Dart examples
cd day1/session2/examples

# Run each example
dart 01_variables.dart
dart 02_functions.dart
dart 03_classes.dart
dart 04_collections.dart
```

**Expected Output:**
```
// 01_variables.dart output:
Hello, John!
Next year you will be 26
...

// No errors should appear
```

### Method C: Quick Test with Sample Project

```bash
# Create a test project
flutter create my_test_app

# Navigate into it
cd my_test_app

# Run it
flutter run
```

### ✅ Success Indicators

**You're ready when:**
- ✅ App builds without errors
- ✅ App runs on device/emulator
- ✅ You see the Flutter demo app
- ✅ Hot reload works (press 'r')
- ✅ No critical errors in console

**Example Success Output:**
```bash
Launching lib/main.dart on sdk gphone64 arm64 in debug mode...
Running Gradle task 'assembleDebug'...
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app-debug.apk...
Syncing files to device sdk gphone64 arm64...

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

💪 Running with sound null safety 💪

An Observatory debugger and profiler on sdk gphone64 arm64 is available at: http://127.0.0.1:xxxxx/
The Flutter DevTools debugger and profiler on sdk gphone64 arm64 is available at: http://127.0.0.1:xxxxx/
```

---

## 📚 Step 6: Choose Your Learning Path

### 🎯 Three Learning Approaches

```
Path A: Structured        Path B: Explorer         Path C: Project-First
(Recommended for          (For experienced         (For hands-on learners)
 beginners)               programmers)
     ↓                         ↓                         ↓
Follow Day 1 → Day 2     Jump to topics          Build projects,
in sequence              of interest             learn as needed
```

### 🚶 Path A: Structured Learning (Recommended)

**Best for:** Complete beginners, workshop participants

**Steps:**
```bash
# 1. Start with Day 1
cd day1

# 2. Read the overview
cat README.md

# 3. Follow sessions in order
cd session1
cat README.md
cd example
flutter run

# 4. Complete exercises
cd ../exercises

# 5. Move to next session
cd ../../session2
```

**Daily Schedule:**
```
Day 1 (8 hours):
├─ Session 1: Setup (1.5h)
├─ Session 2: Dart (1.25h)
├─ Session 3: Widgets (2h)
└─ Session 4: First App (1.75h)

Day 2 (8 hours):
├─ Session 1: State Mgmt (1.5h)
├─ Session 2: Navigation (1.25h)
├─ Session 3: API (2h)
└─ Session 4: Deployment (1.75h)
```

### 🏃 Path B: Topic Explorer

**Best for:** Developers familiar with mobile development

**Jump to Topics:**
```bash
# State Management
cd day2/session1
cat README.md

# API Integration
cd ../session3
cat README.md

# Testing
cd ../session4
cat README.md
```

**Topic Map:**
- 🎨 **UI/UX** → day1/session3, day1/session4
- 🔄 **State Management** → day2/session1
- 🗺️ **Navigation** → day2/session2
- 🌐 **APIs** → day2/session3
- ✅ **Testing** → day2/session4

### 🎮 Path C: Project-First Learning

**Best for:** Hands-on learners who learn by doing

**Start with Projects:**
```bash
# 1. Simple: Counter App
cd day1/session4/examples/counter_app
flutter pub get
flutter run

# 2. Medium: Todo List
cd ../../todo_list
flutter pub get
flutter run

# 3. Advanced: Shopping Cart
cd ../../../../day2/session1/example
flutter pub get
flutter run

# 4. Complex: API Integration
cd ../../session3/example
flutter pub get
flutter run
```

**Learn as you go:**
- 📖 Read code comments
- 🔍 Look up unfamiliar concepts
- 🛠️ Modify and experiment
- 📚 Reference docs when stuck

---

## 🎯 Learning Tips

### For Maximum Effectiveness:

#### 1. Active Learning
```bash
# Don't just read - TYPE the code!
# ❌ Copy-paste
# ✅ Type manually

# Benefits:
# - Better retention
# - Muscle memory
# - Catch typos early
# - Understand syntax
```

#### 2. Experiment Freely
```bash
# After running an example:
# 1. Change colors
# 2. Modify text
# 3. Add new widgets
# 4. Break things (on purpose!)
# 5. Fix them!

# Use Hot Reload (r) to see changes instantly
```

#### 3. Use Hot Reload Effectively
```dart
// Make a change in your code
// Don't stop the app!
// Just press 'r' in terminal
// See changes immediately! 🔥

// Example:
Text('Hello')  // Save and press 'r'
Text('Hi!')    // See instant change!
```

#### 4. Read Error Messages
```bash
# Errors are your friends!
# They tell you exactly what's wrong

# Example error:
# "Undefined name 'MyWidget'"
# ↓
# Fix: Check spelling, import file

# Don't ignore warnings either!
```

#### 5. Use Developer Tools
```bash
# Open DevTools while app is running
# - Widget Inspector: See widget tree
# - Performance: Check app performance
# - Network: Monitor API calls
# - Logging: View debug messages

# Access via the link shown when you run:
# "Flutter DevTools debugger... at: http://..."
```

---

## 🆘 Quick Troubleshooting

### App won't run?

```bash
# Try this sequence:
flutter clean
flutter pub get
flutter run

# Still stuck?
flutter doctor -v
# Fix any ✗ or ⚠️ issues shown
```

### Can't see device?

```bash
# Check devices:
flutter devices

# No devices?
# - Start emulator
# - Connect physical device
# - Enable web: flutter config --enable-web
```

### Hot reload not working?

```bash
# Try hot restart instead:
# Press 'R' (capital R)

# If still stuck:
# Stop app (q)
# Run again: flutter run
```

### Build errors?

```bash
# Clean and rebuild:
flutter clean
rm -rf pubspec.lock  # Remove lock file
flutter pub get
flutter run
```

### Code formatting issues?

```bash
# Auto-format your code:
flutter format .

# Run analyzer:
flutter analyze
```

---

## ✅ Final Checklist

Before starting the workshop, confirm:

- [ ] ✅ Flutter installed (`flutter --version` works)
- [ ] ✅ No critical errors in `flutter doctor`
- [ ] ✅ At least one device available (`flutter devices`)
- [ ] ✅ Repository cloned and accessible
- [ ] ✅ Can run example app successfully
- [ ] ✅ Hot reload works (tested)
- [ ] ✅ IDE configured (VS Code or Android Studio)
- [ ] ✅ Understand basic terminal commands

**All checked?** 🎉 **You're ready to start learning!**

---

## 💡 Tips

### Development Best Practices

#### Hot Reload Magic 🔥
```bash
# While app is running:
r  → Hot reload (keeps state)
R  → Hot restart (resets state)
h  → Show all commands
q  → Quit app
```

**When to use each:**
- `r` (hot reload): UI changes, text updates, styling
- `R` (hot restart): Logic changes, new classes, initialization
- Full restart: New packages, asset changes

#### Code Organization
```dart
// ✅ Good: Clear, organized
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  
  Widget _buildAppBar() { /* ... */ }
  Widget _buildBody() { /* ... */ }
}

// ❌ Avoid: Everything in one place
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/* 50 lines */),
      body: Column(/* 200 lines */),
    );
  }
}
```

#### Useful Commands Reference
```bash
# Project Management
flutter create <app_name>    # Create new project
flutter pub get              # Install dependencies
flutter pub upgrade          # Update dependencies
flutter clean                # Clean build files

# Development
flutter run                  # Run in debug mode
flutter run --release        # Run in release mode
flutter run -d <device>      # Run on specific device
flutter run -v               # Verbose output

# Code Quality
flutter analyze              # Check code issues
flutter format .             # Format code
flutter test                 # Run tests
flutter test --coverage      # With coverage

# Building
flutter build apk            # Build Android APK
flutter build appbundle      # Build Android AAB
flutter build ios            # Build iOS (macOS only)
flutter build web            # Build for web

# Information
flutter doctor               # Check setup
flutter doctor -v            # Verbose doctor
flutter devices              # List devices
flutter emulators            # List emulators
flutter --version            # Flutter version
```

#### Common Keyboard Shortcuts

**VS Code:**
```
Cmd/Ctrl + .        → Quick fixes
Cmd/Ctrl + Space    → Autocomplete
Cmd/Ctrl + Click    → Go to definition
Cmd/Ctrl + Shift+F  → Format document
Cmd/Ctrl + /        → Comment/uncomment
F5                  → Start debugging
```

**Android Studio:**
```
Alt + Enter         → Quick fixes
Ctrl + Space        → Autocomplete
Ctrl + Click        → Go to definition
Cmd/Ctrl + Alt + L  → Format code
Cmd/Ctrl + /        → Comment/uncomment
Shift + F10         → Run app
```

---

## 🆘 Troubleshooting

### Common Issues and Solutions

#### Problem: "flutter: command not found"

**Cause:** Flutter not in PATH

**Solution:**
```bash
# macOS/Linux - Add to ~/.zshrc or ~/.bashrc
export PATH="$PATH:$HOME/development/flutter/bin"
source ~/.zshrc  # or ~/.bashrc

# Windows - Add to Environment Variables
# 1. Win + R → sysdm.cpl
# 2. Environment Variables → Path → Edit
# 3. Add: C:\src\flutter\bin
# 4. Restart terminal
```

#### Problem: "Waiting for another flutter command"

**Cause:** Flutter lock file stuck

**Solution:**
```bash
# Remove lock file
rm ~/.flutter-devtools/.pid
# or
rm $FLUTTER_ROOT/bin/cache/lockfile

# Then try again
flutter run
```

#### Problem: "Unable to locate Android SDK"

**Cause:** Android SDK not configured

**Solution:**
```bash
# Set Android SDK location
flutter config --android-sdk /path/to/android-sdk

# Or install Android Studio
# It includes Android SDK
```

#### Problem: Build fails with Gradle error

**Cause:** Gradle cache or version issues

**Solution:**
```bash
# Clean everything
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get

# Then run
flutter run
```

#### Problem: iOS build fails (macOS)

**Cause:** CocoaPods or Xcode issues

**Solution:**
```bash
# Update CocoaPods
cd ios
pod repo update
pod install
cd ..

# Or reinstall pods
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..

# Accept Xcode license
sudo xcodebuild -license accept
```

#### Problem: Hot reload doesn't work

**Cause:** Code changes too complex

**Solution:**
```bash
# Try hot restart (capital R)
R

# If still doesn't work:
q  # Quit
flutter run  # Run again
```

#### Problem: Emulator is very slow

**Solutions:**

**1. Allocate more RAM:**
```bash
# Android Studio → AVD Manager
# Edit emulator → Advanced Settings
# RAM: 4GB+ (if you have 16GB system RAM)
# VM heap: 512MB+
```

**2. Enable Hardware Acceleration:**
```bash
# Windows: Enable Hyper-V or HAXM
# macOS: No action needed (already enabled)
# Linux: Install KVM

# Verify:
flutter emulators -v
```

**3. Use simpler device:**
```bash
# Create emulator with:
# - Lower API level (API 28-30)
# - Fewer pixels (720x1280)
# - Less RAM (2-4GB)
```

#### Problem: App crashes on startup

**Debugging steps:**
```bash
# 1. Check logs
flutter run -v

# 2. Look for red errors in console

# 3. Common causes:
# - Missing permissions in AndroidManifest.xml
# - Assets not registered in pubspec.yaml
# - Null safety violations
# - Missing dependencies

# 4. Clean and rebuild
flutter clean
flutter pub get
flutter run
```

#### Problem: "Could not resolve all dependencies"

**Cause:** Package version conflicts

**Solution:**
```bash
# Update dependencies
flutter pub upgrade

# Or specify compatible versions in pubspec.yaml
# Then:
flutter pub get
```

#### Problem: White screen on iOS

**Cause:** Missing splash screen or assets

**Solution:**
```bash
# Check Info.plist
# Make sure LaunchScreen.storyboard exists
# in ios/Runner/

# Or regenerate
flutter create .
```

---

## 📞 Get Help

### If you're still stuck:

#### 1. Search First 🔍
```bash
# Google your error message
# Example: "flutter gradle task assembledebug failed"

# Check Stack Overflow
# Tag: flutter, dart
```

#### 2. Community Resources 🤝

**Official Channels:**
- 📚 [Flutter Docs](https://docs.flutter.dev/)
- 💬 [Flutter Discord](https://discord.gg/flutter)
- 🐦 [Flutter Twitter](https://twitter.com/FlutterDev)
- 📺 [Flutter YouTube](https://www.youtube.com/c/flutterdev)

**Community Forums:**
- 💻 [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)
- 🗨️ [Reddit r/FlutterDev](https://reddit.com/r/FlutterDev)
- 💬 [Flutter Community Medium](https://medium.com/flutter-community)

#### 3. Workshop Support 🎓

During the workshop:
- ❓ Ask your instructor
- 🤝 Work with a partner
- 💡 Check EXAMPLES.md for working code
- 📖 Review session README files

#### 4. Report Issues 🐛

If you find bugs in workshop materials:
1. Go to: https://github.com/somkheartk/flutter-workshop-2day/issues
2. Click "New Issue"
3. Describe the problem
4. Include:
   - What you were trying to do
   - Error messages
   - Flutter version (`flutter --version`)
   - Operating system

---

## 🎯 Next Steps

### After Setup:

**1. Quick Test** (5 minutes)
```bash
# Navigate to repository
cd flutter-workshop-2day

# Run first example
cd day1/session1/example
flutter pub get
flutter run
```

**2. Explore Examples** (10 minutes)
```bash
# See all examples
cat EXAMPLES.md

# Try different examples
cd day1/session4/examples/counter_app
flutter run
```

**3. Start Learning!** (Go to Day 1)
```bash
cd day1
cat README.md
cd session1
```

---

## ✨ You're All Set!

### Summary of What You've Done:

- ✅ Installed Flutter SDK
- ✅ Verified installation with `flutter doctor`
- ✅ Set up development device (emulator/simulator/physical)
- ✅ Cloned workshop repository
- ✅ Ran your first Flutter app
- ✅ Know where to get help

### Ready to Learn Flutter? 🚀

**Choose your next step:**

1. 📖 **Read the Full README**: `cat README.md`
2. 🚶 **Start Day 1**: [Go to Day 1 →](./day1/README.md)
3. 🏃 **Jump to Examples**: `cat EXAMPLES.md`
4. 🎮 **Explore Projects**: Browse day1/session4/examples/

---

**Happy Coding! 🎉**

Questions? Issues? → [Open an Issue](https://github.com/somkheartk/flutter-workshop-2day/issues)

**Let's build amazing Flutter apps together!** 💙
