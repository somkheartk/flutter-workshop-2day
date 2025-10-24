# Quick Start Guide

Get started with the Flutter Workshop in 5 minutes!

## 🚀 Prerequisites

- Computer with 8GB+ RAM
- Internet connection
- Basic programming knowledge

## 📥 Step 1: Install Flutter

### macOS
```bash
brew install flutter
```

### Windows
Download from: https://docs.flutter.dev/get-started/install/windows

### Linux
```bash
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:$(pwd)/flutter/bin"
```

## ✅ Step 2: Verify Installation

```bash
flutter doctor
```

Fix any issues shown (Android Studio, Xcode, etc.)

## 📱 Step 3: Set Up Device

### Android Emulator
1. Open Android Studio
2. Tools → AVD Manager
3. Create Virtual Device

### iOS Simulator (macOS only)
```bash
open -a Simulator
```

## 🎓 Step 4: Start Learning

### Access Workshop Materials

**Option 1: Clone this repository**
```bash
git clone https://github.com/somkheartk/flutter-workshop-2day.git
cd flutter-workshop-2day
```

**Option 2: Fork and clone your own copy**
1. Click "Fork" button on GitHub
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/flutter-workshop-2day.git`

### Follow the Curriculum

**Day 1**: Flutter Basics
```bash
cd day1
# Read README.md and follow sessions 1-4
```

**Day 2**: Advanced Features
```bash
cd day2
# Read README.md and follow sessions 1-4
```

## 🏃 Step 5: Create Your First App

```bash
# Create a new project
flutter create my_first_app
cd my_first_app

# Run the app
flutter run
```

## 📚 Learning Path

1. **Day 1 Morning** (4 hours)
   - Session 1: Setup & Introduction
   - Session 2: Dart Basics

2. **Day 1 Afternoon** (4 hours)
   - Session 3: Widgets & Layouts
   - Session 4: First App

3. **Day 2 Morning** (4 hours)
   - Session 1: State Management
   - Session 2: Navigation

4. **Day 2 Afternoon** (4 hours)
   - Session 3: API Integration
   - Session 4: Testing & Deployment

## 💡 Tips

- 💻 **Type the code** yourself, don't just copy-paste
- 🔄 **Use hot reload** (`r` key) to see changes instantly
- ❓ **Ask questions** if you're stuck
- 🎯 **Complete exercises** to reinforce learning
- 📱 **Test on real devices** when possible

## 🆘 Troubleshooting

### Flutter doctor issues?
```bash
flutter doctor -v  # See detailed issues
flutter doctor --android-licenses  # Accept Android licenses
```

### Build errors?
```bash
flutter clean
flutter pub get
flutter run
```

### Hot reload not working?
- Press `R` (capital R) for hot restart
- Save the file again
- Restart the app

## 📞 Need Help?

- Check [FAQ](./resources/references.md)
- Read [Flutter Documentation](https://docs.flutter.dev/)
- Ask in [Flutter Community](https://flutter.dev/community)

## 🎯 Next Steps

After completing the workshop:
1. Build your own app
2. Contribute to open source
3. Join Flutter community
4. Share your knowledge
5. Keep learning!

---

**Ready? Let's start coding! 🚀**

[Go to Day 1 →](./day1/README.md)
