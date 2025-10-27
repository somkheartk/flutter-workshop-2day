# Counter App - แอปนับเลข

แอปพลิเคชันนับเลขที่มีฟีเจอร์ครบครัน พร้อมการเพิ่ม ลด และรีเซ็ตค่า

## คุณสมบัติ (Features)

- ✅ เพิ่มค่าตัวนับ (Increment)
- ✅ ลดค่าตัวนับ (Decrement) โดยป้องกันไม่ให้เป็นค่าติดลบ
- ✅ รีเซ็ตค่าตัวนับกลับเป็นศูนย์
- ✅ แสดงผลตัวนับแบบมีสไตล์

## วิธีรันแอป (How to Run)

```bash
# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run
```

## Widgets ที่ใช้และเหตุผล (Widgets Used & Why)

### 1. **MaterialApp** 
```dart
MaterialApp(
  title: 'Counter App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
  ),
  home: const CounterPage(),
)
```
**ทำไมใช้:** เป็น widget หลักของแอป Flutter ที่ให้ Material Design
**วิธีใช้:** 
- ใส่ `title` เป็นชื่อแอป
- กำหนด `theme` สำหรับสี และรูปแบบทั่วทั้งแอป
- ระบุ `home` เป็นหน้าแรกที่จะแสดง
- `useMaterial3: true` เพื่อใช้ Material Design 3 ที่ทันสมัย

### 2. **StatefulWidget (CounterPage)**
```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  
  @override
  State<CounterPage> createState() => _CounterPageState();
}
```
**ทำไมใช้:** เพราะค่าตัวนับต้องเปลี่ยนแปลงได้ตามการกดปุ่ม
**วิธีใช้:**
- สร้าง class ที่สืบทอดจาก `StatefulWidget`
- Override method `createState()` เพื่อสร้าง State object
- State object จะเก็บข้อมูลที่เปลี่ยนแปลงได้

### 3. **Scaffold**
```dart
Scaffold(
  appBar: AppBar(...),
  body: Center(...),
)
```
**ทำไมใช้:** เป็นโครงสร้างพื้นฐานของหน้าจอที่มี AppBar, Body, และพื้นที่อื่นๆ
**วิธีใช้:**
- ใส่ `appBar` สำหรับแถบด้านบน
- ใส่ `body` สำหรับเนื้อหาหลัก
- สามารถเพิ่ม `floatingActionButton`, `drawer`, `bottomNavigationBar` ได้

### 4. **AppBar**
```dart
AppBar(
  title: const Text('Enhanced Counter'),
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
)
```
**ทำไมใช้:** แสดงชื่อแอปและให้จุดอ้างอิงว่าอยู่หน้าไหน
**วิธีใช้:**
- ใส่ `title` เป็น widget Text หรืออื่นๆ
- ตั้ง `backgroundColor` เพื่อกำหนดสีพื้นหลัง
- สามารถเพิ่ม `actions` สำหรับปุ่มต่างๆ ด้านขวา

### 5. **Center**
```dart
Center(
  child: Column(...),
)
```
**ทำไมใช้:** จัดเนื้อหาให้อยู่ตรงกลางหน้าจอ
**วิธีใช้:**
- ใส่ widget ที่ต้องการให้อยู่กลางใน `child`
- Center จะจัดให้อยู่กลางทั้งแนวนอนและแนวตั้ง

### 6. **Column**
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(...),
    SizedBox(height: 20),
    Container(...),
    SizedBox(height: 40),
    Row(...),
  ],
)
```
**ทำไมใช้:** จัดเรียง widgets ในแนวตั้ง (จากบนลงล่าง)
**วิธีใช้:**
- `mainAxisAlignment: MainAxisAlignment.center` จัดให้อยู่กลางในแนวตั้ง
- ใส่ widgets ทั้งหมดใน `children` เป็น list
- ใช้ `SizedBox` เพื่อเว้นระยะห่างระหว่าง widgets

### 7. **Text**
```dart
Text(
  'You have pushed the button this many times:',
  style: TextStyle(fontSize: 18),
)
```
**ทำไมใช้:** แสดงข้อความให้ผู้ใช้อ่าน
**วิธีใช้:**
- ใส่ข้อความเป็น String
- ใช้ `style: TextStyle(...)` เพื่อกำหนดขนาดตัวอักษร สี และรูปแบบ

### 8. **Container**
```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Text('$_counter', ...),
)
```
**ทำไมใช้:** ตกแต่งและจัดการพื้นที่ของ widget ภายใน
**วิธีใช้:**
- `padding` เพิ่มช่องว่างภายใน
- `decoration` สำหรับกำหนดสี ขอบ เงา
- `BoxDecoration` ใช้สำหรับตกแต่งที่ซับซ้อนมากขึ้น
- `borderRadius` ทำให้มุมโค้งมน
- ใส่ widget ใน `child`

### 9. **BoxDecoration**
```dart
BoxDecoration(
  color: Colors.blue.shade100,
  borderRadius: BorderRadius.circular(15),
)
```
**ทำไมใช้:** ตกแต่ง Container ให้สวยงาม
**วิธีใช้:**
- `color` กำหนดสีพื้นหลัง
- `borderRadius` ทำมุมโค้ง
- สามารถเพิ่ม `border`, `boxShadow`, `gradient` ได้

### 10. **SizedBox**
```dart
const SizedBox(height: 20)
```
**ทำไมใช้:** สร้างช่องว่างระหว่าง widgets
**วิธีใช้:**
- ใส่ `height` สำหรับช่องว่างในแนวตั้ง
- ใส่ `width` สำหรับช่องว่างในแนวนอน
- เป็นวิธีที่ดีกว่าการใช้ `Padding` เมื่อต้องการแค่ช่องว่าง

### 11. **Row**
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    FloatingActionButton(...),
    SizedBox(width: 20),
    FloatingActionButton(...),
    SizedBox(width: 20),
    FloatingActionButton(...),
  ],
)
```
**ทำไมใช้:** จัดเรียง widgets ในแนวนอน (จากซ้ายไปขวา)
**วิธีใช้:**
- `mainAxisAlignment: MainAxisAlignment.center` จัดให้อยู่กลางในแนวนอน
- ใส่ widgets ทั้งหมดใน `children` เป็น list
- ใช้ `SizedBox(width:)` เพื่อเว้นระยะห่างระหว่างปุ่ม

### 12. **FloatingActionButton**
```dart
FloatingActionButton(
  onPressed: _incrementCounter,
  heroTag: 'increment',
  child: const Icon(Icons.add),
)
```
**ทำไมใช้:** ปุ่มหลักสำหรับการทำงานสำคัญ มีรูปทรงกลมเด่นชัด
**วิธีใช้:**
- `onPressed` รับ function ที่จะทำงานเมื่อกดปุ่ม
- `heroTag` จำเป็นเมื่อมี FAB หลายปุ่มในหน้าเดียว (ต้องไม่ซ้ำกัน)
- `child` ใส่ Icon หรือ widget อื่นๆ
- `backgroundColor` เปลี่ยนสีปุ่ม

### 13. **Icon**
```dart
Icon(Icons.add)
Icon(Icons.remove)
Icon(Icons.refresh)
```
**ทำไมใช้:** แสดงสัญลักษณ์ที่เข้าใจง่าย ไม่ต้องใช้คำอธิบาย
**วิธีใช้:**
- ใช้ `Icons.ชื่อไอคอน` จาก Material Icons
- สามารถกำหนด `size`, `color` ได้

### 14. **setState()**
```dart
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```
**ทำไมใช้:** บอก Flutter ว่าข้อมูลเปลี่ยนแล้วให้ refresh UI
**วิธีใช้:**
- เรียก `setState()` และใส่การเปลี่ยนแปลงข้อมูลใน closure
- Flutter จะเรียก `build()` อีกครั้งเพื่ออัปเดต UI
- ใช้เฉพาะใน StatefulWidget เท่านั้น

## แนวคิดหลัก (Key Concepts)

### 1. การจัดการ State (State Management)
```dart
class _CounterPageState extends State<CounterPage> {
  int _counter = 0;  // State variable
  
  void _incrementCounter() {
    setState(() {
      _counter++;  // Update state
    });
  }
}
```
- ประกาศตัวแปร state ใน State class
- เปลี่ยนค่าใน `setState()` เท่านั้น
- UI จะอัปเดตอัตโนมัติ

### 2. การจัดการหลายปุ่ม (Multiple Actions)
```dart
void _incrementCounter() { /* เพิ่ม */ }
void _decrementCounter() { /* ลด */ }
void _resetCounter() { /* รีเซ็ต */ }
```
- แยก function สำหรับแต่ละ action
- ง่ายต่อการดูแลและเพิ่มฟีเจอร์

### 3. การป้องกัน State ที่ไม่ถูกต้อง
```dart
void _decrementCounter() {
  setState(() {
    if (_counter > 0) {  // ตรวจสอบก่อน
      _counter--;
    }
  });
}
```
- ใส่เงื่อนไขเพื่อป้องกันค่าที่ไม่ถูกต้อง
- ในตัวอย่างนี้ป้องกันไม่ให้เป็นค่าติดลบ

### 4. การใช้ Theme
```dart
Theme.of(context).textTheme.headlineLarge
Theme.of(context).colorScheme.inversePrimary
```
- ใช้ Theme เพื่อให้รูปแบบสอดคล้องกันทั้งแอป
- เปลี่ยน Theme ที่เดียว ทั้งแอปเปลี่ยนตาม

## จุดเรียนรู้ (Learning Points)

1. ✅ **StatefulWidget vs StatelessWidget**
   - ใช้ StatefulWidget เมื่อมีข้อมูลที่เปลี่ยนแปลง
   - ใช้ StatelessWidget เมื่อแสดงผลคงที่

2. ✅ **การจัดการ State ด้วย setState()**
   - เรียก setState() เมื่อต้องการอัปเดต UI
   - ใส่การเปลี่ยนแปลงข้อมูลใน setState()

3. ✅ **Layout ด้วย Column และ Row**
   - Column สำหรับจัดในแนวตั้ง
   - Row สำหรับจัดในแนวนอน
   - ใช้ mainAxisAlignment และ crossAxisAlignment จัดตำแหน่ง

4. ✅ **การตกแต่ง Widget**
   - Container สำหรับกำหนดขนาดและตกแต่ง
   - BoxDecoration สำหรับสี ขอบ เงา
   - Padding และ SizedBox สำหรับจัดระยะห่าง

5. ✅ **การใช้หลาย FloatingActionButton**
   - ต้องกำหนด heroTag ที่ไม่ซ้ำกัน
   - ใช้ Row จัดเรียงในแนวนอน

6. ✅ **Best Practices**
   - ใช้ const เมื่อไม่มีการเปลี่ยนแปลง (ประหยัด memory)
   - แยก function ตาม action ที่ชัดเจน
   - ตั้งชื่อตัวแปรและ function ให้เข้าใจง่าย

## ลองปรับแต่ง (Try to Customize)

1. **เปลี่ยนสี:**
   ```dart
   backgroundColor: Colors.red  // เปลี่ยนจากน้ำเงินเป็นแดง
   ```

2. **เปลี่ยนขนาดตัวเลข:**
   ```dart
   style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)
   ```

3. **เพิ่มปุ่มเพิ่มทีละ 5:**
   ```dart
   void _incrementBy5() {
     setState(() {
       _counter += 5;
     });
   }
   ```

4. **เพิ่มเสียงเมื่อกดปุ่ม:**
   - ลองเพิ่ม package `audioplayers`
   - เล่นเสียงใน `_incrementCounter()`

## สรุป (Summary)

แอป Counter นี้แสดงให้เห็น:
- ✅ การใช้ StatefulWidget สำหรับข้อมูลที่เปลี่ยนแปลง
- ✅ การจัดการ state ด้วย setState()
- ✅ การจัด layout ด้วย Column และ Row
- ✅ การตกแต่ง UI ด้วย Container และ BoxDecoration
- ✅ การใช้ FloatingActionButton หลายปุ่ม
- ✅ การแสดงข้อความและไอคอน

เหมาะสำหรับผู้เริ่มต้นเรียนรู้ Flutter!
