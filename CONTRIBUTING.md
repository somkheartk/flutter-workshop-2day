# Contributing to Flutter Workshop
# การมีส่วนร่วมในการพัฒนา Flutter Workshop

Thank you for your interest in contributing to this Flutter workshop!

ขอบคุณที่สนใจมีส่วนร่วมในการพัฒนา Flutter workshop นี้!

## 🤝 How to Contribute / วิธีการมีส่วนร่วม

### Reporting Issues / รายงานปัญหา

- Use the GitHub issue tracker / ใช้ระบบ issue tracker ของ GitHub
- Provide clear descriptions / ให้คำอธิบายที่ชัดเจน
- Include code examples if applicable / แนบตัวอย่างโค้ด (ถ้ามี)
- Mention your Flutter version / ระบุเวอร์ชัน Flutter ที่คุณใช้

### Suggesting Improvements / เสนอแนะการปรับปรุง

- Content improvements / ปรับปรุงเนื้อหา
- Additional exercises / เพิ่มแบบฝึกหัด
- Better examples / ตัวอย่างที่ดีขึ้น
- Typo fixes / แก้ไขข้อผิดพลาด
- Translation (especially Thai language) / การแปลภาษา (โดยเฉพาะภาษาไทย)

### Code Examples / ตัวอย่างโค้ด

When contributing code examples:

เมื่อมีส่วนร่วมในการเขียนตัวอย่างโค้ด:

1. **Test your code**: Ensure it runs without errors / **ทดสอบโค้ด**: ตรวจสอบให้แน่ใจว่ารันได้โดยไม่มีข้อผิดพลาด
2. **Follow Flutter conventions**: Use proper formatting / **ปฏิบัติตามมาตรฐาน Flutter**: ใช้การจัดรูปแบบที่ถูกต้อง
3. **Add comments**: Explain complex concepts / **เพิ่มคอมเมนต์**: อธิบายแนวคิดที่ซับซ้อน
4. **Keep it simple**: Focus on teaching the concept / **ทำให้เรียบง่าย**: เน้นการสอนแนวคิด
5. **Include error handling**: Show best practices / **รวมการจัดการข้อผิดพลาด**: แสดงแนวทางปฏิบัติที่ดี

### Documentation / เอกสาร

- Use clear, concise language / ใช้ภาษาที่ชัดเจนและกระชับ
- Include both English and Thai where appropriate / รวมทั้งภาษาอังกฤษและภาษาไทยตามความเหมาะสม
- Add code examples / เพิ่มตัวอย่างโค้ด
- Link to official documentation / เชื่อมโยงไปยังเอกสารทางการ

## 📝 Content Guidelines / แนวทางเนื้อหา

### Workshop Material / เนื้อหาเวิร์กช็อป

- **Beginner-friendly**: Assume minimal prior knowledge / **เหมาะสำหรับผู้เริ่มต้น**: สมมติว่ามีความรู้พื้นฐานน้อยที่สุด
- **Progressive**: Build on previous concepts / **ก้าวหน้าต่อเนื่อง**: สร้างบนพื้นฐานของแนวคิดก่อนหน้า
- **Practical**: Include hands-on exercises / **ปฏิบัติจริง**: รวมแบบฝึกหัดแบบลงมือทำ
- **Complete**: Provide working code examples / **สมบูรณ์**: มีตัวอย่างโค้ดที่ใช้งานได้จริง

### Code Style / รูปแบบโค้ด

```dart
// Good: Clear, commented, well-formatted
// ดี: ชัดเจน มีคอมเมนต์ จัดรูปแบบดี
class UserModel {
  final String name;
  final int age;
  
  UserModel({required this.name, required this.age});
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

// Avoid: Uncommented, unclear
// หลีกเลี่ยง: ไม่มีคอมเมนต์ ไม่ชัดเจน
class U{String n;int a;U(this.n,this.a);Map t(){return{'name':n,'age':a};}}
```

## 🌐 Localization / การแปลภาษา

We welcome translations, especially Thai (ไทย):

เรายินดีรับการแปลภาษา โดยเฉพาะภาษาไทย:

- Translate section titles / แปลหัวข้อต่างๆ
- Translate explanations / แปลคำอธิบาย
- Keep code examples universal / รักษาตัวอย่างโค้ดให้เป็นสากล
- Maintain both languages when possible / รักษาทั้งสองภาษาเมื่อเป็นไปได้

## 🐛 Bug Reports / รายงานข้อบกพร่อง

Include / ควรระบุ:
- Workshop section (Day X, Session Y) / ส่วนของเวิร์กช็อป (วันที่ X, เซสชัน Y)
- What you expected / สิ่งที่คุณคาดหวัง
- What actually happened / สิ่งที่เกิดขึ้นจริง
- Flutter version (`flutter --version`) / เวอร์ชัน Flutter
- Steps to reproduce / ขั้นตอนการทำซ้ำ

## ✨ Feature Requests / ขอฟีเจอร์ใหม่

Suggest / เสนอแนะ:
- New topics to cover / หัวข้อใหม่ที่ควรครอบคลุม
- Additional exercises / แบบฝึกหัดเพิ่มเติม
- Better explanations / คำอธิบายที่ดีขึ้น
- Real-world examples / ตัวอย่างในโลกจริง

## 📋 Pull Request Process / ขั้นตอนการส่ง Pull Request

1. **Fork** the repository / **Fork** โปรเจกต์
2. **Create** a feature branch / **สร้าง** branch สำหรับฟีเจอร์ (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes / **Commit** การเปลี่ยนแปลง (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch / **Push** ไปยัง branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request / **เปิด** Pull Request

### PR Checklist / รายการตรวจสอบ PR

- [ ] Code runs without errors / โค้ดรันได้โดยไม่มีข้อผิดพลาด
- [ ] Documentation updated / อัปเดตเอกสารแล้ว
- [ ] Examples tested / ทดสอบตัวอย่างแล้ว
- [ ] Follows existing style / ปฏิบัติตามรูปแบบที่มีอยู่
- [ ] Clear commit messages / ข้อความ commit ชัดเจน

## 🎓 Workshop Structure / โครงสร้างเวิร์กช็อป

```
flutter-workshop-2day/
├── README.md           # Overview / ภาพรวม
├── day1/              # Day 1 content / เนื้อหาวันที่ 1
│   ├── session1/      # Each session / แต่ละเซสชัน
│   ├── session2/
│   ├── session3/
│   ├── session4/
│   └── exercises/     # Practice exercises / แบบฝึกหัด
├── day2/              # Day 2 content / เนื้อหาวันที่ 2
│   └── ...
├── projects/          # Complete projects / โปรเจกต์สมบูรณ์
└── resources/         # Additional materials / เอกสารเพิ่มเติม
```

## 📚 Resources for Contributors / แหล่งข้อมูลสำหรับผู้มีส่วนร่วม

- [Flutter Documentation](https://docs.flutter.dev/) - เอกสาร Flutter
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style) - คู่มือรูปแบบ Dart
- [Markdown Guide](https://www.markdownguide.org/) - คู่มือ Markdown

## 💬 Communication / การสื่อสาร

- **Issues**: Technical problems or questions / ปัญหาทางเทคนิคหรือคำถาม
- **Discussions**: General questions or ideas / คำถามทั่วไปหรือแนวคิด
- **Pull Requests**: Code or content contributions / การมีส่วนร่วมด้านโค้ดหรือเนื้อหา

## 🙏 Thank You / ขอบคุณ

Every contribution helps make this workshop better for learners worldwide!

การมีส่วนร่วมทุกครั้งช่วยทำให้เวิร์กช็อปนี้ดีขึ้นสำหรับผู้เรียนทั่วโลก!

---

**Happy Contributing! 🚀**

**มีส่วนร่วมอย่างมีความสุข! 🚀**
