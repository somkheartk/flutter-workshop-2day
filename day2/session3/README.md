# Session 3: API Integration & Data

## 📖 Overview

Learn how to connect your Flutter app to REST APIs, handle asynchronous operations, parse JSON data, and persist information locally. This session transforms your app from static to dynamic!

**Duration:** 2 hours  
**Difficulty:** Intermediate

---

## 🎯 Learning Objectives

After this session, you will be able to:

### Core Concepts
- ✅ **REST APIs**: Understand RESTful architecture and HTTP methods
- ✅ **Async Programming**: Master async/await and Future handling
- ✅ **JSON**: Parse and serialize JSON data
- ✅ **Error Handling**: Handle network errors gracefully

### Practical Skills
- 🌐 **HTTP Requests**: Make GET, POST, PUT, DELETE requests
- 📦 **Data Models**: Create model classes with serialization
- ⚡ **FutureBuilder**: Display async data in widgets
- 💾 **Local Storage**: Save and retrieve data with SharedPreferences
- 🔄 **State Management**: Integrate API data with Provider

### Output Goals
- 🎯 Build a weather app with real API
- 🎯 Create a posts list with CRUD operations
- 🎯 Implement offline data caching

---

## 🗺️ Session Flow

```
Part 1: HTTP Basics (30 min)
├─ Install http package
├─ Make GET requests
├─ Handle responses
└─ Error handling
        ↓
Part 2: JSON Parsing (25 min)
├─ Create model classes
├─ fromJson() & toJson()
├─ Parse lists
└─ Nested objects
        ↓
Part 3: Async UI (30 min)
├─ FutureBuilder widget
├─ Loading states
├─ Error states
└─ StreamBuilder (bonus)
        ↓
Part 4: Local Storage (20 min)
├─ SharedPreferences
├─ Save/Load data
└─ Cache strategies
        ↓
Hands-on Project (15 min)
└─ Build complete API app
```

---

## 📚 Complete API Integration Workflow

### End-to-End Flow

```
1. Install Package
   ↓
2. Define API Endpoint
   ↓
3. Create Data Model
   ↓
4. Create Service Class
   ↓
5. Make HTTP Request
   ↓
6. Parse JSON Response
   ↓
7. Handle Errors
   ↓
8. Display in UI (FutureBuilder)
   ↓
9. Add Loading/Error States
   ↓
10. Cache Locally (Optional)
```

### Visual Request Flow

```
Your Flutter App
      ↓ (HTTP Request)
   Internet
      ↓
   API Server
      ↓ (JSON Response)
   Your App
      ↓ (Parse JSON)
   Dart Objects
      ↓ (Update UI)
   Widget Display
```

---

## 1. HTTP Package Setup & Basics

### 📦 Installation Process

**Step 1: Add Dependency**
```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0        # ← Add this line
```

**Step 2: Install**
```bash
# Run in terminal
flutter pub get

# You should see:
# Running "flutter pub get" in your_project...
# Got dependencies!
```

**Step 3: Import**
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';  // For JSON parsing
```

### 🌐 Understanding HTTP Methods

```
HTTP Methods (REST API):
├─ GET     → Retrieve data (Read)
├─ POST    → Create new data (Create)
├─ PUT     → Update entire resource (Update)
├─ PATCH   → Update partial resource (Partial Update)
└─ DELETE  → Remove data (Delete)
```

### 🔄 Making HTTP Requests

#### GET Request - Fetch Data

**Basic Flow:**
```
1. Create URI
   ↓
2. Make async GET request
   ↓
3. Check status code
   ↓
4. Parse response body
   ↓
5. Return data or throw error
```

**Simple Example:**
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

// Step 1: Create async function
Future<void> fetchData() async {
  // Step 2: Define API endpoint
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  
  // Step 3: Make GET request
  final response = await http.get(url);
  
  // Step 4: Check status code
  if (response.statusCode == 200) {
    // Success! Parse JSON
    List<dynamic> data = jsonDecode(response.body);
    print('Received ${data.length} posts');
    print(data[0]); // First post
  } else {
    // Failed
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}
```

**Complete Example with Error Handling:**
```dart
Future<List<dynamic>> fetchPosts() async {
  try {
    // 1. Create URI
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    
    // 2. Make request with timeout
    final response = await http.get(url).timeout(
      Duration(seconds: 10),
      onTimeout: () {
        throw Exception('Request timed out');
      },
    );
    
    // 3. Check status code
    if (response.statusCode == 200) {
      // Success
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else if (response.statusCode == 500) {
      throw Exception('Server error');
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching posts: $e');
    rethrow;
  }
}
```

#### POST Request - Create Data

**Flow:**
```
1. Prepare data (Map)
   ↓
2. Convert to JSON string
   ↓
3. Set headers
   ↓
4. Make POST request
   ↓
5. Check response
```

**Example:**
```dart
Future<Map<String, dynamic>> createPost({
  required String title,
  required String body,
  required int userId,
}) async {
  // 1. API endpoint
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  
  // 2. Prepare data
  final postData = {
    'title': title,
    'body': body,
    'userId': userId,
  };
  
  // 3. Make POST request
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(postData),
  );
  
  // 4. Check response
  if (response.statusCode == 201) {  // 201 = Created
    // Success! Parse response
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create post');
  }
}

// Usage:
// await createPost(
//   title: 'My New Post',
//   body: 'This is the content',
//   userId: 1,
// );
```

#### PUT Request - Update Data

```dart
Future<Map<String, dynamic>> updatePost({
  required int id,
  required String title,
  required String body,
}) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  
  final response = await http.put(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'id': id,
      'title': title,
      'body': body,
      'userId': 1,
    }),
  );
  
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to update post');
  }
}
```

#### DELETE Request - Remove Data

```dart
Future<void> deletePost(int id) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
  
  final response = await http.delete(url);
  
  if (response.statusCode == 200) {
    print('Post deleted successfully');
  } else {
    throw Exception('Failed to delete post');
  }
}
```

### 🎯 Complete CRUD Service Class

**Organized API Service:**
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Base URL
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  // GET - Fetch all posts
  static Future<List<dynamic>> getPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
  
  // GET - Fetch single post
  static Future<Map<String, dynamic>> getPost(int id) async {
    final url = Uri.parse('$baseUrl/posts/$id');
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
  
  // POST - Create post
  static Future<Map<String, dynamic>> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId': userId,
      }),
    );
    
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create post');
    }
  }
  
  // PUT - Update post
  static Future<Map<String, dynamic>> updatePost({
    required int id,
    required String title,
    required String body,
  }) async {
    final url = Uri.parse('$baseUrl/posts/$id');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': id,
        'title': title,
        'body': body,
        'userId': 1,
      }),
    );
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }
  
  // DELETE - Remove post
  static Future<void> deletePost(int id) async {
    final url = Uri.parse('$baseUrl/posts/$id');
    final response = await http.delete(url);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}

// Usage Examples:
// List<dynamic> posts = await ApiService.getPosts();
// Map<String, dynamic> post = await ApiService.getPost(1);
// await ApiService.createPost(title: 'New', body: 'Content', userId: 1);
// await ApiService.updatePost(id: 1, title: 'Updated', body: 'New content');
// await ApiService.deletePost(1);
```

### ⚠️ Error Handling Best Practices

**Complete Error Handling:**
```dart
Future<List<dynamic>> fetchDataWithErrorHandling() async {
  try {
    final url = Uri.parse('https://api.example.com/data');
    
    final response = await http.get(url).timeout(
      Duration(seconds: 10),
    );
    
    // Check different status codes
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad request - Check your parameters');
      case 401:
        throw Exception('Unauthorized - Check API key');
      case 404:
        throw Exception('Not found - Check URL');
      case 500:
        throw Exception('Server error - Try again later');
      default:
        throw Exception('Unexpected error: ${response.statusCode}');
    }
  } on TimeoutException {
    throw Exception('Connection timeout - Check your internet');
  } on SocketException {
    throw Exception('No internet connection');
  } on FormatException {
    throw Exception('Bad response format');
  } catch (e) {
    throw Exception('Unknown error: $e');
  }
}
```

---

## 2. JSON Parsing & Data Models

### 📊 Understanding JSON

**JSON (JavaScript Object Notation)** - Standard format for API data exchange

**JSON Structure:**
```json
{
  "id": 1,
  "title": "Hello World",
  "completed": false,
  "tags": ["flutter", "dart"],
  "author": {
    "name": "John",
    "email": "john@example.com"
  }
}
```

**Maps to Dart:**
```dart
Map<String, dynamic> {
  'id': 1,
  'title': 'Hello World',
  'completed': false,
  'tags': ['flutter', 'dart'],
  'author': {
    'name': 'John',
    'email': 'john@example.com'
  }
}
```

### 🏗️ Creating Model Classes

**Why Model Classes?**
- ✅ Type safety
- ✅ Autocomplete in IDE
- ✅ Easier to maintain
- ✅ Better error catching

**Flow:**
```
1. Analyze JSON structure
   ↓
2. Define class properties
   ↓
3. Create constructor
   ↓
4. Add fromJson() factory
   ↓
5. Add toJson() method
```

### 📝 Simple Model Example

**JSON Data:**
```json
{
  "id": 1,
  "title": "Learn Flutter",
  "body": "Flutter is awesome!",
  "userId": 1
}
```

**Dart Model:**
```dart
class Post {
  // 1. Define properties (match JSON keys)
  final int id;
  final String title;
  final String body;
  final int userId;

  // 2. Constructor
  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  // 3. Factory constructor - JSON to Dart
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );
  }

  // 4. Method - Dart to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
  
  // 5. toString for debugging (optional but useful)
  @override
  String toString() {
    return 'Post(id: $id, title: $title)';
  }
}
```

**Usage:**
```dart
// JSON String → Dart Object
String jsonString = '{"id": 1, "title": "Hello", "body": "World", "userId": 1}';
Map<String, dynamic> jsonMap = jsonDecode(jsonString);
Post post = Post.fromJson(jsonMap);
print(post.title); // "Hello"

// Dart Object → JSON String
Post myPost = Post(id: 2, title: 'New', body: 'Post', userId: 1);
Map<String, dynamic> map = myPost.toJson();
String jsonOutput = jsonEncode(map);
print(jsonOutput); // {"id":2,"title":"New",...}
```

### 📋 Parsing Lists

**JSON Array:**
```json
[
  {"id": 1, "title": "Post 1", "body": "Content 1", "userId": 1},
  {"id": 2, "title": "Post 2", "body": "Content 2", "userId": 1},
  {"id": 3, "title": "Post 3", "body": "Content 3", "userId": 2}
]
```

**Parse to List of Objects:**
```dart
// Method 1: Manual parsing
List<Post> parsePostsManual(String responseBody) {
  final List<dynamic> jsonList = jsonDecode(responseBody);
  List<Post> posts = [];
  
  for (var jsonItem in jsonList) {
    posts.add(Post.fromJson(jsonItem));
  }
  
  return posts;
}

// Method 2: Using map (recommended)
List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

// Method 3: Compact version
List<Post> parsePostsCompact(String responseBody) {
  return (jsonDecode(responseBody) as List)
      .map((json) => Post.fromJson(json))
      .toList();
}

// Usage in API call:
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
```

### 🎯 Complex Model with Nested Objects

**JSON with Nested Data:**
```json
{
  "id": 1,
  "title": "Learn Flutter",
  "author": {
    "name": "John Doe",
    "email": "john@example.com",
    "avatar": "https://example.com/avatar.jpg"
  },
  "tags": ["flutter", "mobile", "dart"],
  "metadata": {
    "views": 1000,
    "likes": 50,
    "published": "2025-01-15T10:30:00Z"
  }
}
```

**Dart Models:**
```dart
// Author model
class Author {
  final String name;
  final String email;
  final String avatar;

  Author({
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }
}

// Metadata model
class Metadata {
  final int views;
  final int likes;
  final DateTime published;

  Metadata({
    required this.views,
    required this.likes,
    required this.published,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      views: json['views'],
      likes: json['likes'],
      published: DateTime.parse(json['published']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'views': views,
      'likes': likes,
      'published': published.toIso8601String(),
    };
  }
}

// Main Article model
class Article {
  final int id;
  final String title;
  final Author author;           // Nested object
  final List<String> tags;       // Array
  final Metadata metadata;       // Nested object

  Article({
    required this.id,
    required this.title,
    required this.author,
    required this.tags,
    required this.metadata,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      author: Author.fromJson(json['author']),              // Parse nested
      tags: List<String>.from(json['tags']),                 // Parse array
      metadata: Metadata.fromJson(json['metadata']),         // Parse nested
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author.toJson(),          // Convert nested
      'tags': tags,
      'metadata': metadata.toJson(),      // Convert nested
    };
  }
}

// Usage:
// String jsonString = '...'; // Your JSON data
// Map<String, dynamic> jsonMap = jsonDecode(jsonString);
// Article article = Article.fromJson(jsonMap);
// print(article.author.name);
// print(article.tags.length);
// print(article.metadata.views);
```

### ✨ Handling Nullable Fields

**JSON with optional fields:**
```json
{
  "id": 1,
  "title": "Post Title",
  "description": null,
  "imageUrl": "https://example.com/image.jpg"
}
```

**Model with null safety:**
```dart
class Post {
  final int id;
  final String title;
  final String? description;      // Nullable
  final String? imageUrl;         // Nullable

  Post({
    required this.id,
    required this.title,
    this.description,              // Optional
    this.imageUrl,                 // Optional
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],  // Can be null
      imageUrl: json['imageUrl'],        // Can be null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      if (description != null) 'description': description,  // Only if not null
      if (imageUrl != null) 'imageUrl': imageUrl,           // Only if not null
    };
  }
}
```

### 🛠️ JSON Generation Tools

**Online Tools (Recommended for Complex JSON):**
- [QuickType](https://app.quicktype.io/) - Paste JSON, get Dart models
- [JSON to Dart](https://javiercbk.github.io/json_to_dart/) - Simple converter

**VS Code Extension:**
- "Paste JSON as Code" extension

**Example Usage:**
1. Copy your JSON response
2. Paste into tool
3. Get generated Dart code
4. Copy to your project
5. Customize as needed

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
