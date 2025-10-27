# Todo List App - แอปรายการสิ่งที่ต้องทำ

แอปพลิเคชันจัดการรายการสิ่งที่ต้องทำง่ายๆ สำหรับเรียนรู้การจัดการ state และการทำงานกับ list

## คุณสมบัติ (Features)

- ✅ เพิ่ม todo ใหม่
- ✅ ทำเครื่องหมาย todo ว่าเสร็จแล้ว/ยังไม่เสร็จ
- ✅ ลบ todo
- ✅ แสดงข้อความเมื่อยังไม่มี todo (Empty state)
- ✅ ขีดฆ่า todo ที่เสร็จแล้ว

## วิธีรันแอป (How to Run)

```bash
# ติดตั้ง dependencies
flutter pub get

# รันแอป
flutter run
```

## Widgets ที่ใช้และเหตุผล (Widgets Used & Why)

### 1. **Model Class (Todo)**
```dart
class Todo {
  String title;
  bool isCompleted;
  
  Todo({required this.title, this.isCompleted = false});
}
```
**ทำไมใช้:** จัดระเบียบข้อมูลของ todo ให้อยู่ใน object เดียว
**วิธีใช้:**
- สร้าง class เก็บข้อมูลที่เกี่ยวข้อง
- กำหนด `required` สำหรับ parameter ที่จำเป็น
- ใส่ค่า default สำหรับ parameter ที่ไม่บังคับ
- ทำให้ code อ่านง่ายและจัดการข้อมูลสะดวก

### 2. **List<T> State**
```dart
final List<Todo> _todos = [];
```
**ทำไมใช้:** เก็บรายการ todo หลายๆ รายการ
**วิธีใช้:**
- ประกาศ `List<ชนิดข้อมูล>` สำหรับเก็บข้อมูลหลายตัว
- ใช้ `add()` เพิ่มข้อมูล
- ใช้ `removeAt(index)` ลบข้อมูล
- ใช้ `length` เช็คจำนวนข้อมูล

### 3. **TextEditingController**
```dart
final TextEditingController _textController = TextEditingController();

// ใช้กับ TextField
TextField(
  controller: _textController,
  ...
)

// เคลียร์ข้อความ
_textController.clear();

// ทำความสะอาดเมื่อไม่ใช้แล้ว
@override
void dispose() {
  _textController.dispose();
  super.dispose();
}
```
**ทำไมใช้:** จัดการ text input และควบคุมค่าใน TextField
**วิธีใช้:**
- สร้าง controller ใน State class
- ผูกกับ TextField ด้วย `controller` parameter
- อ่านค่าด้วย `_textController.text`
- เคลียร์ด้วย `_textController.clear()`
- **สำคัญ:** ต้อง dispose() เพื่อป้องกัน memory leak

### 4. **TextField**
```dart
TextField(
  controller: _textController,
  decoration: const InputDecoration(
    hintText: 'Enter a new todo',
    border: OutlineInputBorder(),
  ),
  onSubmitted: (_) => _addTodo(),
)
```
**ทำไมใช้:** รับข้อความจากผู้ใช้
**วิธีใช้:**
- `controller` ผูกกับ TextEditingController
- `decoration` กำหนดรูปแบบ (hint text, border)
- `hintText` ข้อความแนะนำ
- `border` รูปแบบเส้นขอบ
- `onSubmitted` ทำงานเมื่อกด Enter

### 5. **Expanded**
```dart
Row(
  children: [
    Expanded(
      child: TextField(...),  // ขยายเต็มพื้นที่ว่าง
    ),
    SizedBox(width: 10),
    ElevatedButton(...),  // ใช้พื้นที่เท่าที่ต้องการ
  ],
)
```
**ทำไมใช้:** ให้ widget ขยายเต็มพื้นที่ว่างที่เหลือใน Row หรือ Column
**วิธีใช้:**
- ครอบ widget ด้วย `Expanded`
- ใช้ใน Row หรือ Column
- หาก widget อื่นใช้พื้นที่แน่นอน Expanded จะขยายเต็มที่เหลือ
- ใช้ `flex` เพื่อกำหนดสัดส่วน (default = 1)

### 6. **ListView.builder**
```dart
ListView.builder(
  itemCount: _todos.length,
  itemBuilder: (context, index) {
    final todo = _todos[index];
    return Card(...);
  },
)
```
**ทำไมใช้:** แสดง list ของข้อมูลอย่างมีประสิทธิภาพ (สร้าง widget เมื่อจำเป็นเท่านั้น)
**วิธีใช้:**
- `itemCount` จำนวนรายการทั้งหมด
- `itemBuilder` function ที่สร้าง widget สำหรับแต่ละรายการ
- รับ `context` และ `index` เป็น parameters
- return widget ที่จะแสดงสำหรับรายการนั้น
- ประหยัดกว่า `ListView(children: [...])` เมื่อมีข้อมูลเยอะ

### 7. **ListTile**
```dart
ListTile(
  leading: Checkbox(...),      // ซ้ายสุด
  title: Text(...),            // กลาง
  trailing: IconButton(...),   // ขวาสุด
)
```
**ทำไมใช้:** Layout มาตรฐานสำหรับรายการใน list
**วิธีใช้:**
- `leading` widget ทางซ้าย (ไอคอน, รูป)
- `title` widget หลัก (ข้อความ)
- `subtitle` widget รอง (ข้อความเพิ่มเติม)
- `trailing` widget ทางขวา (ปุ่ม, ไอคอน)
- จัด layout ให้สวยงามอัตโนมัติ

### 8. **Checkbox**
```dart
Checkbox(
  value: todo.isCompleted,
  onChanged: (_) => _toggleTodo(index),
)
```
**ทำไมใช้:** ให้ผู้ใช้เลือก/ไม่เลือก (checked/unchecked)
**วิธีใช้:**
- `value` รับ boolean (true = checked, false = unchecked)
- `onChanged` callback เมื่อผู้ใช้กด
- รับ parameter ค่า boolean ใหม่
- ใช้ `(_)` เมื่อไม่ต้องการใช้ parameter

### 9. **Text with Decoration**
```dart
Text(
  todo.title,
  style: TextStyle(
    decoration: todo.isCompleted
        ? TextDecoration.lineThrough
        : null,
  ),
)
```
**ทำไมใช้:** แสดงสถานะของ todo ด้วยการขีดฆ่า
**วิธีใช้:**
- `decoration: TextDecoration.lineThrough` สำหรับขีดฆ่า
- ใช้ conditional (`? :`) เพื่อใส่ decoration ตามเงื่อนไข
- ตัวเลือกอื่น: `underline`, `overline`

### 10. **Conditional Rendering**
```dart
_todos.isEmpty
    ? const Center(
        child: Text('No todos yet!'),
      )
    : ListView.builder(...)
```
**ทำไมใช้:** แสดง UI ที่แตกต่างกันตามข้อมูล
**วิธีใช้:**
- ใช้ ternary operator (`condition ? widgetA : widgetB`)
- ตรวจสอบเงื่อนไข (เช่น `isEmpty`, `length > 0`)
- แสดง widget ที่เหมาะสมกับสถานการณ์

### 11. **IconButton**
```dart
IconButton(
  icon: const Icon(Icons.delete, color: Colors.red),
  onPressed: () => _deleteTodo(index),
)
```
**ทำไมใช้:** ปุ่มสำหรับ action ที่ไม่ต้องการข้อความ
**วิธีใช้:**
- `icon` กำหนด Icon ที่จะแสดง
- `onPressed` function เมื่อกด
- เหมาะสำหรับพื้นที่จำกัด

### 12. **dispose() Method**
```dart
@override
void dispose() {
  _textController.dispose();
  super.dispose();
}
```
**ทำไมใช้:** ทำความสะอาด resources เมื่อ widget ถูกลบออก
**วิธีใช้:**
- Override `dispose()` method
- เรียก `.dispose()` บน controllers และ listeners
- เรียก `super.dispose()` เป็นอันสุดท้าย
- **สำคัญมาก:** ป้องกัน memory leaks

## แนวคิดหลัก (Key Concepts)

### 1. การจัดการ List State
```dart
// เพิ่ม
setState(() {
  _todos.add(Todo(title: _textController.text));
});

// แก้ไข
setState(() {
  _todos[index].isCompleted = !_todos[index].isCompleted;
});

// ลบ
setState(() {
  _todos.removeAt(index);
});
```

### 2. การตรวจสอบข้อมูลก่อนเพิ่ม
```dart
void _addTodo() {
  if (_textController.text.isNotEmpty) {  // ตรวจสอบก่อน
    setState(() {
      _todos.add(Todo(title: _textController.text));
      _textController.clear();
    });
  }
}
```

### 3. การใช้ Model Class
```dart
// แบบไม่ใช้ Model (ไม่แนะนำ)
final List<String> _titles = [];
final List<bool> _completedStates = [];

// แบบใช้ Model (แนะนำ)
final List<Todo> _todos = [];
```

### 4. การเข้าถึง List ด้วย Index
```dart
// อ่านค่า
final todo = _todos[index];

// แก้ไข
_todos[index].isCompleted = true;

// ลบ
_todos.removeAt(index);
```

## จุดเรียนรู้ (Learning Points)

1. ✅ **การจัดการ List ด้วย setState()**
   - เพิ่มรายการด้วย `add()`
   - ลบรายการด้วย `removeAt(index)`
   - แก้ไขรายการโดยใช้ index

2. ✅ **การใช้ TextEditingController**
   - ควบคุมการป้อนข้อความ
   - อ่านค่าด้วย `.text`
   - เคลียร์ค่าด้วย `.clear()`
   - ต้อง dispose() เมื่อไม่ใช้

3. ✅ **การสร้าง Dynamic List ด้วย ListView.builder**
   - มีประสิทธิภาพกับข้อมูลจำนวนมาก
   - สร้าง widget เฉพาะที่แสดงบนหน้าจอ
   - ใช้ `itemCount` และ `itemBuilder`

4. ✅ **การสร้าง Model Classes**
   - จัดกลุ่มข้อมูลที่เกี่ยวข้อง
   - ทำให้ code อ่านง่ายขึ้น
   - ง่ายต่อการจัดการข้อมูลที่ซับซ้อน

5. ✅ **การจัดการ Resources ด้วย dispose()**
   - ทำความสะอาด controllers
   - ป้องกัน memory leaks
   - เรียก `super.dispose()` เสมอ

6. ✅ **Conditional UI**
   - แสดง Empty State เมื่อไม่มีข้อมูล
   - แสดง List เมื่อมีข้อมูล
   - ใช้ ternary operator

7. ✅ **Text Decoration**
   - ขีดฆ่าข้อความที่เสร็จแล้ว
   - เปลี่ยนรูปแบบตาม state

8. ✅ **Expanded Widget**
   - ให้ widget ขยายเต็มพื้นที่
   - ใช้ใน Row/Column

## ลองปรับแต่ง (Try to Customize)

1. **เพิ่มวันที่เวลา:**
   ```dart
   class Todo {
     String title;
     bool isCompleted;
     DateTime createdAt;
     
     Todo({
       required this.title, 
       this.isCompleted = false,
       DateTime? createdAt,
     }) : createdAt = createdAt ?? DateTime.now();
   }
   ```

2. **เพิ่มการเรียงลำดับ:**
   ```dart
   // เรียงตามสถานะ (ยังไม่เสร็จก่อน)
   _todos.sort((a, b) => a.isCompleted ? 1 : -1);
   ```

3. **เพิ่มการแก้ไข Todo:**
   - แสดง Dialog เมื่อกด title
   - มี TextField สำหรับแก้ไข
   - บันทึกและอัปเดต

4. **เพิ่มหมวดหมู่:**
   - เพิ่ม `category` ใน Todo class
   - Filter ตามหมวดหมู่
   - แสดงสีต่างกันตามหมวดหมู่

5. **บันทึกข้อมูล:**
   - ใช้ `shared_preferences` package
   - บันทึกเมื่อเปลี่ยนแปลง
   - โหลดเมื่อเปิดแอป

6. **เพิ่ม Animation:**
   - ใช้ `AnimatedList`
   - แอนิเมชันเมื่อเพิ่ม/ลบ

## ปัญหาที่พบบ่อยและวิธีแก้ (Common Issues)

### 1. ลืม dispose() TextEditingController
```dart
// ❌ ไม่ดี - จะเกิด memory leak
class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textController = TextEditingController();
  // ไม่มี dispose()
}

// ✅ ดี
class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textController = TextEditingController();
  
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
```

### 2. ลืมใส่ setState()
```dart
// ❌ ไม่ดี - UI ไม่อัปเดต
void _addTodo() {
  _todos.add(Todo(title: _textController.text));
}

// ✅ ดี
void _addTodo() {
  setState(() {
    _todos.add(Todo(title: _textController.text));
  });
}
```

### 3. ลืมตรวจสอบ empty string
```dart
// ❌ ไม่ดี - เพิ่ม todo ว่างได้
void _addTodo() {
  setState(() {
    _todos.add(Todo(title: _textController.text));
  });
}

// ✅ ดี
void _addTodo() {
  if (_textController.text.isNotEmpty) {
    setState(() {
      _todos.add(Todo(title: _textController.text));
    });
  }
}
```

## สรุป (Summary)

แอป Todo List นี้แสดงให้เห็น:
- ✅ การจัดการ List state ด้วย add, update, remove
- ✅ การใช้ TextEditingController สำหรับ input
- ✅ การสร้าง dynamic list ด้วย ListView.builder
- ✅ การสร้าง Model class สำหรับข้อมูล
- ✅ การ dispose resources อย่างถูกต้อง
- ✅ การแสดง Conditional UI (empty state)
- ✅ การใช้ Text decoration
- ✅ การใช้ Expanded ใน Row

เหมาะสำหรับเรียนรู้การทำงานกับ list และ user input!
