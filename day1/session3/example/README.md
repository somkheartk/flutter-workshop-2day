# Widgets Demo - ตัวอย่าง Widgets พื้นฐาน

แอปพลิเคชันสาธิตการใช้งาน Flutter widgets และ layouts พื้นฐานสำหรับ Session 3

## คุณสมบัติ (Features)

- ✅ Card widget พร้อม gradient background
- ✅ Row layout สำหรับจัดเรียงแนวนอน
- ✅ Column layout สำหรับจัดเรียงแนวตั้ง
- ✅ ListView สำหรับรายการที่เลื่อนได้
- ✅ Container styling พร้อมการตกแต่งต่างๆ
- ✅ Material Design icons
- ✅ ปุ่มหลายประเภท (ElevatedButton, OutlinedButton, IconButton)
- ✅ Text styling หลากหลาย
- ✅ SnackBar สำหรับแสดงข้อความชั่วคราว

## วิธีรันแอป (How to Run)

```bash
# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run
```

## Widgets ที่ใช้และเหตุผล (Widgets Used & Why)

### 1. **Scaffold**
```dart
Scaffold(
  appBar: AppBar(...),
  body: SingleChildScrollView(...),
  floatingActionButton: FloatingActionButton(...),
)
```
**ทำไมใช้:** โครงสร้างพื้นฐานของหน้าจอ Material Design
**วิธีใช้:**
- `appBar` แถบด้านบนของหน้าจอ
- `body` เนื้อหาหลัก
- `floatingActionButton` ปุ่มลอยด้านล่างขวา
- สามารถเพิ่ม `drawer`, `bottomNavigationBar` ได้

### 2. **SingleChildScrollView**
```dart
SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(...),
  ),
)
```
**ทำไมใช้:** ทำให้เนื้อหาเลื่อนได้เมื่อยาวเกินหน้าจอ
**วิธีใช้:**
- ครอบ widget ที่ต้องการให้เลื่อนได้
- เหมาะกับเนื้อหาที่มี child เดียว (Column, Container)
- ป้องกัน overflow error

### 3. **Card**
```dart
Card(
  elevation: 5,
  child: Column(...),
)
```
**ทำไมใช้:** สร้างพื้นที่แยกส่วนที่มีเงา ตาม Material Design
**วิธีใช้:**
- `elevation` ความสูงของเงา (0-24)
- ครอบเนื้อหาที่ต้องการจัดกลุ่ม
- ทำให้ UI ดูเป็นระเบียบ มีมิติ
- ใช้ `shape` เพื่อปรับแต่งมุม

### 4. **Container with Gradient**
```dart
Container(
  height: 200,
  width: double.infinity,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue.shade400, Colors.purple.shade400],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Center(...),
)
```
**ทำไมใช้:** สร้าง background สวยงามด้วยการไล่สี
**วิธีใช้:**
- `double.infinity` ขยายเต็มความกว้างที่มี
- `LinearGradient` ไล่สีเป็นเส้นตรง
- `begin` และ `end` กำหนดทิศทาง
- `colors` รายการสีที่ต้องการไล่

**ตัวเลือก Gradient อื่นๆ:**
- `RadialGradient` - ไล่สีเป็นวงกลม
- `SweepGradient` - ไล่สีเป็นส่วนโค้ง

### 5. **Column with crossAxisAlignment**
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Card(...),
    SizedBox(height: 20),
    Text(...),
  ],
)
```
**ทำไมใช้:** จัดเรียง widgets ในแนวตั้ง
**วิธีใช้:**
- `crossAxisAlignment: CrossAxisAlignment.stretch` ขยายเต็มความกว้าง
- ตัวเลือกอื่น: `start`, `center`, `end`
- `mainAxisAlignment` จัดในแนวตั้ง
- ใส่ widgets ใน `children` list

### 6. **ElevatedButton.icon**
```dart
ElevatedButton.icon(
  onPressed: () { /* action */ },
  icon: const Icon(Icons.thumb_up),
  label: const Text('Like'),
)
```
**ทำไมใช้:** ปุ่มหลักที่มีทั้งไอคอนและข้อความ
**วิธีใช้:**
- `icon` ไอคอนที่แสดงด้านซ้าย
- `label` ข้อความด้านขวา
- `onPressed` function เมื่อกดปุ่ม
- มีเงาและ elevation

### 7. **OutlinedButton.icon**
```dart
OutlinedButton.icon(
  onPressed: () { /* action */ },
  icon: const Icon(Icons.share),
  label: const Text('Share'),
)
```
**ทำไมใช้:** ปุ่มรองที่มีแค่ขอบ (ไม่มีพื้นหลังทึบ)
**วิธีใช้:**
- ใช้เหมือน ElevatedButton
- เหมาะสำหรับ action รอง
- ไม่มีเงา มีแค่เส้นขอบ

### 8. **Row with mainAxisAlignment**
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _buildIconColumn(Icons.favorite, 'Favorite', Colors.red),
    _buildIconColumn(Icons.star, 'Star', Colors.amber),
    _buildIconColumn(Icons.share, 'Share', Colors.blue),
  ],
)
```
**ทำไมใช้:** จัดเรียง widgets ในแนวนอน
**วิธีใช้:**
- `mainAxisAlignment: MainAxisAlignment.spaceAround` กระจายช่องว่างรอบๆ
- ตัวเลือกอื่น: `spaceBetween`, `spaceEvenly`, `center`
- `crossAxisAlignment` จัดในแนวตั้ง
- เหมาะสำหรับปุ่ม icon bar, navigation

### 9. **CircleAvatar**
```dart
CircleAvatar(
  backgroundColor: Colors.blue,
  child: Text('1'),
)
```
**ทำไมใช้:** แสดงรูปหรือไอคอนเป็นวงกลม
**วิธีใช้:**
- ใส่ Text, Icon หรือ Image ใน `child`
- `backgroundColor` สีพื้นหลัง
- `radius` ขนาดของวงกลม
- `backgroundImage` สำหรับใส่รูป

### 10. **ListTile**
```dart
ListTile(
  leading: CircleAvatar(...),
  title: Text('Item 1'),
  subtitle: Text('Description'),
  trailing: IconButton(...),
)
```
**ทำไมใช้:** Layout มาตรฐานสำหรับรายการใน list
**วิธีใช้:**
- `leading` widget ทางซ้าย (รูป, ไอคอน)
- `title` ข้อความหลัก
- `subtitle` ข้อความรอง
- `trailing` widget ทางขวา (ปุ่ม, ไอคอน)
- `onTap` action เมื่อกดที่รายการ

### 11. **Container Styling**
```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.blue, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Column(...),
)
```
**ทำไมใช้:** ตกแต่ง widget ด้วยสี ขอบ เงา และมุมโค้ง
**วิธีใช้:**
- `padding` ช่องว่างภายใน
- `decoration: BoxDecoration` สำหรับการตกแต่ง
- `borderRadius` ทำมุมโค้ง
- `border` เส้นขอบ
- `boxShadow` เงา

**BoxShadow Properties:**
- `color` สีของเงา
- `blurRadius` ความเบลอ
- `offset` ตำแหน่งของเงา (x, y)
- `spreadRadius` ขนาดการกระจาย

### 12. **List.generate**
```dart
...List.generate(5, (index) {
  return Card(...);
})
```
**ทำไมใช้:** สร้าง widgets หลายๆ ตัวแบบอัตโนมัติ
**วิธีใช้:**
- `...` spread operator เพื่อใส่ list ใน children
- `List.generate(จำนวน, (index) => widget)`
- `index` เริ่มจาก 0
- เหมาะกับรายการที่มีรูปแบบเดียวกัน

### 13. **ScaffoldMessenger & SnackBar**
```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Liked!')),
)
```
**ทำไมใช้:** แสดงข้อความแจ้งเตือนชั่วคราวด้านล่างหน้าจอ
**วิธีใช้:**
- เรียก `ScaffoldMessenger.of(context).showSnackBar()`
- ใส่ข้อความใน `content`
- หายไปอัตโนมัติหลังไม่กี่วินาที
- สามารถเพิ่ม `action` สำหรับปุ่ม

### 14. **Custom Widget Methods**
```dart
Widget _buildIconColumn(IconData icon, String label, Color color) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: color, size: 40),
      const SizedBox(height: 8),
      Text(label),
    ],
  );
}
```
**ทำไมใช้:** แยก UI ที่ใช้ซ้ำเป็น method
**วิธีใช้:**
- สร้าง method ที่ return Widget
- รับ parameters ที่แตกต่างกัน
- `mainAxisSize: MainAxisSize.min` ใช้พื้นที่แค่พอดี
- เรียกใช้หลายครั้งได้

## แนวคิดหลัก (Key Concepts)

### 1. Layout Hierarchy
```
Scaffold
└── body: SingleChildScrollView
    └── Padding
        └── Column (main axis: vertical)
            ├── Card
            │   └── Column
            │       ├── Container (gradient)
            │       └── Padding
            │           └── Column
            │               ├── Text
            │               └── Row (buttons)
            ├── Card
            │   └── Row (icons)
            ├── List.generate
            │   └── Card
            │       └── ListTile
            └── Container (styled)
```

### 2. MainAxisAlignment vs CrossAxisAlignment
```dart
// Row (แนวนอน)
Row(
  mainAxisAlignment: MainAxisAlignment.center,    // จัดในแนวนอน
  crossAxisAlignment: CrossAxisAlignment.start,   // จัดในแนวตั้ง
  children: [...],
)

// Column (แนวตั้ง)
Column(
  mainAxisAlignment: MainAxisAlignment.center,    // จัดในแนวตั้ง
  crossAxisAlignment: CrossAxisAlignment.stretch, // จัดในแนวนอน
  children: [...],
)
```

### 3. EdgeInsets Types
```dart
// เว้นระยะทุกด้านเท่ากัน
EdgeInsets.all(16.0)

// เว้นระยะแนวนอนและตั้ง
EdgeInsets.symmetric(horizontal: 16, vertical: 8)

// เว้นระยะเฉพาะด้านที่ต้องการ
EdgeInsets.only(left: 16, top: 8)

// เว้นระยะแต่ละด้าง (ซ้าย, บน, ขวา, ล่าง)
EdgeInsets.fromLTRB(10, 20, 10, 20)
```

### 4. BoxDecoration Features
```dart
BoxDecoration(
  color: Colors.white,              // สีพื้นหลัง
  gradient: LinearGradient(...),    // ไล่สี
  border: Border.all(...),          // เส้นขอบ
  borderRadius: BorderRadius.circular(15), // มุมโค้ง
  boxShadow: [...],                 // เงา
  shape: BoxShape.circle,           // รูปร่าง (circle/rectangle)
)
```

## จุดเรียนรู้ (Learning Points)

1. ✅ **Scaffold โครงสร้างพื้นฐาน**
   - ใช้เป็นฐานของหน้าจอทุกหน้า
   - มี AppBar, Body, FAB

2. ✅ **Card จัดกลุ่มเนื้อหา**
   - มีเงาให้ความรู้สึกมีมิติ
   - จัดกลุ่มข้อมูลที่เกี่ยวข้อง

3. ✅ **Row และ Column Layout**
   - Row จัดแนวนอน
   - Column จัดแนวตั้ง
   - ใช้ alignment ปรับตำแหน่ง

4. ✅ **Container Styling**
   - ตกแต่งด้วย BoxDecoration
   - มีขอบ, เงา, สี, gradient

5. ✅ **ListTile สำหรับรายการ**
   - Layout มาตรฐาน
   - มี leading, title, subtitle, trailing

6. ✅ **Custom Widget Methods**
   - แยก UI ที่ซ้ำเป็น methods
   - ลด code ซ้ำซ้อน

7. ✅ **SnackBar Feedback**
   - แสดงข้อความชั่วคราว
   - ให้ feedback แก่ผู้ใช้

## ลองปรับแต่ง (Try to Customize)

### 1. เปลี่ยนสี Gradient
```dart
gradient: LinearGradient(
  colors: [Colors.orange.shade400, Colors.pink.shade400],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
)
```

### 2. เพิ่มไอคอนใน Row
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _buildIconColumn(Icons.home, 'Home', Colors.blue),
    _buildIconColumn(Icons.search, 'Search', Colors.green),
    _buildIconColumn(Icons.person, 'Profile', Colors.orange),
    _buildIconColumn(Icons.settings, 'Settings', Colors.purple),
  ],
)
```

### 3. ปรับแต่ง Container Shadow
```dart
boxShadow: [
  BoxShadow(
    color: Colors.blue.withOpacity(0.3),
    blurRadius: 10,
    spreadRadius: 2,
    offset: const Offset(0, 5),
  ),
]
```

### 4. เพิ่ม Animation
```dart
// ใช้ AnimatedContainer แทน Container
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  padding: EdgeInsets.all(isExpanded ? 30 : 20),
  decoration: BoxDecoration(...),
)
```

### 5. เพิ่ม onTap ที่ ListTile
```dart
ListTile(
  leading: CircleAvatar(...),
  title: Text('Item ${index + 1}'),
  subtitle: Text('Tap to see details'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen()),
    );
  },
)
```

## Material Design Guidelines

### Elevation Levels
- `elevation: 0` - ไม่มีเงา (flat)
- `elevation: 1-4` - เงาเล็กน้อย (cards, chips)
- `elevation: 6-8` - เงาปานกลาง (FAB, menus)
- `elevation: 12+` - เงามาก (dialogs, sheets)

### Spacing Standards
- `4.0` - ระยะห่างน้อยมาก
- `8.0` - ระยะห่างเล็ก
- `16.0` - ระยะห่างมาตรฐาน
- `24.0` - ระยะห่างใหญ่
- `32.0` - ระยะห่างใหญ่มาก

### Border Radius Guidelines
- `4.0` - มุมโค้งเล็กน้อย
- `8.0` - มุมโค้งปานกลาง
- `12.0-16.0` - มุมโค้งมาตรฐาน
- `20.0+` - มุมโค้งมาก

## สรุป (Summary)

แอป Widgets Demo นี้แสดงให้เห็น:
- ✅ การใช้ Scaffold เป็นโครงสร้างพื้นฐาน
- ✅ การจัดกลุ่มด้วย Card
- ✅ การจัด layout ด้วย Row และ Column
- ✅ การตกแต่ง Container ด้วย BoxDecoration
- ✅ การใช้ gradient สำหรับพื้นหลัง
- ✅ การสร้างรายการด้วย ListTile
- ✅ การแสดง feedback ด้วย SnackBar
- ✅ การสร้าง custom widget methods
- ✅ Material Design principles

เหมาะสำหรับเรียนรู้ widgets และ layouts พื้นฐานของ Flutter!
