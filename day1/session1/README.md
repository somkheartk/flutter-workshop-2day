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

> 💡 **Basic Knowledge**: Think of Flutter as a complete toolkit that contains everything you need to build beautiful apps. Just like a carpenter has a toolbox with different tools, Flutter provides you with ready-to-use components (called "widgets") to build your app's user interface.

### Key Features

- **Fast Development**: Hot reload helps you quickly experiment and build UIs
  - 💡 Hot reload means you can see changes instantly without restarting your app
- **Beautiful UIs**: Rich set of customizable widgets
  - 💡 Widgets are like building blocks - buttons, text, images that you combine
- **Native Performance**: Compiled to native ARM code
  - 💡 Your app runs as fast as apps built specifically for each platform
- **Single Codebase**: Write once, deploy to iOS, Android, Web, and Desktop
  - 💡 Write your code once, and it works on phones, tablets, web browsers, and computers!

### Flutter Architecture

> 📚 **Understanding the Layers**: Flutter is built in layers, like a cake. Each layer has a specific job:

```
┌─────────────────────────────────────┐
│         Your App Code               │ ← This is where YOU write code
│           (Dart)                    │   using the Dart language
├─────────────────────────────────────┤
│        Flutter Framework            │ ← Pre-built components (widgets)
│       (Widgets, Rendering)          │   that you use in your code
├─────────────────────────────────────┤
│         Flutter Engine              │ ← The "brain" that makes
│      (Skia, Dart Runtime)           │   everything work and draw on screen
├─────────────────────────────────────┤
│    Platform (iOS/Android/Web)       │ ← The actual device/OS
└─────────────────────────────────────┘   where your app runs
```

**What this means for you:**
- You only work with the top layer (Your App Code)
- Flutter handles all the complex stuff below
- Your code automatically works on all platforms

### Why Choose Flutter?

✅ **Single codebase** for multiple platforms
✅ **Hot reload** for fast iteration (see changes in <1 second!)
✅ **Rich widget library** (100+ pre-built UI components)
✅ **High performance** (60fps animations by default)
✅ **Strong community** and ecosystem (1000s of packages available)
✅ **Backed by Google** (used in Google Ads, Alibaba, BMW apps)

---

## 2. Development Environment Setup

> 🎯 **Goal**: By the end of this section, you'll have Flutter fully installed and ready to create apps!

### Before You Start

> 📋 **Pre-flight Checklist**: Make sure you have:
> - A computer with at least 8GB RAM (16GB recommended)
> - At least 10GB of free disk space
> - A stable internet connection (for downloading)
> - Administrator access to install software

### System Requirements

**Windows:**
- Operating Systems: Windows 10 or later (64-bit)
- Disk Space: 2.5 GB (for Flutter SDK alone)
- Tools: Git for Windows, PowerShell 5.0 or newer

**macOS:**
- Operating Systems: macOS 10.14 or later
- Disk Space: 2.5 GB (for Flutter SDK alone)
- Tools: Xcode (for iOS development)

**Linux:**
- Operating Systems: 64-bit distribution
- Disk Space: 600 MB (for Flutter SDK alone)
- Tools: bash, curl, git, mkdir, rm, unzip, which, xz-utils

> 💡 **Tip**: The total space needed including Android Studio, emulators, and tools can be 15-20GB.

---

## 📝 Step-by-Step Installation Guide

> ⏱️ **Time Required**: 30-45 minutes (depending on internet speed)

### Install Flutter SDK

### Install Flutter SDK

> 🎓 **What is an SDK?**: SDK stands for "Software Development Kit". It's a collection of tools, libraries, and documentation that you need to build apps. Think of it as getting all the ingredients and utensils before cooking.

Choose your operating system and follow the steps:

#### macOS

**Step 1: Choose Installation Method**

> 💡 We recommend Homebrew (Option 1) for beginners - it's simpler and handles updates automatically.

**Option 1: Using Homebrew (Recommended for Beginners)**

```bash
# Step 1.1: Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Step 1.2: Install Flutter
brew install flutter

# Step 1.3: Verify installation
flutter --version
```

**✅ Expected Output:**
```
Flutter 3.x.x • channel stable • https://github.com/flutter/flutter.git
Framework • revision xxxxx
Engine • revision xxxxx
Tools • Dart 3.x.x
```

**Option 2: Manual Installation**

```bash
# Step 1: Create a development folder
mkdir -p ~/development
cd ~/development

# Step 2: Download Flutter SDK (this may take 5-10 minutes)
git clone https://github.com/flutter/flutter.git -b stable

# Step 3: Add Flutter to PATH temporarily (for this terminal session)
export PATH="$PATH:$HOME/development/flutter/bin"

# Step 4: Make it permanent - add to your shell profile
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc

# Step 5: Reload your configuration
source ~/.zshrc

# Step 6: Verify installation
flutter --version
```

> 📚 **What you just did:**
> - Created a folder for development tools
> - Downloaded Flutter's source code
> - Added Flutter commands to your system PATH (so your computer knows where to find Flutter)
> - Verified everything works

#### Windows

**Step-by-Step Installation:**

**Step 1: Download Flutter**
1. Visit: https://docs.flutter.dev/get-started/install/windows
2. Click "Download Flutter SDK" button
3. Save the zip file (approximately 1.5 GB)

> ⏱️ This may take 5-15 minutes depending on your internet speed.

**Step 2: Extract Flutter**
1. Create a folder: `C:\src` (avoid folders with spaces or special characters)
2. Extract the downloaded zip file to `C:\src`
3. You should now have: `C:\src\flutter`

> ⚠️ **Important**: Don't put Flutter in `C:\Program Files` - it needs write access!

**Step 3: Add Flutter to PATH**
1. Press `Windows key` and search for "**Environment Variables**"
2. Click "**Edit the system environment variables**"
3. Click "**Environment Variables...**" button
4. Under "**User variables**", find "**Path**" and click "**Edit**"
5. Click "**New**" and add: `C:\src\flutter\bin`
6. Click "**OK**" on all dialogs

> 📚 **What is PATH?**: PATH tells your computer where to look for programs. By adding Flutter to PATH, you can run Flutter commands from anywhere in your terminal.

**Step 4: Verify Installation**
1. Open a **NEW** Command Prompt (important - old ones won't see PATH changes)
2. Run:
   ```cmd
   flutter --version
   ```

**✅ Expected Output:**
```
Flutter 3.x.x • channel stable
Framework • revision xxxxx
Engine • revision xxxxx
Tools • Dart 3.x.x
```

#### Linux

```bash
# Step 1: Install required dependencies
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Step 2: Create development folder
mkdir -p ~/development
cd ~/development

# Step 3: Download Flutter (this may take 5-10 minutes)
git clone https://github.com/flutter/flutter.git -b stable

# Step 4: Add Flutter to PATH
export PATH="$PATH:$HOME/development/flutter/bin"

# Step 5: Make it permanent
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bashrc

# Step 6: Reload configuration
source ~/.bashrc

# Step 7: Verify installation
flutter --version
```

**✅ Verification Success:**
If you see a Flutter version number, congratulations! Flutter is installed. 🎉

**❌ If you get an error:**
- Make sure you opened a NEW terminal window
- Double-check that Flutter is in your PATH
- Try running: `echo $PATH` (Mac/Linux) or `echo %PATH%` (Windows) to see if Flutter is listed

### Run Flutter Doctor

> 🏥 **What is Flutter Doctor?**: It's a diagnostic tool that checks if everything is installed correctly. Think of it as a health check for your development environment.

**Step 1: Run the Doctor**

```bash
flutter doctor
```

> ⏱️ First run may take 1-2 minutes as Flutter downloads additional components.

**Step 2: Understanding the Output**

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

**Understanding the Symbols:**
- `[✓]` = Everything is good! ✅
- `[✗]` = Something is missing (needs to be fixed) ❌
- `[!]` = Partial installation (may work but not optimal) ⚠️

**Step 3: What to Do About Issues**

> 📋 **Common Issues and Solutions:**

**Issue 1: Android toolchain not found**
```bash
# Solution: Accept Android licenses
flutter doctor --android-licenses
# Type 'y' and press Enter for each license
```

**Issue 2: Android Studio not found**
- Download from: https://developer.android.com/studio
- Install Android Studio
- Run `flutter doctor` again

**Issue 3: Command line tools not available**
1. Open Android Studio
2. Go to: Settings → Appearance & Behavior → System Settings → Android SDK
3. Click "SDK Tools" tab
4. Check ☑ "Android SDK Command-line Tools"
5. Click "Apply" and wait for installation

**Issue 4: Xcode not found (macOS only)**
- Install Xcode from Mac App Store
- Open Xcode once to accept license
- Run:
  ```bash
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch
  ```

> 💡 **Pro Tip**: You don't need ALL checkmarks to start learning! As long as you have:
> - ✓ Flutter
> - ✓ One platform (Android OR iOS OR Web)
> 
> You can start building apps!

### Install Android Studio

> 🎓 **Why Android Studio?**: Even if you use VS Code to write code, Android Studio provides essential tools for Android development (emulators, SDK, build tools).

**Step 1: Download**
1. Visit: https://developer.android.com/studio
2. Click "Download Android Studio"
3. Accept the terms and download (size: ~1 GB)

> ⏱️ Download time: 5-20 minutes depending on internet speed.

**Step 2: Install**
1. Run the installer
2. Follow the setup wizard
3. Choose "Standard" installation (recommended)
4. Wait for additional components to download (SDK, emulator, etc.)

> ⏱️ Installation time: 10-20 minutes.

**Step 3: Install Flutter Plugin**
1. Open Android Studio
2. Navigate to:
   - **Windows/Linux**: File → Settings → Plugins
   - **macOS**: Android Studio → Preferences → Plugins
3. Click "**Marketplace**" tab
4. Search for "**Flutter**"
5. Click "**Install**"
6. When prompted, also install "**Dart**" plugin (it's included automatically)
7. Click "**Restart IDE**"

> 📚 **What you just did:**
> - Installed Android Studio (provides Android development tools)
> - Added Flutter plugin (so Android Studio understands Flutter projects)
> - Added Dart plugin (so it understands Dart code)

**Step 4: Verify Setup**
1. Restart Android Studio
2. You should see "**Start a new Flutter project**" option on the welcome screen
3. If you see it, you're all set! ✅

### Install VS Code (Alternative - Lighter & Faster)

> 💡 **VS Code vs Android Studio**: 
> - VS Code: Lightweight, fast, simple (recommended for beginners)
> - Android Studio: More features, heavier, better for complex Android work
> - You can use both!

**Step 1: Download & Install**
1. Visit: https://code.visualstudio.com/
2. Download for your operating system
3. Install (very quick, ~1 minute)

**Step 2: Install Flutter Extension**
1. Open VS Code
2. Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (macOS)
   - This opens the Extensions panel
3. Search for "**Flutter**"
4. Click "**Install**" on the official Flutter extension (by Dart Code)
   - This automatically includes Dart support too!

**Step 3: Verify Installation**
1. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (macOS)
   - This opens the Command Palette
2. Type "**Flutter**"
3. You should see Flutter commands like "Flutter: New Project"

**✅ Success**: If you see Flutter commands, you're ready to code!

### Set Up Android Emulator

> 🎓 **What is an Emulator?**: An emulator is a virtual phone that runs on your computer. It lets you test your apps without needing a real device!

**Why you need this**: You need a place to run and test your Flutter apps.

**Step 1: Open Device Manager**

**Via Android Studio:**
1. Open Android Studio
2. Click **Tools** menu → **Device Manager** (or **AVD Manager** in older versions)
   - AVD = Android Virtual Device

**Step 2: Create Your First Virtual Device**

1. Click **"Create Device"** button (the + icon)

2. **Choose a device:**
   - Select **"Phone"** category
   - Recommended: **Pixel 5** or **Pixel 7** (good balance of features and performance)
   - Click **"Next"**

3. **Download a system image:**
   - Look for **API Level 33** (Android 13) or **API Level 34** (Android 14)
   - Click the **"Download"** link next to it
   - Wait for download (~1-2 GB, may take 10-30 minutes)
   - Click **"Next"** after download completes

4. **Configure the AVD:**
   - Give it a name (e.g., "Pixel_5_API_33")
   - Check "Show Advanced Settings" if you want to adjust:
     - RAM: 2GB minimum, 4GB recommended
     - VM heap: 256MB minimum
     - Internal storage: 2GB minimum
   - Click **"Finish"**

> 📚 **What you just did:**
> - Created a virtual Android device on your computer
> - Downloaded Android OS for that virtual device
> - Configured its specifications (like buying a new phone!)

**Step 3: Test Your Emulator**

**Option 1: Start from Android Studio**
1. In Device Manager, find your created device
2. Click the **"Play"** (▶) button
3. Wait for emulator to start (first time takes 1-3 minutes)
4. You should see an Android home screen!

**Option 2: Start from Command Line**

```bash
# List available emulators
flutter emulators

# You should see something like:
# 2 available emulators:
# Pixel_5_API_33 • Pixel 5 API 33 • Google • android

# Launch your emulator
flutter emulators --launch Pixel_5_API_33
```

**Step 4: Verify Connection**

```bash
# Check if Flutter detects your emulator
flutter devices
```

**✅ Expected Output:**
```
2 connected devices:

sdk gphone64 arm64 (mobile) • emulator-5554 • android-arm64  • Android 13 (API 33)
Chrome (web)                • chrome        • web-javascript • Google Chrome 120.0
```

> 💡 **Troubleshooting**:
> - **Emulator is slow**: 
>   - Make sure you have at least 8GB RAM
>   - Close other heavy programs
>   - Enable virtualization in BIOS (VT-x for Intel, AMD-V for AMD)
> - **Can't start emulator**:
>   - Check if you have enough disk space
>   - Try creating a new device with lower specs

**Check available devices:**
```bash
flutter emulators        # List available emulators
flutter devices          # List currently running devices
```

### Set Up iOS Simulator (macOS only)

> 🍎 **Note**: iOS development is only possible on macOS (Apple's requirement).

**Step 1: Install Xcode**
1. Open **App Store** on your Mac
2. Search for "**Xcode**"
3. Click "**Get**" or "**Install**" (size: ~12 GB)
4. Wait for installation (can take 30-60 minutes)

> ⏱️ This is a large download! Good time for a break. ☕

**Step 2: Accept License and Setup**

```bash
# Open Xcode once to accept license agreement
open /Applications/Xcode.app

# Or accept via command line:
sudo xcodebuild -license accept

# Install Command Line Tools
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

> 📚 **What you just did:**
> - Installed Apple's development tools
> - Accepted the legal agreement
> - Set up command-line tools for building iOS apps

**Step 3: Open iOS Simulator**

**Option 1: Via Command**
```bash
# Open iOS Simulator
open -a Simulator

# You should see an iPhone simulator appear!
```

**Option 2: Via Xcode**
1. Open Xcode
2. Menu: **Xcode → Open Developer Tool → Simulator**

**Step 4: Verify Connection**

```bash
# Check if Flutter detects your simulator
flutter devices
```

**✅ Expected Output:**
```
3 connected devices:

iPhone 15 Pro (mobile)   • XXXXXXXX-... • ios • iOS 17.x
macOS (desktop)          • macos        • darwin-arm64 • macOS 14.0
Chrome (web)             • chrome       • web-javascript • Chrome 120.0
```

> 💡 **Tip**: You can test different iPhone models by going to:
> Simulator → File → Open Simulator → [Choose Model]

---

## 3. Creating Your First Flutter Project

> 🎉 **Exciting moment!** You're about to create your first Flutter app!

### Step 1: Choose a Location for Your Projects

> 💡 **Best Practice**: Create a dedicated folder for all your Flutter projects.

```bash
# Create a projects folder (choose ONE based on your OS)

# macOS/Linux:
mkdir -p ~/projects
cd ~/projects

# Windows:
# mkdir C:\projects
# cd C:\projects
```

### Step 2: Create the Project

```bash
# Create a new Flutter project named 'hello_flutter'
flutter create hello_flutter
```

> ⏱️ This takes 20-60 seconds. Flutter is creating all necessary files!

**✅ What you should see:**
```
Creating project hello_flutter...
  hello_flutter/android (created)
  hello_flutter/ios (created)
  hello_flutter/lib (created)
  hello_flutter/test (created)
Running "flutter pub get" in hello_flutter...
Wrote 127 files.

All done!
```

**📚 What just happened:**
- Flutter created a complete app template
- Downloaded necessary dependencies
- Set up Android and iOS projects
- Created your first Dart code file

### Step 3: Navigate to Your Project

```bash
# Move into the project directory
cd hello_flutter

# Look at the files created
ls    # macOS/Linux
dir   # Windows
```

### Understanding Project Structure

> 🗂️ **Your project structure explained:**

```
hello_flutter/
├── android/          # Android-specific code and configuration
│                     # (You rarely need to touch this)
├── ios/              # iOS-specific code and configuration
│                     # (You rarely need to touch this either)
├── lib/              # ⭐ YOUR CODE GOES HERE! ⭐
│   └── main.dart     # The main entry point of your app
├── test/             # Test files (for testing your code)
├── pubspec.yaml      # ⭐ Project configuration & dependencies
│                     # (Like package.json in Node.js or requirements.txt in Python)
├── pubspec.lock      # Auto-generated, don't edit
├── README.md         # Project documentation
└── .gitignore        # Git configuration
```

> 💡 **Focus on these two:**
> - `lib/main.dart` - Where you write your app code
> - `pubspec.yaml` - Where you add packages/dependencies

### Understanding Key Files

#### 📄 pubspec.yaml (Project Configuration)

> 🎓 **What is pubspec.yaml?**: This is your project's configuration file. Think of it as a recipe that lists all the ingredients (packages) your app needs.

```yaml
name: hello_flutter        # Your app's name
description: A new Flutter project.

# What your app needs to run:
dependencies:
  flutter:
    sdk: flutter           # Flutter framework itself
  cupertino_icons: ^1.0.2  # iOS-style icons

# Tools for development only:
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0    # Code quality checker

# Flutter-specific settings:
flutter:
  uses-material-design: true  # Use Material Design widgets
```

> 📚 **Key sections:**
> - **dependencies**: Packages your app needs (like npm packages or pip packages)
> - **dev_dependencies**: Tools used during development only
> - **flutter**: Flutter-specific configuration

#### 📄 lib/main.dart (Your App Code)

> 🎓 **This is the heart of your app!** Every Flutter app starts here.

```dart
import 'package:flutter/material.dart';  // Import Flutter's UI toolkit

void main() {
  runApp(const MyApp());  // Start the app
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

**📚 Understanding the code:**

1. `import 'package:flutter/material.dart';`
   - Brings in Flutter's Material Design widgets
   - Like `#include` in C++ or `import` in Python

2. `void main() { runApp(const MyApp()); }`
   - The starting point of every app
   - Tells Flutter to run your app

3. `MyApp extends StatelessWidget`
   - Your app is a widget (everything in Flutter is!)
   - "Stateless" means it doesn't change over time

4. `build()` method
   - Defines what your widget looks like
   - Returns other widgets

> 💡 **Don't worry if this seems complex!** We'll learn each part step by step. For now, just know this is the template every Flutter app starts with.

---

## 4. Running Your First App

> 🚀 **The moment of truth!** Let's see your app in action!

### Step 1: Start a Device

> ⚠️ **Important**: You MUST have a device running before you can run your app!

**Option A: Use an Emulator**

```bash
# List available emulators
flutter emulators

# Launch one (replace with your emulator name)
flutter emulators --launch Pixel_5_API_33
```

**Option B: Use iOS Simulator (macOS only)**

```bash
# Open iOS Simulator
open -a Simulator
```

**Option C: Use Chrome (for Web)**

```bash
# Chrome should auto-start, or just have Chrome open
```

**Check if device is ready:**
```bash
flutter devices
```

**✅ You should see at least one device listed!**

### Step 2: Run Your App

> 🎯 **Make sure you're in your project directory!**

```bash
# Verify you're in the right place
pwd         # macOS/Linux - should show .../hello_flutter
cd          # Windows - should show ...\hello_flutter

# Run the app!
flutter run
```

> ⏱️ **First run takes 2-5 minutes** (building everything from scratch)
> ⏱️ **Subsequent runs**: 10-30 seconds (much faster!)

**What you'll see in the terminal:**

```bash
Launching lib/main.dart on sdk gphone64 arm64 in debug mode...
Running Gradle task 'assembleDebug'...
✓ Built build/app/outputs/flutter-apk/app-debug.apk.
Installing build/app/outputs/flutter-apk/app-debug.apk...
Syncing files to device sdk gphone64 arm64...

Flutter run key commands.
r Hot reload. 
R Hot restart.
h List all available interactive commands.
q Quit (terminate the application on the device).

An Observatory debugger and profiler on sdk gphone64 arm64 is available at:
http://127.0.0.1:xxxxx/

The Flutter DevTools debugger and profiler on sdk gphone64 arm64 is available at:
http://127.0.0.1:xxxxx/

Running with sound null safety 
```

**What you'll see on your device:**

🎉 **A blue screen with:**
- "You have pushed the button this many times:"
- A number (starting at 0)
- A blue floating action button (+) in the bottom-right

**✅ Congratulations!** You just ran your first Flutter app! 🎊

### Step 3: Try the App

1. **Click the + button** - Watch the counter increase!
2. **Click multiple times** - See the number go up!

> 📚 **What you're seeing:**
> - This is a simple "counter app"
> - Each tap increases the number
> - This demonstrates basic interactivity in Flutter

### Step 4: Experience Hot Reload (Flutter's Superpower!)

> 🔥 **Hot Reload** is Flutter's killer feature - see code changes instantly!

**Try this experiment:**

1. **Keep the app running** (don't close it!)

2. **Open `lib/main.dart` in your editor**

3. **Find this line** (around line 97):
   ```dart
   theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
   ```

4. **Change the color:**
   ```dart
   theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
   ```

5. **Save the file** (Ctrl+S or Cmd+S)

6. **In your terminal, press `r`**

7. **Watch the magic!** Your app's color instantly changes! ✨

> 🎉 **You just experienced hot reload!**
> - No need to restart the app
> - Changes appear in < 1 second
> - State is preserved (counter number stays the same)

**Other keyboard shortcuts while app is running:**

```
r  - Hot reload (apply code changes)
R  - Hot restart (restart app from beginning)
h  - Help (show all commands)
q  - Quit (stop the app)
```

### Step 5: Try More Changes

**Experiment with these changes (save and press 'r' after each):**

**Change 1: App Title**
```dart
// Find this line:
title: 'Flutter Demo Home Page',

// Change to:
title: 'My First Flutter App!',
```

**Change 2: Increment Amount**
```dart
// Find this line (around line 107):
_counter++;

// Change to:
_counter += 5;  // Now it increases by 5!
```

**Change 3: Button Icon**
```dart
// Find this line (around line 118):
child: const Icon(Icons.add),

// Change to:
child: const Icon(Icons.favorite),  // A heart icon!
```

> 💡 **Play around!** This is how you learn. Try things, break things, fix things!

### Running on a Specific Device

If you have multiple devices (emulator + simulator + chrome), choose one:

```bash
# List devices with their IDs
flutter devices

# Run on a specific device
flutter run -d chrome           # Run on Chrome
flutter run -d emulator-5554    # Run on Android emulator
flutter run -d <device-id>      # Run on any device by ID
```

### Running in Different Modes

```bash
# Debug mode (default) - with hot reload
flutter run

# Profile mode - performance testing
flutter run --profile

# Release mode - optimized, fastest (no hot reload)
flutter run --release
```

> 💡 **Use debug mode** while developing (hot reload!)
> 💡 **Use release mode** to test final performance

### VS Code Run Configuration (Alternative Method)

> 💡 **Visual way to run your app** - great for beginners!

**Step 1: Open Project in VS Code**
```bash
# From terminal in your project directory:
code .       # Opens current directory in VS Code
```

**Step 2: Run the App**
1. Press `F5` (or click Run → Start Debugging)
2. If prompted, select "**Dart & Flutter**"
3. Choose your device from the dropdown
4. App starts running!

**Step 3: Use VS Code Controls**
- 🔄 Hot reload: Click the lightning bolt icon or press `Ctrl+F5`
- 🔁 Hot restart: Click the circular arrow icon
- ⏹️ Stop: Click the red square icon

> 💡 **Tip**: VS Code shows a nice device selector at the bottom right. Click it to switch devices easily!

---

## 💻 Hands-on Exercises

> 🎯 **Time to practice!** Complete these exercises to reinforce your learning.

### Exercise 1: Setup Verification ✅

**Goal**: Verify your complete Flutter setup

**Steps to complete:**

1. **Run Flutter Doctor**
   ```bash
   flutter doctor
   ```
   - ✓ Flutter should have a checkmark
   - ✓ At least one platform (Android/iOS/Web) should work
   - ✓ At least one IDE (VS Code/Android Studio) should be detected

2. **Create a new project**
   ```bash
   cd ~/projects  # or your projects folder
   flutter create my_first_app
   cd my_first_app
   ```

3. **Run the project**
   ```bash
   # Start your emulator/simulator first!
   flutter run
   ```

4. **Test hot reload**
   - Open `lib/main.dart`
   - Change the title to: `'My First App!'`
   - Save the file
   - Press `r` in the terminal
   - ✅ Title should change instantly!

**Success criteria:**
- ✅ App runs without errors
- ✅ Hot reload works
- ✅ You can see the counter app

---

### Exercise 2: Explore and Modify the Default App 🔍

**Goal**: Understand the default counter app by experimenting with it

**Part A: Interact with the app**

1. **Click the floating action button** (the + button)
   - What happens? (Counter should increase)
   
2. **Click it 10 times**
   - Does it keep counting?
   
3. **Hot restart** (press `R` in terminal)
   - What happens to the counter? (Should reset to 0)

**Part B: Read the code**

1. Open `lib/main.dart` in your editor
2. Find these sections (use Ctrl+F to search):
   - `void main()` - The starting point
   - `class MyApp` - The app widget
   - `class MyHomePage` - The home screen
   - `_counter` - The counter variable
   - `_incrementCounter` - The function that increases the counter

3. Add comments to explain what you think each part does

**Part C: Make changes**

Try these modifications (one at a time, use hot reload after each):

1. **Change the app title**
   ```dart
   // Find around line 35:
   title: 'Flutter Demo Home Page',
   // Change to:
   title: 'Counter Master 3000',
   ```

2. **Change the theme color**
   ```dart
   // Find around line 30:
   seedColor: Colors.deepPurple,
   // Try these: Colors.red, Colors.green, Colors.orange, Colors.teal
   ```

3. **Change the button icon**
   ```dart
   // Find around line 118:
   child: const Icon(Icons.add),
   // Try these: Icons.favorite, Icons.star, Icons.thumb_up, Icons.rocket_launch
   ```

4. **Make it count by 2**
   ```dart
   // Find around line 107:
   _counter++;
   // Change to:
   _counter += 2;
   ```

5. **Add a message**
   ```dart
   // Find around line 97 (inside the children: [ ... ] section):
   const Text(
     'You have pushed the button this many times:',
   ),
   // Add ABOVE it:
   const Text(
     'Welcome to my first app!',
     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
   ),
   ```

**Success criteria:**
- ✅ Made at least 3 successful changes
- ✅ Used hot reload for each change
- ✅ App didn't crash
- ✅ You're starting to feel comfortable!

---

### Exercise 3: Experiment Time! 🧪

**Goal**: Break things and learn from them (seriously!)

**Challenge yourself:**

1. **Delete a semicolon** somewhere and save
   - What error message do you get?
   - Can you understand it?
   - Put it back and save

2. **Change a number to a word**
   ```dart
   // Try changing:
   _counter++;
   // To:
   _counter = "hello";  // Wrong type!
   ```
   - What error appears?
   - This teaches you about Dart's type system!
   - Fix it back

3. **Create a second counter**
   - Can you add a second counter variable?
   - Add a second button to increase it?
   - Display both counters?
   
   **Hint**: You'll need:
   - A new variable: `int _counter2 = 0;`
   - A new function: `void _incrementCounter2() { ... }`
   - A new button in the UI

**Success criteria:**
- ✅ You experimented and learned
- ✅ You fixed errors you created
- ✅ You're becoming comfortable with making changes

---

## 🎉 Congratulations!

**You've completed Session 1!** Here's what you achieved:

### ✅ Setup Checklist

- [x] **Flutter SDK installed** and working
- [x] **flutter doctor** reports success
- [x] **IDE configured** (VS Code or Android Studio)
- [x] **Emulator/Simulator** set up and running
- [x] **First project created** successfully
- [x] **App runs** on your device
- [x] **Hot reload tested** and works perfectly
- [x] **Made code changes** and saw results

### 🎓 What You Learned

**Concepts:**
- ✅ What Flutter is and why it's awesome
- ✅ Flutter's architecture (layers)
- ✅ Project structure and key files
- ✅ What widgets are (everything is a widget!)

**Skills:**
- ✅ Installing and configuring Flutter
- ✅ Creating Flutter projects
- ✅ Running apps on devices
- ✅ Using hot reload effectively
- ✅ Making simple code changes
- ✅ Debugging basic errors

**Confidence:**
- ✅ You can set up Flutter environments
- ✅ You can create and run apps
- ✅ You're comfortable with the development workflow
- ✅ You're ready to learn Dart programming!

---

## 🚀 What's Next?

In **Session 2**, you'll learn:
- 📝 Dart programming basics
- 🔢 Variables and data types
- ⚙️ Functions and classes
- 🎯 Object-oriented programming

**Before Session 2, make sure:**
- ✅ Your Flutter environment works perfectly
- ✅ You can create and run apps
- ✅ Hot reload works
- ✅ You've completed at least Exercise 1 and 2

---

## 📚 Additional Resources

**Official Documentation:**
- 📖 [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)
- 🏥 [Flutter Doctor](https://docs.flutter.dev/get-started/flutter-doctor)
- 📘 [Write Your First Flutter App](https://docs.flutter.dev/get-started/codelab)

**Video Tutorials:**
- 🎥 [Flutter in Focus - YouTube Playlist](https://www.youtube.com/playlist?list=PLjxrf2q8roU2HdJQDjJzOeO6J3FoFLWr2)
- 🎥 [Flutter for Beginners](https://www.youtube.com/watch?v=1ukSR1GRtMU)

**Interactive Learning:**
- 💻 [DartPad - Try Dart Online](https://dartpad.dev/)
- 🧪 [Flutter Codelabs](https://docs.flutter.dev/codelabs)

**Community:**
- 💬 [Flutter Discord](https://discord.gg/flutter)
- 📱 [r/FlutterDev](https://www.reddit.com/r/FlutterDev/)

---

## 🆘 Troubleshooting Guide

### Common Issues and Solutions

**Problem: "flutter: command not found"**
```
Solution:
1. Check if Flutter is in your PATH
2. Restart your terminal/command prompt
3. Verify installation: which flutter (Mac/Linux) or where flutter (Windows)
```

**Problem: "flutter doctor" shows Android license error**
```
Solution:
flutter doctor --android-licenses
(Press 'y' to accept each license)
```

**Problem: Emulator won't start**
```
Solution:
1. Check if virtualization is enabled in BIOS
2. Ensure enough RAM (4GB minimum for emulator)
3. Try creating a new emulator with lower specs
4. Check Device Manager for errors
```

**Problem: "Gradle task assembleDebug failed"**
```
Solution:
1. flutter clean
2. flutter pub get
3. flutter run
```

**Problem: Hot reload not working**
```
Solution:
1. Try hot restart (press 'R' instead of 'r')
2. Stop and restart the app completely
3. flutter clean and rebuild
```

**Problem: App crashes immediately**
```
Solution:
1. Check the error message in terminal
2. Look for red error text in the app
3. Verify device has enough memory
4. Try running in debug mode: flutter run -v
```

**Need more help?**
- 🔍 Search on [StackOverflow](https://stackoverflow.com/questions/tagged/flutter)
- 💬 Ask in [Flutter Discord](https://discord.gg/flutter)
- 📧 Check [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)

---

## 🔜 Next Steps

**You're ready to move on when:**
- ✅ You can create a new Flutter project
- ✅ You can run apps on at least one device
- ✅ Hot reload works correctly
- ✅ You understand the basic project structure
- ✅ You've completed Exercises 1 and 2

**Continue to:** [Session 2: Dart Programming Basics](../session2/README.md)

In Session 2, you'll learn the Dart programming language that powers Flutter!

---

**[← Back to Day 1 Overview](../README.md)**
