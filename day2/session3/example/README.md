# API Integration Demo

A comprehensive demonstration of REST API integration in Flutter using the http package and JSONPlaceholder API with detailed code explanations.

## 📋 What You'll Learn

This example teaches you:
- ✅ **HTTP Requests** - Making GET, POST, PUT, DELETE requests
- ✅ **JSON Parsing** - Converting between JSON and Dart objects
- ✅ **Data Models** - Creating type-safe model classes
- ✅ **Async/Await** - Handling asynchronous operations
- ✅ **FutureBuilder** - Displaying async data in widgets
- ✅ **Error Handling** - Managing network errors gracefully
- ✅ **Loading States** - Showing progress indicators
- ✅ **API Service** - Organizing API calls in one class

## 🎯 Features

### API Operations Demonstrated
1. **GET Requests** - Fetch users and posts from API
2. **POST Requests** - Create new posts
3. **Query Parameters** - Filter posts by specific user
4. **Error Handling** - Catch and display errors
5. **Loading States** - Show progress while fetching
6. **FutureBuilder** - Handle async data elegantly
7. **Retry Mechanism** - Let users retry failed requests

### Screens Included
- **🏠 Home** - Entry point with two navigation options
- **👥 Users List** - All users from API with profile info
- **📝 Posts List** - All posts with "Create Post" button
- **📄 User Posts** - Posts filtered by specific user

## 🚀 How to Run

### Prerequisites
- Flutter SDK installed
- Internet connection (required to fetch data from API)
- Device/emulator with internet access

### Step-by-Step Instructions

1. **Navigate to example directory:**
   ```bash
   cd day2/session3/example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
   
   This installs the `http` package (v1.1.0 or higher).
   You should see: `Got dependencies!`

3. **Run the app:**
   ```bash
   flutter run
   ```
   
   Make sure your device has internet connection!

### Expected Output

**Home Screen (First Screen):**
- 🌐 Large cloud icon
- Title: "API Integration Examples"
- Two navigation buttons:
  1. "View Users (GET)" - Demonstrates GET requests
  2. "View Posts (GET)" - Demonstrates GET and POST requests

**When You Click "View Users (GET)":**
1. Loading spinner appears while fetching
2. Users list displays with:
   - Circle avatar with first letter of name
   - Full name
   - Email address
   - Phone number
   - Arrow icon indicating tap action
3. If error occurs: Red error icon with retry button
4. Tap any user to see their posts

**When You Click on a User:**
- Shows user profile card at top:
  - Large avatar with name initial
  - Full name, email, website
- Lists all posts by that user below
- Each post shows title and full content
- Loading spinner while fetching posts

**When You Click "View Posts (GET)":**
1. Loading spinner appears
2. Posts list displays with:
   - Bold title
   - Body text (truncated to 2 lines)
   - User ID chip
3. Floating "+" button at bottom right
4. Tap "+" to create new post

**Create Post Dialog:**
- Title: "Create New Post"
- Two text fields:
  - Title input
  - Body input (multiline)
- "Cancel" and "Create" buttons
- On Create:
  - Sends POST request to API
  - Shows "Post created successfully!" message
  - Refreshes post list

**Loading States:**
- 🔄 Circular progress indicator in center
- Appears while waiting for API response
- Demonstrates async operation feedback

**Error States:**
- ❌ Red error icon (size 60)
- Error message explaining what went wrong
- "Retry" button to try again
- User-friendly error handling

**Empty States:**
- Shows "No users found" or "No posts found"
- Unlikely with JSONPlaceholder API

## 📁 Project Structure

```
lib/
├── main.dart                      # App entry and all UI screens
│   ├── MyApp                     # Root widget
│   ├── HomePage                  # Landing screen with navigation
│   ├── UsersListPage             # Displays list of users
│   ├── PostsListPage             # Displays and creates posts
│   └── UserPostsPage             # Shows user's posts
│
├── models/                        # Data models
│   ├── user.dart                 # User model class
│   │   ├── Properties: id, name, email, phone, website
│   │   ├── fromJson(): JSON → User object
│   │   └── toJson(): User object → JSON
│   │
│   └── post.dart                 # Post model class
│       ├── Properties: id, userId, title, body
│       ├── fromJson(): JSON → Post object
│       └── toJson(): Post object → JSON
│
└── services/                      # API service layer
    └── api_service.dart          # All HTTP requests
        ├── getUsers()            # GET all users
        ├── getUser(id)           # GET single user
        ├── getPosts()            # GET all posts
        ├── getPostsByUser(id)    # GET posts filtered by user
        ├── createPost(post)      # POST create new post
        ├── updatePost(post)      # PUT update post
        └── deletePost(id)        # DELETE remove post
```

## 🎓 Key Concepts Explained

### 1. HTTP Package Setup
```dart
// Add to pubspec.yaml:
dependencies:
  http: ^1.1.0

// Import in your file:
import 'package:http/http.dart' as http;
import 'dart:convert';  // For JSON parsing
```

### 2. Making GET Request
```dart
// Fetch data from API
final response = await http.get(Uri.parse('https://api.example.com/users'));

// Check if successful (status code 200)
if (response.statusCode == 200) {
  // Parse JSON response
  List<dynamic> jsonList = json.decode(response.body);
  // Convert to model objects
  List<User> users = jsonList.map((json) => User.fromJson(json)).toList();
}
```

### 3. Making POST Request
```dart
// Create new data
final response = await http.post(
  Uri.parse('https://api.example.com/posts'),
  headers: {'Content-Type': 'application/json'},
  body: json.encode(data.toJson()),
);

// 201 = Created (success for POST)
if (response.statusCode == 201) {
  // Parse created resource
  Post newPost = Post.fromJson(json.decode(response.body));
}
```

### 4. JSON Parsing with Models
```dart
// API returns JSON like: {"id": 1, "name": "John", "email": "john@example.com"}

// Convert JSON to Dart object:
Map<String, dynamic> json = json.decode(response.body);
User user = User.fromJson(json);
print(user.name); // "John"

// Convert Dart object to JSON:
Map<String, dynamic> json = user.toJson();
String jsonString = json.encode(json);
```

### 5. FutureBuilder Widget
```dart
FutureBuilder<List<User>>(
  // The Future that returns data
  future: apiService.getUsers(),
  
  // Builder function called when state changes
  builder: (context, snapshot) {
    // State 1: Loading
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    
    // State 2: Error
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    
    // State 3: Success - Data available
    List<User> users = snapshot.data!;
    return ListView(...);
  },
)
```

### 6. Error Handling Pattern
```dart
try {
  // Make API request
  final response = await http.get(url);
  
  // Check status code
  if (response.statusCode == 200) {
    // Success
    return parseData(response.body);
  } else {
    // API returned error status
    throw Exception('Failed: ${response.statusCode}');
  }
} catch (e) {
  // Network error, parsing error, etc.
  throw Exception('Error: $e');
}
```

## 🌐 API Used

**JSONPlaceholder** - Free fake REST API for testing and prototyping
- Website: https://jsonplaceholder.typicode.com/
- No authentication required
- Safe for learning and testing
- Returns realistic fake data

### Endpoints Used in This Example

| Endpoint | Method | Purpose | Example URL |
|----------|--------|---------|-------------|
| `/users` | GET | Get all users | `https://jsonplaceholder.typicode.com/users` |
| `/users/{id}` | GET | Get single user | `https://jsonplaceholder.typicode.com/users/1` |
| `/posts` | GET | Get all posts | `https://jsonplaceholder.typicode.com/posts` |
| `/posts?userId={id}` | GET | Get user's posts | `https://jsonplaceholder.typicode.com/posts?userId=1` |
| `/posts` | POST | Create new post | (with JSON body) |
| `/posts/{id}` | PUT | Update post | (with JSON body) |
| `/posts/{id}` | DELETE | Delete post | `https://jsonplaceholder.typicode.com/posts/1` |

**Response Examples:**

GET /users (User object):
```json
{
  "id": 1,
  "name": "Leanne Graham",
  "email": "leanne@april.biz",
  "phone": "1-770-736-8031",
  "website": "hildegard.org"
}
```

GET /posts (Post object):
```json
{
  "id": 1,
  "userId": 1,
  "title": "sunt aut facere repellat provident",
  "body": "quia et suscipit\nsuscipit..."
}
```

## 🎯 Learning Challenges

Try these modifications:

### Easy:
1. Add a "Refresh" button to reload the data
2. Show user count in Users List AppBar
3. Change the loading indicator color
4. Add a search bar (filter locally, no API)

### Medium:
5. Implement DELETE functionality for posts
6. Add pull-to-refresh on lists
7. Show post count for each user
8. Cache data locally with SharedPreferences
9. Add a "Favorites" feature

### Hard:
10. Implement pagination (load more on scroll)
11. Add offline mode detection
12. Implement proper error types (network, server, parsing)
13. Add unit tests for ApiService
14. Use Provider to manage API state
15. Implement optimistic updates

## 🐛 Troubleshooting

**Problem:** "SocketException: Failed host lookup"
- **Cause:** No internet connection or DNS issues
- **Solution:** Check device internet connection, try on different network

**Problem:** "Failed to load users: 404"
- **Cause:** Wrong API endpoint URL
- **Solution:** Verify the URL in ApiService matches exactly

**Problem:** "Type 'Null' is not a subtype of type 'String'"
- **Cause:** Missing field in JSON or model mismatch
- **Solution:** Check if API response matches model fields, use nullable types if needed

**Problem:** App freezes when loading data
- **Cause:** Probably not using async/await correctly
- **Solution:** Make sure to use `await` before API calls and `async` on function

**Problem:** "FormatException: Unexpected character"
- **Cause:** Invalid JSON response from API
- **Solution:** Print `response.body` to see what API actually returned

**Problem:** POST request always fails
- **Cause:** Missing headers or incorrect JSON encoding
- **Solution:** Ensure `Content-Type: application/json` header is set

## 📚 Related Documentation

- [HTTP Package](https://pub.dev/packages/http) - Official package docs
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/) - Free test API
- [Async Programming](https://dart.dev/codelabs/async-await) - Dart async guide
- [FutureBuilder](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html) - Widget docs
- [JSON Serialization](https://docs.flutter.dev/data-and-backend/json) - Flutter guide

## 💡 Next Steps

After mastering this example:
1. ✅ Try integrating a different public API
2. ✅ Learn about StreamBuilder for real-time data
3. ✅ Explore API authentication (OAuth, API keys)
4. ✅ Study advanced error handling strategies
5. ✅ Move to Session 4: Testing & Deployment
6. ✅ Learn about code generation (json_serializable package)
7. ✅ Explore GraphQL as an alternative to REST

---

**💙 Excellent work!** You now understand how to integrate real APIs into Flutter apps. This is a critical skill for building real-world applications!
