# Runnable Code Examples
# ตัวอย่างโค้ดที่พร้อมรัน

This directory contains complete, runnable Flutter example projects for each session of the workshop.

ไดเรกทอรีนี้มีตัวอย่างโปรเจกต์ Flutter ที่สมบูรณ์และพร้อมรันสำหรับทุกเซสชันของเวิร์กช็อป

## 📂 Day 1: Flutter Fundamentals / วันที่ 1: พื้นฐาน Flutter

### Session 1: Introduction to Flutter & Setup / เซสชัน 1: แนะนำ Flutter และการติดตั้ง
**Location / ตำแหน่ง:** [`day1/session1/example/`](./day1/session1/example/)

A basic Flutter counter application demonstrating:

แอปพลิเคชันนับเลขพื้นฐานที่แสดง:
- Basic Flutter app structure / โครงสร้างแอป Flutter พื้นฐาน
- StatefulWidget / วิดเจ็ตที่มี state
- setState() for state management / การจัดการ state ด้วย setState()
- FloatingActionButton / ปุ่มลอยตัว

**Run / รัน:** `cd day1/session1/example && flutter run`

---

### Session 2: Dart Programming Basics / เซสชัน 2: พื้นฐานการเขียนโปรแกรม Dart
**Location / ตำแหน่ง:** [`day1/session2/examples/`](./day1/session2/examples/)

Four Dart command-line examples covering:

ตัวอย่าง Dart บนคอมมานด์ไลน์ 4 ไฟล์ ครอบคลุม:
- Variables and data types / ตัวแปรและชนิดข้อมูล (`01_variables.dart`)
- Control flow / การควบคุมการทำงาน (`02_control_flow.dart`)
- Functions / ฟังก์ชัน (`03_functions.dart`)
- Object-oriented programming / การเขียนโปรแกรมเชิงวัตถุ (`04_oop.dart`)

**Run / รัน:** `cd day1/session2/examples && dart 01_variables.dart`

---

### Session 3: Flutter Widgets & Layouts / เซสชัน 3: วิดเจ็ตและเลย์เอาต์ของ Flutter
**Location / ตำแหน่ง:** [`day1/session3/example/`](./day1/session3/example/)

Comprehensive widgets demonstration including:

การสาธิตวิดเจ็ตครอบคลุมรวมถึง:
- Card, Row, Column layouts / เลย์เอาต์แบบการ์ด, แถว, คอลัมน์
- Container styling / การตกแต่ง Container
- Icons and buttons / ไอคอนและปุ่ม
- ListView with items / ListView พร้อมรายการ
- SnackBar notifications / การแจ้งเตือนแบบ SnackBar

**Run / รัน:** `cd day1/session3/example && flutter run`

---

### Session 4: Building Your First App / เซสชัน 4: สร้างแอปแรกของคุณ
**Location / ตำแหน่ง:** [`day1/session4/examples/`](./day1/session4/examples/)

Three complete applications:

แอปพลิเคชันสมบูรณ์ 3 แอป:

#### Counter App / แอปนับเลข
Enhanced counter with increment, decrement, and reset.

แอปนับเลขที่ปรับปรุงแล้ว พร้อมเพิ่ม ลด และรีเซ็ต

**Run / รัน:** `cd day1/session4/examples/counter_app && flutter run`

#### Profile Card / การ์ดโปรไฟล์
Interactive profile with follow/unfollow and dynamic stats.

โปรไฟล์แบบโต้ตอบได้ พร้อมติดตาม/เลิกติดตาม และสถิติแบบไดนามิก

**Run / รัน:** `cd day1/session4/examples/profile_card && flutter run`

#### Todo List / รายการสิ่งที่ต้องทำ
Complete todo app with add, toggle, and delete.

แอป Todo สมบูรณ์ พร้อมเพิ่ม สลับสถานะ และลบ

**Run / รัน:** `cd day1/session4/examples/todo_list && flutter run`

---

## 📂 Day 2: Advanced Features & Deployment / วันที่ 2: ฟีเจอร์ขั้นสูงและการเผยแพร่

### Session 1: State Management with Provider / เซสชัน 1: การจัดการ State ด้วย Provider
**Location / ตำแหน่ง:** [`day2/session1/example/`](./day2/session1/example/)

Shopping cart application demonstrating:

แอปพลิเคชันตะกร้าสินค้าที่แสดง:
- Provider package / แพ็คเกจ Provider
- ChangeNotifier / ตัวแจ้งเตือนการเปลี่ยนแปลง
- Consumer widget / วิดเจ็ต Consumer
- context.read() and context.watch() / การอ่านและติดตาม context
- Shared state across screens / state ที่แบ่งปันระหว่างหน้าจอ

**Run / รัน:** `cd day2/session1/example && flutter pub get && flutter run`

---

### Session 2: Navigation & Routing / เซสชัน 2: การนำทางและเส้นทาง
**Location / ตำแหน่ง:** [`day2/session2/example/`](./day2/session2/example/)

Multi-screen app showing:

แอปหลายหน้าจอที่แสดง:
- Named routes / เส้นทางที่มีชื่อ
- Navigator.push/pop / การนำทางไปและกลับ
- Passing data between screens / ส่งข้อมูลระหว่างหน้าจอ
- Multiple screen types (Home, Profile, Settings, Details) / หน้าจอหลายประเภท (หน้าแรก, โปรไฟล์, ตั้งค่า, รายละเอียด)

**Run / รัน:** `cd day2/session2/example && flutter run`

---

### Session 3: API Integration & Data / เซสชัน 3: การเชื่อมต่อ API และข้อมูล
**Location / ตำแหน่ง:** [`day2/session3/example/`](./day2/session3/example/)

API integration demo featuring:

ตัวอย่างการเชื่อมต่อ API ประกอบด้วย:
- HTTP package / แพ็คเกจ HTTP
- GET/POST requests / คำขอ GET/POST
- JSON parsing / การแปลง JSON
- FutureBuilder / ตัวสร้างจาก Future
- Error handling / การจัดการข้อผิดพลาด
- Loading states / สถานะการโหลด

**Run / รัน:** `cd day2/session3/example && flutter pub get && flutter run`

**Note / หมายเหตุ:** Requires internet connection / ต้องมีการเชื่อมต่ออินเทอร์เน็ต

---

### Session 4: Testing, Building & Deployment / เซสชัน 4: การทดสอบ สร้างแอป และเผยแพร่
**Location / ตำแหน่ง:** [`day2/session4/example/`](./day2/session4/example/)

Testing examples including:

ตัวอย่างการทดสอบรวมถึง:
- Unit tests (Calculator, Counter, TodoList) / การทดสอบหน่วย (เครื่องคิดเลข, ตัวนับ, รายการ Todo)
- Widget tests (UI interactions) / การทดสอบวิดเจ็ต (การโต้ตอบ UI)
- Test groups and setUp/tearDown / กลุ่มการทดสอบและการตั้งค่า/ทำความสะอาด
- Coverage reports / รายงานความครอบคลุม

**Run App / รันแอป:** `cd day2/session4/example && flutter run`

**Run Tests / รันการทดสอบ:** `cd day2/session4/example && flutter test`

**Coverage / ความครอบคลุม:** `cd day2/session4/example && flutter test --coverage`

---

## 🚀 Quick Start / เริ่มต้นอย่างรวดเร็ว

### Prerequisites / ข้อกำหนดเบื้องต้น
- Flutter SDK installed / ติดตั้ง Flutter SDK แล้ว
- IDE (VS Code or Android Studio) with Flutter extensions / IDE พร้อม Flutter extensions
- Android Emulator or iOS Simulator running / Android Emulator หรือ iOS Simulator ที่กำลังทำงาน
- OR a physical device connected / หรือ อุปกรณ์จริงที่เชื่อมต่อแล้ว

### Running Any Example / รันตัวอย่างใดก็ได้

1. Navigate to the example directory / ไปยังไดเรกทอรีตัวอย่าง:
   ```bash
   cd day1/session1/example
   ```

2. Get dependencies (if needed) / ติดตั้ง dependencies (ถ้าจำเป็น):
   ```bash
   flutter pub get
   ```

3. Run the app / รันแอป:
   ```bash
   flutter run
   ```

### Running Dart Examples (Session 2) / รันตัวอย่าง Dart (เซสชัน 2)

```bash
cd day1/session2/examples
dart 01_variables.dart
dart 02_control_flow.dart
dart 03_functions.dart
dart 04_oop.dart
```

## 📝 Notes / หมายเหตุ

- Each example is a complete, standalone project / แต่ละตัวอย่างเป็นโปรเจกต์สมบูรณ์และแยกส่วน
- Examples progress in complexity from Day 1 to Day 2 / ตัวอย่างมีความซับซ้อนเพิ่มขึ้นจากวันที่ 1 ถึงวันที่ 2
- All examples include README files with detailed explanations / ตัวอย่างทั้งหมดมีไฟล์ README พร้อมคำอธิบายโดยละเอียด
- Code is well-commented for learning purposes / โค้ดมีคอมเมนต์ครอบคลุมเพื่อการเรียนรู้
- Examples follow Flutter best practices / ตัวอย่างปฏิบัติตามแนวทางปฏิบัติที่ดีของ Flutter

## 🤝 Using These Examples / การใช้ตัวอย่างเหล่านี้

- **Study / ศึกษา**: Read the code and comments to understand concepts / อ่านโค้ดและคอมเมนต์เพื่อเข้าใจแนวคิด
- **Practice / ฝึกฝน**: Modify the code and see the results / แก้ไขโค้ดและดูผลลัพธ์
- **Experiment / ทดลอง**: Try adding new features / ลองเพิ่มฟีเจอร์ใหม่
- **Debug / แก้ไขข้อบกพร่อง**: Use hot reload to test changes quickly / ใช้ hot reload เพื่อทดสอบการเปลี่ยนแปลงอย่างรวดเร็ว

## 📚 What You'll Learn / สิ่งที่คุณจะได้เรียนรู้

By working through these examples, you'll learn:

จากการทำตัวอย่างเหล่านี้ คุณจะได้เรียนรู้:

**Day 1 / วันที่ 1:**
- Flutter basics and Dart language / พื้นฐาน Flutter และภาษา Dart
- Widget fundamentals and layouts / พื้นฐานวิดเจ็ตและเลย์เอาต์
- State management with setState() / การจัดการ state ด้วย setState()
- Building simple apps / การสร้างแอปง่ายๆ

**Day 2 / วันที่ 2:**
- Advanced state management (Provider) / การจัดการ state ขั้นสูง (Provider)
- Navigation patterns / รูปแบบการนำทาง
- REST API integration / การเชื่อมต่อ REST API
- Testing and best practices / การทดสอบและแนวทางปฏิบัติที่ดี

## ⚠️ Troubleshooting / การแก้ไขปัญหา

If you encounter issues / หากคุณพบปัญหา:

1. **Check Flutter installation / ตรวจสอบการติดตั้ง Flutter:**
   ```bash
   flutter doctor
   ```

2. **Clean and rebuild / ทำความสะอาดและสร้างใหม่:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **Update Flutter / อัปเดต Flutter:**
   ```bash
   flutter upgrade
   ```

## 💡 Tips / เคล็ดลับ

- Use hot reload (press 'r') to see changes instantly / ใช้ hot reload (กด 'r') เพื่อเห็นการเปลี่ยนแปลงทันที
- Use hot restart (press 'R') for major changes / ใช้ hot restart (กด 'R') สำหรับการเปลี่ยนแปลงใหญ่
- Check the terminal for error messages / ตรวจสอบข้อความผิดพลาดในเทอร์มินัล
- Read the README in each example directory / อ่าน README ในแต่ละไดเรกทอรีตัวอย่าง
- Refer back to the main session documentation / ย้อนกลับไปดูเอกสารเซสชันหลัก

---

**Happy Coding! 🎉**

**เขียนโค้ดอย่างมีความสุข! 🎉**

For more information, see the main [workshop README](../README.md).

สำหรับข้อมูลเพิ่มเติม ดูที่ [workshop README](../README.md) หลัก
