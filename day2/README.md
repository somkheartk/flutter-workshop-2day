# Day 2: Advanced Features & Deployment

## 📖 สารบัญ (Table of Contents)

- [Session 1: State Management](#session-1-state-management)
- [Session 2: Navigation & Routing](#session-2-navigation--routing)
- [Session 3: API Integration & Data](#session-3-api-integration--data)
- [Session 4: Testing, Building & Deployment](#session-4-testing-building--deployment)

---

## Session 1: State Management
**เวลา: 09:00 - 10:30 (1.5 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เข้าใจการจัดการ state ในแอปที่ซับซ้อน
- เรียนรู้ state management patterns
- ใช้งาน Provider package
- จัดการ state แบบ global

### 📚 หัวข้อ (Topics)
1. **State Management Concepts**
   - Local vs Global state
   - setState limitations
   - When to use state management
   - Popular state management solutions

2. **Provider Package**
   - Installing Provider
   - ChangeNotifier
   - Provider types (Provider, Consumer, Selector)
   - MultiProvider

3. **Practical Implementation**
   - Creating data models
   - Implementing ChangeNotifier
   - Consuming state in widgets
   - Best practices

### 💻 Hands-on Lab
- สร้าง Counter App ด้วย Provider
- สร้าง Shopping Cart state management
- ใช้งาน Consumer และ Provider
- จัดการ multiple providers

### 📁 Resources
- [Session 1 Materials](./session1/)
- [Provider Package](https://pub.dev/packages/provider)

---

## Session 2: Navigation & Routing
**เวลา: 10:45 - 12:00 (1.25 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เรียนรู้การนำทางระหว่างหน้าจอ
- ส่งผ่านข้อมูลระหว่างหน้าจอ
- จัดการ navigation stack
- ใช้งาน named routes

### 📚 หัวข้อ (Topics)
1. **Basic Navigation**
   - Navigator.push()
   - Navigator.pop()
   - Passing data between screens
   - Returning data from screens

2. **Named Routes**
   - Defining routes in MaterialApp
   - onGenerateRoute
   - Route parameters
   - Initial route

3. **Advanced Navigation**
   - Bottom Navigation Bar
   - Drawer Navigation
   - TabBar
   - Modal Bottom Sheet

### 💻 Hands-on Lab
- สร้าง multi-screen app
- ใช้งาน named routes
- Passing และ receiving data
- สร้าง app ด้วย Bottom Navigation

### 📁 Resources
- [Session 2 Materials](./session2/)

---

## 🍽️ Lunch Break (12:00 - 13:00)

---

## Session 3: API Integration & Data
**เวลา: 13:00 - 15:00 (2 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เชื่อมต่อกับ REST API
- จัดการ asynchronous operations
- Parse JSON data
- บันทึกข้อมูลใน local storage

### 📚 หัวข้อ (Topics)
1. **HTTP Requests**
   - Installing http package
   - GET, POST, PUT, DELETE requests
   - Handling responses
   - Error handling

2. **JSON and Serialization**
   - JSON parsing
   - Creating model classes
   - fromJson() and toJson()
   - JSON serialization packages

3. **Asynchronous Programming**
   - Future and async/await
   - FutureBuilder widget
   - Stream and StreamBuilder
   - Handling loading states

4. **Local Storage**
   - SharedPreferences
   - SQLite database
   - Hive (NoSQL)
   - File storage

### 💻 Hands-on Lab
- Fetch data from public API
- สร้าง Weather App ที่เชื่อมต่อ API
- Parse JSON และแสดงผล
- บันทึกข้อมูลด้วย SharedPreferences

### 📁 Resources
- [Session 3 Materials](./session3/)
- [Free APIs for Practice](https://github.com/public-apis/public-apis)

---

## Session 4: Testing, Building & Deployment
**เวลา: 15:15 - 17:00 (1.75 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เขียน tests สำหรับ Flutter app
- Build แอปสำหรับ production
- Deploy บน Android และ iOS
- เตรียมแอปสำหรับ app stores

### 📚 หัวข้อ (Topics)
1. **Testing**
   - Unit testing
   - Widget testing
   - Integration testing
   - Running tests

2. **App Icons and Splash Screen**
   - Creating app icons
   - Using flutter_launcher_icons
   - Splash screen setup
   - Branding your app

3. **Building for Production**
   - Building Android APK/AAB
   - Building iOS IPA
   - Code signing
   - Build configurations

4. **Deployment**
   - Google Play Store preparation
   - App Store Connect preparation
   - Release checklist
   - App versioning

### 💻 Hands-on Lab
- เขียน unit tests
- เขียน widget tests
- สร้าง app icon
- Build APK สำหรับ Android
- เตรียมแอปสำหรับ deployment

### 📁 Resources
- [Session 4 Materials](./session4/)
- [Flutter Testing Guide](https://docs.flutter.dev/testing)

---

## 📝 Day 2 Exercises

### Exercise 1: Todo App with Provider
สร้างแอป Todo List ที่สมบูรณ์:
- เพิ่ม/ลบ/แก้ไข todo items
- ใช้ Provider สำหรับ state management
- บันทึกข้อมูลด้วย SharedPreferences
- Multiple screens (list, detail, add)

### Exercise 2: News Reader App
สร้างแอปอ่านข่าว:
- Fetch news จาก API
- แสดงรายการข่าวใน ListView
- แสดงรายละเอียดข่าวในหน้าแยก
- จัดการ loading และ error states

### Exercise 3: Full App Project
สร้างแอปที่รวมทุกอย่างที่เรียนมา:
- Multiple screens with navigation
- State management with Provider
- API integration
- Local data storage
- Tests
- Custom app icon

### 📁 Exercise Files
- [Day 2 Exercises](./exercises/)

---

## 🎯 สิ่งที่ควรเรียนรู้หลังจบ Day 2

- ✅ จัดการ state ด้วย Provider
- ✅ Navigate ระหว่างหน้าจอต่างๆ
- ✅ เชื่อมต่อกับ REST API
- ✅ Parse และจัดการ JSON data
- ✅ บันทึกข้อมูลใน local storage
- ✅ เขียน tests
- ✅ Build และ deploy แอป

---

## 🎓 Final Project Ideas

เลือกทำโปรเจกต์อย่างใดอย่างหนึ่ง:

1. **E-Commerce App**
   - Product listing
   - Shopping cart
   - Checkout process
   - Order history

2. **Social Media App**
   - User profiles
   - Posts feed
   - Comments and likes
   - Image upload

3. **Fitness Tracker**
   - Workout logging
   - Progress tracking
   - Statistics and charts
   - Goal setting

4. **Recipe App**
   - Recipe browser
   - Search functionality
   - Favorites
   - Step-by-step cooking mode

---

## 📚 Continued Learning

### Recommended Next Steps:
1. **Advanced Topics**
   - Animations
   - Custom painters
   - Platform channels
   - Background services

2. **Popular Packages**
   - Firebase integration
   - GetX state management
   - Riverpod
   - Freezed for immutable models

3. **Best Practices**
   - Clean architecture
   - Repository pattern
   - Dependency injection
   - Performance optimization

### Learning Resources:
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter YouTube Channel](https://www.youtube.com/c/flutterdev)
- [Flutter Community Medium](https://medium.com/flutter-community)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)

---

## 🏆 Congratulations!

คุณได้เรียนจบคอร์ส Flutter Workshop 2 วันแล้ว! 🎉

คุณมีความรู้พื้นฐานที่จำเป็นในการสร้างแอปพลิเคชันมือถือด้วย Flutter แล้ว
ขั้นตอนต่อไปคือการฝึกฝนและสร้างโปรเจกต์ของคุณเอง

**Keep coding and have fun building amazing apps!** 🚀

---

## 📋 Workshop Feedback

เรายินดีรับฟังความคิดเห็นของคุณเพื่อปรับปรุงคอร์สให้ดีขึ้น:
- เนื้อหาใดที่เป็นประโยชน์ที่สุด?
- มีหัวข้อใดที่ต้องการเรียนเพิ่มเติม?
- ข้อเสนอแนะสำหรับคอร์สครั้งต่อไป

---

## 🔗 Quick Links

- [← Day 1: Flutter Fundamentals](../day1/README.md)
- [← Back to Main](../README.md)
- [Resources](../resources/)
- [Projects](../projects/)

---

**Thank you for participating! 🙏**
