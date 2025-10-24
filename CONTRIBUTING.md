# Contributing to Flutter Workshop

Thank you for your interest in contributing to this Flutter workshop!

## 🤝 How to Contribute

### Reporting Issues

- Use the GitHub issue tracker
- Provide clear descriptions
- Include code examples if applicable
- Mention your Flutter version

### Suggesting Improvements

- Content improvements
- Additional exercises
- Better examples
- Typo fixes
- Translation (especially Thai language)

### Code Examples

When contributing code examples:

1. **Test your code**: Ensure it runs without errors
2. **Follow Flutter conventions**: Use proper formatting
3. **Add comments**: Explain complex concepts
4. **Keep it simple**: Focus on teaching the concept
5. **Include error handling**: Show best practices

### Documentation

- Use clear, concise language
- Include both English and Thai where appropriate
- Add code examples
- Link to official documentation

## 📝 Content Guidelines

### Workshop Material

- **Beginner-friendly**: Assume minimal prior knowledge
- **Progressive**: Build on previous concepts
- **Practical**: Include hands-on exercises
- **Complete**: Provide working code examples

### Code Style

```dart
// Good: Clear, commented, well-formatted
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
class U{String n;int a;U(this.n,this.a);Map t(){return{'name':n,'age':a};}}
```

## 🌐 Localization

We welcome translations, especially Thai (ไทย):

- Translate section titles
- Translate explanations
- Keep code examples universal
- Maintain both languages when possible

## 🐛 Bug Reports

Include:
- Workshop section (Day X, Session Y)
- What you expected
- What actually happened
- Flutter version (`flutter --version`)
- Steps to reproduce

## ✨ Feature Requests

Suggest:
- New topics to cover
- Additional exercises
- Better explanations
- Real-world examples

## 📋 Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### PR Checklist

- [ ] Code runs without errors
- [ ] Documentation updated
- [ ] Examples tested
- [ ] Follows existing style
- [ ] Clear commit messages

## 🎓 Workshop Structure

```
flutter-workshop-2day/
├── README.md           # Overview
├── day1/              # Day 1 content
│   ├── session1/      # Each session
│   ├── session2/
│   ├── session3/
│   ├── session4/
│   └── exercises/     # Practice exercises
├── day2/              # Day 2 content
│   └── ...
├── projects/          # Complete projects
└── resources/         # Additional materials
```

## 📚 Resources for Contributors

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Markdown Guide](https://www.markdownguide.org/)

## 💬 Communication

- **Issues**: Technical problems or questions
- **Discussions**: General questions or ideas
- **Pull Requests**: Code or content contributions

## 🙏 Thank You

Every contribution helps make this workshop better for learners worldwide!

---

**Happy Contributing! 🚀**
