# Profile Card App - แอปการ์ดโปรไฟล์

แอปพลิเคชันแสดงโปรไฟล์ผู้ใช้แบบโต้ตอบได้ พร้อมระบบติดตาม/เลิกติดตามและการอัปเดตจำนวนผู้ติดตามแบบไดนามิก

## คุณสมบัติ (Features)

- ✅ Header โปรไฟล์พร้อม gradient background
- ✅ แสดงสถิติ (โพสต์, ผู้ติดตาม, กำลังติดตาม)
- ✅ ปุ่มติดตาม/เลิกติดตามพร้อมการจัดการ state
- ✅ อัปเดตจำนวนผู้ติดตามแบบ real-time
- ✅ ส่วนแสดงประวัติ (About section)
- ✅ ข้อมูลติดต่อ
- ✅ ปุ่ม Social Media

## วิธีรันแอป (How to Run)

```bash
# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run
```

## Widgets ที่ใช้และเหตุผล (Widgets Used & Why)

### 1. **SingleChildScrollView**
```dart
SingleChildScrollView(
  child: Column(...),
)
```
**ทำไมใช้:** เพื่อให้เนื้อหาสามารถเลื่อนได้เมื่อยาวเกินหน้าจอ
**วิธีใช้:**
- ครอบ widget หลักด้วย SingleChildScrollView
- เหมาะกับเนื้อหาที่มี child เดียว (เช่น Column)
- ทำให้ไม่เกิด overflow error เมื่อเนื้อหายาว

### 2. **Container with Gradient**
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue.shade400,
        Colors.blue.shade700,
      ],
    ),
  ),
  child: Column(...),
)
```
**ทำไมใช้:** สร้าง background ที่สวยงามด้วยการไล่สี
**วิธีใช้:**
- ใช้ `LinearGradient` ใน `BoxDecoration`
- กำหนด `begin` และ `end` สำหรับทิศทางการไล่สี
- ใส่สีหลายๆ สีใน `colors` list
- สามารถใช้ `RadialGradient` หรือ `SweepGradient` ได้เช่นกัน

### 3. **CircleAvatar**
```dart
CircleAvatar(
  radius: 60,
  backgroundColor: Colors.white,
  child: Icon(
    Icons.person,
    size: 80,
    color: Colors.blue,
  ),
)
```
**ทำไมใช้:** แสดงรูปโปรไฟล์แบบวงกลม (รูปแบบมาตรฐานของ social media)
**วิธีใช้:**
- `radius` กำหนดขนาดของวงกลม
- `backgroundColor` สีพื้นหลัง
- ใส่ `child` เป็น Icon หรือ Image
- สามารถใช้ `backgroundImage: NetworkImage('url')` สำหรับโหลดรูปจากอินเทอร์เน็ต

### 4. **Row with mainAxisAlignment**
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _buildStatItem('Posts', '142'),
    _buildStatItem('Followers', '$_followerCount'),
    _buildStatItem('Following', '289'),
  ],
)
```
**ทำไมใช้:** จัดเรียงสถิติให้กระจายอย่างสม่ำเสมอ
**วิธีใช้:**
- `mainAxisAlignment: MainAxisAlignment.spaceAround` กระจายช่องว่างรอบๆ
- ตัวเลือกอื่นๆ: `spaceBetween`, `spaceEvenly`, `center`, `start`, `end`
- เหมาะสำหรับแสดงข้อมูลที่ต้องการให้กระจายเท่าๆ กัน

### 5. **ElevatedButton**
```dart
ElevatedButton(
  onPressed: _toggleFollow,
  style: ElevatedButton.styleFrom(
    backgroundColor: _isFollowing ? Colors.grey : Colors.blue,
    padding: const EdgeInsets.symmetric(vertical: 15),
  ),
  child: Text(
    _isFollowing ? 'Following' : 'Follow',
    style: const TextStyle(fontSize: 16),
  ),
)
```
**ทำไมใช้:** ปุ่มหลักที่มีความสำคัญ มีเงาและยกสูง
**วิธีใช้:**
- `onPressed` function ที่จะทำงานเมื่อกด
- `style: ElevatedButton.styleFrom()` กำหนดรูปแบบ
- `backgroundColor` เปลี่ยนสีตาม state
- ใช้ conditional (`? :`) เพื่อเปลี่ยนสีและข้อความตาม state

### 6. **Card**
```dart
Card(
  elevation: 2,
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(...),
  ),
)
```
**ทำไมใช้:** จัดกลุ่มข้อมูลที่เกี่ยวข้องด้วยกล่องที่มีเงา ดูเป็นระเบียบ
**วิธีใช้:**
- `elevation` กำหนดความสูงของเงา (0-24)
- ครอบ content ด้วย `Padding` เพื่อเว้นระยะขอบ
- ใช้ `shape` เพื่อกำหนดรูปร่างของมุม
- เหมาะสำหรับแสดงข้อมูลที่เป็นหมวดหมู่

### 7. **SnackBar**
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(_isFollowing ? 'Following!' : 'Unfollowed'),
    duration: const Duration(seconds: 1),
  ),
)
```
**ทำไมใช้:** แสดงข้อความแจ้งเตือนชั่วคราวที่ด้านล่างหน้าจอ
**วิธีใช้:**
- เรียก `ScaffoldMessenger.of(context).showSnackBar()`
- ใส่ `content` เป็นข้อความที่ต้องการแสดง
- `duration` กำหนดระยะเวลาแสดง
- สามารถเพิ่ม `action` สำหรับปุ่ม เช่น "Undo"

### 8. **IconButton**
```dart
IconButton(
  icon: Icon(icon),
  color: color,
  iconSize: 35,
  onPressed: () {
    // Action
  },
)
```
**ทำไมใช้:** ปุ่มที่แสดงเป็นไอคอนอย่างเดียว เหมาะสำหรับ social media links
**วิธีใช้:**
- `icon` กำหนด Icon ที่จะแสดง
- `color` สีของไอคอน
- `iconSize` ขนาดของไอคอน
- `onPressed` action เมื่อกด

### 9. **Padding**
```dart
Padding(
  padding: const EdgeInsets.all(20),
  child: Widget(...),
)
```
**ทำไมใช้:** เพิ่มช่องว่างรอบๆ widget
**วิธีใช้:**
- `EdgeInsets.all(20)` เว้นระยะทุกด้านเท่ากัน
- `EdgeInsets.symmetric(horizontal: 20, vertical: 10)` เว้นแนวนอนและตั้ง
- `EdgeInsets.only(left: 10, top: 20)` เว้นเฉพาะด้านที่ระบุ
- `EdgeInsets.fromLTRB(left, top, right, bottom)` กำหนดแต่ละด้าน

### 10. **Custom Widget Methods**
```dart
Widget _buildStatItem(String label, String value) {
  return Column(
    children: [
      Text(value, style: TextStyle(...)),
      Text(label, style: TextStyle(...)),
    ],
  );
}
```
**ทำไมใช้:** แยก UI ที่ใช้ซ้ำเป็น method เพื่อลด code ซ้ำ
**วิธีใช้:**
- สร้าง method ที่ return Widget
- รับ parameters ที่แตกต่างกัน
- เรียกใช้หลายครั้งได้
- ทำให้โค้ดสะอาดและดูแลรักษาง่าย

## แนวคิดหลัก (Key Concepts)

### 1. Boolean State Management
```dart
bool _isFollowing = false;

void _toggleFollow() {
  setState(() {
    _isFollowing = !_isFollowing;  // สลับค่า true/false
  });
}
```
- ใช้ boolean สำหรับ state ที่มี 2 สถานะ
- ใช้ `!` เพื่อสลับค่า

### 2. Related State Updates
```dart
void _toggleFollow() {
  setState(() {
    _isFollowing = !_isFollowing;
    _followerCount += _isFollowing ? 1 : -1;  // อัปเดตตามสถานะ
  });
}
```
- อัปเดตหลาย state พร้อมกันใน setState()
- ใช้ conditional operator เพื่อคำนวณค่า

### 3. Conditional UI
```dart
backgroundColor: _isFollowing ? Colors.grey : Colors.blue
child: Text(_isFollowing ? 'Following' : 'Follow')
```
- เปลี่ยน UI ตาม state
- ใช้ ternary operator (`? :`)

### 4. String Interpolation
```dart
Text('$_followerCount')  // แปลงตัวเลขเป็น String
```
- ใช้ `$variableName` เพื่อใส่ค่าตัวแปรใน String
- ใช้ `${expression}` สำหรับ expression ที่ซับซ้อน

## จุดเรียนรู้ (Learning Points)

1. ✅ **การจัดการ Boolean State**
   - ใช้สำหรับสถานะแบบ on/off, true/false
   - สลับค่าด้วย `!variable`

2. ✅ **การอัปเดต Related Data**
   - อัปเดตหลายค่าพร้อมกันใน setState()
   - รักษาความสัมพันธ์ระหว่างข้อมูล

3. ✅ **การสร้าง Visually Appealing UI**
   - ใช้ gradient สำหรับพื้นหลังสวยงาม
   - จัดกลุ่มข้อมูลด้วย Card
   - เว้นระยะห่างที่เหมาะสม

4. ✅ **การใช้ Gradient**
   - LinearGradient สำหรับไล่สีเป็นเส้นตรง
   - กำหนดทิศทางและจำนวนสี

5. ✅ **User Feedback ด้วย SnackBar**
   - แจ้งเตือนผู้ใช้เมื่อทำ action
   - หายไปอัตโนมัติตามเวลาที่กำหนด

6. ✅ **Reusable Widget Methods**
   - แยก UI ที่ซ้ำเป็น methods
   - ลดโค้ดซ้ำซ้อน
   - ง่ายต่อการดูแลรักษา

7. ✅ **การใช้ SingleChildScrollView**
   - ป้องกันปัญหา overflow
   - ทำให้เนื้อหาเลื่อนได้

## ลองปรับแต่ง (Try to Customize)

1. **เปลี่ยนสี Gradient:**
   ```dart
   colors: [
     Colors.purple.shade400,
     Colors.pink.shade700,
   ]
   ```

2. **เพิ่มรูปโปรไฟล์จาก Network:**
   ```dart
   CircleAvatar(
     radius: 60,
     backgroundImage: NetworkImage('https://...'),
   )
   ```

3. **เพิ่ม Animation เมื่อกดปุ่ม:**
   - ใช้ `AnimatedContainer` แทน `Container`
   - เพิ่ม `duration` parameter

4. **เพิ่มส่วนแสดง Posts:**
   - สร้าง `ListView` แสดงรูปภาพ
   - ใช้ `GridView` สำหรับ gallery

5. **เพิ่มการทำงานจริงของ Social Media:**
   - ใช้ `url_launcher` package
   - เปิด URL เมื่อกดปุ่ม social media

## สรุป (Summary)

แอป Profile Card นี้แสดงให้เห็น:
- ✅ การจัดการ boolean state และ related data
- ✅ การสร้าง UI สวยงามด้วย gradient และ Card
- ✅ การใช้ CircleAvatar สำหรับรูปโปรไฟล์
- ✅ การแสดง feedback ด้วย SnackBar
- ✅ การสร้าง reusable widget methods
- ✅ การใช้ SingleChildScrollView สำหรับเนื้อหายาว
- ✅ การจัด layout แบบซับซ้อนด้วย Column และ Row

เหมาะสำหรับเรียนรู้การสร้าง UI ที่สวยงามและโต้ตอบได้!
