# Session 3: API Integration & Data

## 📖 Overview

Learn how to fetch data from APIs and handle asynchronous operations.

---

## 🎯 Learning Objectives

- Make HTTP requests
- Parse JSON data
- Use FutureBuilder
- Store data locally

---

## 1. HTTP Package

### Installation

```yaml
dependencies:
  http: ^1.1.0
```

### Making Requests

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// GET request
Future<void> fetchData() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
}

// POST request
Future<void> createPost() async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'title': 'New Post',
      'body': 'Content',
      'userId': 1,
    }),
  );
}
```

---

## 2. JSON Parsing

### Create Model Class

```dart
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

// Parse list
List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
```

---

## 3. FutureBuilder

```dart
class PostsScreen extends StatelessWidget {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    
    if (response.statusCode == 200) {
      return parsePosts(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
```

---

## 4. SharedPreferences

### Installation

```yaml
dependencies:
  shared_preferences: ^2.2.0
```

### Usage

```dart
import 'package:shared_preferences/shared_preferences.dart';

// Save data
Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', 'John');
  await prefs.setInt('age', 25);
  await prefs.setBool('isLoggedIn', true);
}

// Read data
Future<String?> readData() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

// Delete data
Future<void> deleteData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}
```

---

## 5. Complete Weather App Example

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _city = 'Bangkok';
  
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    // Using a free weather API (example)
    final response = await http.get(
      Uri.parse('https://api.weatherapi.com/v1/current.json?key=YOUR_KEY&q=$city'),
    );
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchWeather(_city),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final weather = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_city, style: TextStyle(fontSize: 32)),
                  Text('${weather['current']['temp_c']}°C',
                       style: TextStyle(fontSize: 48)),
                  Text(weather['current']['condition']['text']),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading weather'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
```

---

## 💻 Hands-on Exercise

Build a news reader app:
- Fetch news from JSONPlaceholder
- Display in ListView
- Show details on tap
- Add pull-to-refresh
- Save favorites locally

---

## 📚 Resources

- [HTTP Package](https://pub.dev/packages/http)
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)

---

[← Back to Day 2](../README.md) | [Next: Testing & Deployment →](../session4/README.md)
