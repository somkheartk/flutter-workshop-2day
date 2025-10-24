# Day 1: Flutter Fundamentals

## 📖 สารบัญ (Table of Contents)

- [Session 1: Introduction to Flutter & Setup](#session-1-introduction-to-flutter--setup)
- [Session 2: Dart Programming Basics](#session-2-dart-programming-basics)
- [Session 3: Flutter Widgets & Layouts](#session-3-flutter-widgets--layouts)
- [Session 4: Building Your First App](#session-4-building-your-first-app)

---

## Session 1: Introduction to Flutter & Setup
**เวลา: 09:00 - 10:30 (1.5 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เข้าใจ Flutter framework และประโยชน์
- ทำความเข้าใจสถาปัตยกรรมของ Flutter
- ติดตั้งและตั้งค่า development environment
- สร้าง Flutter project แรก

### 📚 หัวข้อ (Topics)
1. **What is Flutter?**
   - History and background
   - Why Flutter?
   - Flutter vs Native vs Other frameworks
   - Flutter architecture

2. **Development Environment Setup**
   - Flutter SDK installation
   - IDE setup (VS Code / Android Studio)
   - Android Studio and Xcode configuration
   - Running `flutter doctor`

3. **Your First Flutter Project**
   - Creating a new project
   - Project structure overview
   - Understanding pubspec.yaml
   - Running the app on emulator/device

### 💻 Hands-on Lab
- ติดตั้ง Flutter SDK และตรวจสอบด้วย `flutter doctor`
- สร้างโปรเจกต์แรก: `flutter create hello_flutter`
- รันแอปบน emulator หรืออุปกรณ์จริง
- ทำความเข้าใจโครงสร้างโปรเจกต์

### 📁 Resources
- [Session 1 Materials](./session1/)

---

## Session 2: Dart Programming Basics
**เวลา: 10:45 - 12:00 (1.25 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เรียนรู้พื้นฐาน Dart programming language
- เข้าใจ syntax และ data types
- ใช้งาน functions และ classes ใน Dart

### 📚 หัวข้อ (Topics)
1. **Dart Basics**
   - Variables and data types
   - String interpolation
   - Operators
   - Null safety

2. **Control Flow**
   - if/else statements
   - Loops (for, while, forEach)
   - Switch statements

3. **Functions**
   - Function declaration
   - Parameters (required, optional, named)
   - Arrow functions
   - Anonymous functions

4. **Object-Oriented Programming**
   - Classes and objects
   - Constructors
   - Properties and methods
   - Inheritance

### 💻 Hands-on Lab
- เขียน Dart code ใน DartPad
- สร้าง classes และ functions
- ฝึกใช้งาน collections (List, Map, Set)

### 📁 Resources
- [Session 2 Materials](./session2/)
- [DartPad Online Editor](https://dartpad.dev/)

---

## 🍽️ Lunch Break (12:00 - 13:00)

---

## Session 3: Flutter Widgets & Layouts
**เวลา: 13:00 - 15:00 (2 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- เข้าใจแนวคิด "Everything is a Widget"
- เรียนรู้ Stateless และ Stateful widgets
- ใช้งาน common widgets
- สร้าง layouts ที่ซับซ้อน

### 📚 หัวข้อ (Topics)
1. **Widget Fundamentals**
   - Widget tree concept
   - Stateless vs Stateful widgets
   - Widget lifecycle
   - BuildContext

2. **Basic Widgets**
   - Text, Image, Icon
   - Container, SizedBox, Padding
   - Button widgets (ElevatedButton, TextButton, IconButton)
   - TextField and Form widgets

3. **Layout Widgets**
   - Row and Column
   - Stack and Positioned
   - ListView and GridView
   - Expanded and Flexible

4. **Styling**
   - TextStyle
   - BoxDecoration
   - Colors and Themes
   - Custom fonts

### 💻 Hands-on Lab
- สร้าง UI ด้วย basic widgets
- ออกแบบ layout ด้วย Row, Column
- ใช้งาน ListView สำหรับแสดงรายการ
- Styling และ theming

### 📁 Resources
- [Session 3 Materials](./session3/)
- [Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

---

## Session 4: Building Your First App
**เวลา: 15:15 - 17:00 (1.75 ชั่วโมง)**

### 🎯 จุดประสงค์ (Objectives)
- ประยุกต์ใช้ความรู้จากทุก session
- สร้างแอปพลิเคชันที่สมบูรณ์
- เข้าใจ state management พื้นฐาน

### 📚 หัวข้อ (Topics)
1. **Project: Counter App (Enhanced)**
   - Stateful widget implementation
   - Managing state with setState()
   - Adding multiple features
   - Custom styling

2. **Project: Profile Card App**
   - Creating a personal profile UI
   - Using images and icons
   - Complex layouts
   - Making it responsive

3. **User Interaction**
   - Handling button clicks
   - TextField input
   - GestureDetector
   - SnackBar and Dialog

### 💻 Hands-on Lab
- สร้าง Counter App ที่มีฟีเจอร์หลากหลาย
- สร้าง Profile Card App
- เพิ่ม user interactions
- ทดสอบบนอุปกรณ์จริง

### 📁 Resources
- [Session 4 Materials](./session4/)

---

## 📝 Day 1 Exercises

### Exercise 1: Basic UI
สร้าง UI หน้าจอ Login ที่มี:
- Logo หรือ Icon
- TextField สำหรับ username
- TextField สำหรับ password
- Login button
- Sign up link

### Exercise 2: List View
สร้างแอปแสดงรายการสินค้า:
- รายการสินค้า (ชื่อ, ราคา, รูปภาพ)
- แสดงใน ListView
- แยก widget สำหรับแต่ละ item

### Exercise 3: Calculator UI
สร้าง UI เครื่องคิดเลขพื้นฐาน:
- ออกแบบ layout ตัวเลข 0-9
- ปุ่มการคำนวณ (+, -, ×, ÷)
- หน้าจอแสดงผล

### 📁 Exercise Files
- [Day 1 Exercises](./exercises/)

---

## 🎯 สิ่งที่ควรเรียนรู้หลังจบ Day 1

- ✅ ติดตั้งและตั้งค่า Flutter development environment
- ✅ เข้าใจพื้นฐาน Dart programming language
- ✅ สร้างและใช้งาน Flutter widgets
- ✅ ออกแบบ UI layouts
- ✅ จัดการ state พื้นฐานด้วย setState()
- ✅ สร้างแอปพลิเคชัน Flutter แรกของคุณ

---

## 📚 Homework (Optional)

1. ปรับปรุงแอปที่สร้างในคอร์สให้สวยงามขึ้น
2. ทดลองสร้าง UI ของแอปที่คุณชอบ
3. อ่านเอกสาร Flutter widgets เพิ่มเติม
4. เตรียมความพร้อมสำหรับ Day 2

---

## 🔗 Quick Links

- [Day 2: Advanced Features →](../day2/README.md)
- [← Back to Main](../README.md)
- [Resources](../resources/)

---

**See you on Day 2! 🚀**
