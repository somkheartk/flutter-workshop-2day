# Hello Flutter Example - แอป Flutter แรก

แอปพลิเคชันพื้นฐานของ Flutter แสดงการทำงานของ Counter App จาก Session 1

## คุณสมบัติ (Features)

- ✅ แอป Flutter พื้นฐานที่สมบูรณ์
- ✅ การนับเลขด้วยปุ่ม
- ✅ แสดงการใช้งาน StatefulWidget
- ✅ แสดงการ update UI ด้วย setState()

## วิธีรันแอป (How to Run)

```bash
# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run

# ทดลองใช้ Hot Reload
# 1. แก้ไขโค้ด (เช่น เปลี่ยนข้อความ)
# 2. บันทึกไฟล์
# 3. กด 'r' ในเทอร์มินัล
# 4. ดูการเปลี่ยนแปลงทันที!
```

## สิ่งที่จะได้เรียนรู้ (What You'll Learn)

- ✅ โครงสร้างพื้นฐานของแอป Flutter
- ✅ ความแตกต่างระหว่าง StatefulWidget และ StatelessWidget
- ✅ การใช้ setState() เพื่ออัปเดต UI
- ✅ FloatingActionButton และการจัดการ events
- ✅ Scaffold, AppBar และ widgets พื้นฐาน
- ✅ Hot Reload สำหรับการพัฒนาที่รวดเร็ว

## Widgets และ Concepts ที่สำคัญ (Key Widgets & Concepts)

### 1. **main() Function**
```dart
void main() {
  runApp(const MyApp());
}
```
**ทำไมใช้:** จุดเริ่มต้นของทุกแอป Dart/Flutter
**วิธีใช้:**
- ทุกแอป Flutter ต้องมี `main()` function
- เรียก `runApp()` เพื่อเริ่มแอป
- ส่ง root widget (ปกติคือ MaterialApp หรือ CupertinoApp)

### 2. **runApp()**
```dart
runApp(const MyApp());
```
**ทำไมใช้:** เริ่มต้น Flutter framework และแสดง widget แรก
**วิธีใช้:**
- รับ widget เป็น parameter
- จะทำให้ widget ขยายเต็มหน้าจอ
- เรียกครั้งเดียวตอนเริ่มแอป

### 3. **StatelessWidget (MyApp)**
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(...);
  }
}
```
**ทำไมใช้:** สำหรับ widgets ที่ไม่เปลี่ยนแปลง
**วิธีใช้:**
- Extend `StatelessWidget`
- Override method `build()`
- ไม่มี state ที่เปลี่ยนแปลงได้
- เหมาะสำหรับ UI ที่แสดงผลคงที่

**เมื่อไหร่ควรใช้ StatelessWidget:**
- แสดงข้อความหรือไอคอนคงที่
- Layout ที่ไม่เปลี่ยนแปลง
- ไม่มี user interaction ที่เปลี่ยน UI

### 4. **MaterialApp**
```dart
MaterialApp(
  title: 'Hello Flutter',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  home: const MyHomePage(title: 'Hello Flutter - Session 1'),
)
```
**ทำไมใช้:** Widget หลักที่ให้ Material Design และฟีเจอร์พื้นฐาน
**วิธีใช้:**
- ใส่เป็น root widget ของแอป
- `title` ชื่อแอป (แสดงใน task switcher)
- `theme` กำหนดสี และรูปแบบทั้งแอป
- `home` หน้าแรกที่จะแสดง
- `useMaterial3: true` ใช้ Material Design 3

**Material Design คืออะไร:**
- ระบบออกแบบจาก Google
- มีกฎเกณฑ์สำหรับสี, รูปร่าง, การเคลื่อนไหว
- ทำให้แอปดูสวยและใช้งานง่าย

### 5. **ThemeData & ColorScheme**
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
)
```
**ทำไมใช้:** กำหนดสีและธีมทั้งแอปในที่เดียว
**วิธีใช้:**
- `ColorScheme.fromSeed()` สร้างชุดสีจากสีหลัก 1 สี
- `seedColor` สีหลักของแอป
- สร้างสีเสริมอัตโนมัติ (primary, secondary, background, ...)
- เปลี่ยนสีที่เดียว ทั้งแอปเปลี่ยนตาม

### 6. **StatefulWidget (MyHomePage)**
```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```
**ทำไมใช้:** สำหรับ widgets ที่มีข้อมูลเปลี่ยนแปลงได้
**วิธีใช้:**
- Extend `StatefulWidget`
- สร้าง State class แยกต่างหาก
- Override `createState()` เพื่อสร้าง State object
- ใส่ properties ที่ไม่เปลี่ยนแปลงไว้ใน StatefulWidget
- ใส่ properties ที่เปลี่ยนแปลงไว้ใน State class

**เมื่อไหร่ควรใช้ StatefulWidget:**
- มี user interaction ที่เปลี่ยน UI (ปุ่ม, input)
- แสดงข้อมูลที่เปลี่ยนแปลง (เลขนับ, รายการ)
- มี animation หรือ timer

### 7. **State Class (_MyHomePageState)**
```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;  // State variable
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```
**ทำไมใช้:** เก็บข้อมูลที่เปลี่ยนแปลงได้และจัดการ UI
**วิธีใช้:**
- ขึ้นต้นด้วย `_` (private class)
- Extend `State<ชื่อ StatefulWidget>`
- ประกาศตัวแปร state
- สร้าง methods สำหรับเปลี่ยนแปลง state
- Override `build()` เพื่อสร้าง UI

### 8. **widget.property**
```dart
title: Text(widget.title)
```
**ทำไมใช้:** เข้าถึง properties จาก StatefulWidget
**วิธีใช้:**
- ใช้ `widget.` ตามด้วยชื่อ property
- เข้าถึงได้จาก State class เท่านั้น
- เหมาะสำหรับข้อมูลที่ส่งมาจากภายนอก (parameters)

### 9. **setState()**
```dart
void _incrementCounter() {
  setState(() {
    _counter++;  // เปลี่ยนค่าตัวแปร state
  });
}
```
**ทำไมใช้:** บอก Flutter ว่าข้อมูลเปลี่ยนแล้ว ต้องสร้าง UI ใหม่
**วิธีใช้:**
- เรียก `setState(() { ... })`
- ใส่การเปลี่ยนแปลงข้อมูลใน closure `{ ... }`
- Flutter จะเรียก `build()` อีกครั้งอัตโนมัติ
- UI จะอัปเดตตามข้อมูลใหม่

**สำคัญ:**
- ต้องเรียก setState() ทุกครั้งที่เปลี่ยนค่าตัวแปร state
- ไม่เรียก = UI ไม่อัปเดต
- เรียกเฉพาะใน State class เท่านั้น

### 10. **Scaffold**
```dart
Scaffold(
  appBar: AppBar(...),
  body: Center(...),
  floatingActionButton: FloatingActionButton(...),
)
```
**ทำไมใช้:** โครงสร้างพื้นฐานของหน้าจอ Material Design
**วิธีใช้:**
- `appBar` แถบด้านบน
- `body` เนื้อหาหลัก
- `floatingActionButton` ปุ่มลอยด้านล่างขวา
- สามารถเพิ่ม `drawer`, `bottomNavigationBar` ได้

### 11. **AppBar**
```dart
AppBar(
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  title: Text(widget.title),
)
```
**ทำไมใช้:** แถบด้านบนของหน้าจอแสดงชื่อและปุ่มต่างๆ
**วิธีใช้:**
- `title` ชื่อหน้าจอ (widget)
- `backgroundColor` สีพื้นหลัง
- `Theme.of(context)` เข้าถึง theme ของแอป
- สามารถเพิ่ม `actions` (ปุ่มด้านขวา), `leading` (ปุ่มด้านซ้าย)

### 12. **Center & Column**
```dart
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Text('You have pushed the button this many times:'),
      Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
    ],
  ),
)
```
**ทำไมใช้:** จัดวาง widgets ให้อยู่กลางและเรียงตามแนวตั้ง
**วิธีใช้:**
- `Center` จัดให้อยู่กลางหน้าจอ
- `Column` จัดเรียงในแนวตั้ง
- `mainAxisAlignment: MainAxisAlignment.center` จัดกลางในแนวตั้ง
- ใส่ widgets ใน `children` list

### 13. **Text with Theme**
```dart
Text(
  '$_counter',
  style: Theme.of(context).textTheme.headlineMedium,
)
```
**ทำไมใช้:** แสดงข้อความพร้อมรูปแบบจาก theme
**วิธีใช้:**
- `'$_counter'` แปลงตัวเลขเป็น String (String interpolation)
- `Theme.of(context).textTheme` เข้าถึงรูปแบบตัวอักษรจาก theme
- `headlineMedium` ขนาดตัวอักษรใหญ่พอดี
- ตัวเลือกอื่น: `bodyLarge`, `bodyMedium`, `titleLarge`, ...

### 14. **FloatingActionButton**
```dart
FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: const Icon(Icons.add),
)
```
**ทำไมใช้:** ปุ่มหลักที่ลอยอยู่ด้านล่างขวา สำหรับ action สำคัญ
**วิธีใช้:**
- `onPressed` function ที่จะทำงานเมื่อกด
- `tooltip` ข้อความแนะนำเมื่อกดค้าง
- `child` ไอคอนหรือข้อความในปุ่ม
- รูปทรงกลม มีเงา โดดเด่น

## Flow การทำงาน (How It Works)

```
1. แอปเริ่มต้น
   ↓
2. main() เรียก runApp(MyApp())
   ↓
3. MyApp สร้าง MaterialApp
   ↓
4. MaterialApp แสดง home: MyHomePage
   ↓
5. MyHomePage สร้าง _MyHomePageState
   ↓
6. _MyHomePageState.build() สร้าง UI
   ↓
7. ผู้ใช้กดปุ่ม FAB
   ↓
8. _incrementCounter() ถูกเรียก
   ↓
9. setState(() { _counter++; })
   ↓
10. build() ถูกเรียกใหม่
   ↓
11. UI อัปเดตแสดงเลขใหม่
```

## State Lifecycle

```dart
StatefulWidget                State Class
─────────────────            ─────────────
1. Constructor called         
2. createState() called  →   3. State created
                             4. initState() called [optional]
                             5. build() called - UI แสดง
                             
User กดปุ่ม
                             6. setState() called
                             7. build() called again - UI อัปเดต
                             
Widget ถูกลบ
                             8. dispose() called [optional]
                             9. State ถูกทำลาย
```

## Hot Reload - พัฒนาแบบรวดเร็ว

```bash
# ขณะที่แอปกำลังรัน:

1. แก้ไขโค้ด (เช่น เปลี่ยน 'Hello Flutter' เป็น 'สวัสดี Flutter')
2. บันทึกไฟล์ (Ctrl+S หรือ Cmd+S)
3. กด 'r' ในเทอร์มินัล
4. เห็นการเปลี่ยนแปลงทันที! (ไม่ต้อง restart)

# Hot Restart (รีเซ็ต state)
กด 'R' (ตัวพิมพ์ใหญ่) เมื่อต้องการ restart ทั้งแอป
```

## จุดเรียนรู้ (Learning Points)

1. ✅ **main() และ runApp()**
   - ทุกแอปเริ่มจาก main()
   - runApp() เริ่ม Flutter framework

2. ✅ **StatelessWidget vs StatefulWidget**
   - StatelessWidget ไม่มี state (ไม่เปลี่ยนแปลง)
   - StatefulWidget มี state (เปลี่ยนแปลงได้)

3. ✅ **State Class**
   - เก็บข้อมูลที่เปลี่ยนแปลง
   - มี build() สำหรับสร้าง UI

4. ✅ **setState()**
   - บอก Flutter ว่าข้อมูลเปลี่ยนแล้ว
   - ทำให้ UI อัปเดตอัตโนมัติ

5. ✅ **MaterialApp**
   - Widget หลักของแอป
   - ให้ Material Design และ theme

6. ✅ **Scaffold โครงสร้าง**
   - AppBar, Body, FloatingActionButton
   - โครงสร้างมาตรฐานของหน้าจอ

7. ✅ **Hot Reload**
   - เห็นการเปลี่ยนแปลงทันที
   - ไม่ต้อง restart แอป

## ลองปรับแต่ง (Try to Customize)

### 1. เปลี่ยนสีธีม
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),  // เปลี่ยนเป็นสีแดง
  useMaterial3: true,
)
```

### 2. เปลี่ยนข้อความ
```dart
const Text('คุณกดปุ่มไปแล้ว:'),  // เปลี่ยนเป็นภาษาไทย
```

### 3. เพิ่มปุ่มลบ
```dart
void _decrementCounter() {
  setState(() {
    if (_counter > 0) _counter--;
  });
}

// ใน build():
floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      onPressed: _decrementCounter,
      child: const Icon(Icons.remove),
    ),
    SizedBox(height: 10),
    FloatingActionButton(
      onPressed: _incrementCounter,
      child: const Icon(Icons.add),
    ),
  ],
)
```

### 4. เพิ่มการแสดงผลตามเงื่อนไข
```dart
Text(
  _counter == 0 ? 'เริ่มนับเลยครับ!' :
  _counter < 5 ? 'นับได้ดี' :
  _counter < 10 ? 'เก่งมาก' :
  'คุณกดปุ่มเยอะจัง!',
  style: TextStyle(fontSize: 18, color: Colors.grey),
)
```

## สรุป (Summary)

แอป Hello Flutter นี้แสดงให้เห็น:
- ✅ โครงสร้างพื้นฐานของแอป Flutter
- ✅ การใช้ main(), runApp(), MaterialApp
- ✅ ความแตกต่างระหว่าง StatelessWidget และ StatefulWidget
- ✅ การจัดการ state ด้วย State class และ setState()
- ✅ Scaffold, AppBar, Center, Column
- ✅ FloatingActionButton และ event handling
- ✅ Hot Reload สำหรับการพัฒนาที่รวดเร็ว

เหมาะเป็นแอป Flutter แรกสำหรับผู้เริ่มต้น!
