# API Integration Demo

A comprehensive demonstration of REST API integration in Flutter using the http package and JSONPlaceholder API.

## Features

### API Operations Demonstrated
1. **GET Requests** - Fetch users and posts
2. **POST Requests** - Create new posts
3. **Query Parameters** - Filter posts by user
4. **Error Handling** - Handle network and API errors
5. **Loading States** - Show progress indicators
6. **FutureBuilder** - Handle asynchronous data

### Screens
- **Home** - Entry point with navigation options
- **Users List** - Display all users fetched from API
- **Posts List** - Display all posts with create functionality
- **User Posts** - Show posts filtered by specific user

## How to Run

```bash
flutter pub get
flutter run
```

**Note:** This app requires internet connection to fetch data from the API.

## API Used

This demo uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/) - a free fake API for testing and prototyping.

### Endpoints Used
- `GET /users` - Fetch all users
- `GET /users/{id}` - Fetch single user
- `GET /posts` - Fetch all posts
- `GET /posts?userId={id}` - Fetch posts by user
- `POST /posts` - Create new post

## Key Concepts

### HTTP Package
```dart
import 'package:http/http.dart' as http;

// GET request
final response = await http.get(Uri.parse(url));

// POST request
final response = await http.post(
  Uri.parse(url),
  headers: {'Content-Type': 'application/json'},
  body: json.encode(data),
);
```

### JSON Parsing
```dart
// Decode JSON
Map<String, dynamic> json = json.decode(response.body);

// Create model from JSON
User user = User.fromJson(json);

// Encode to JSON
String jsonString = json.encode(user.toJson());
```

### FutureBuilder
```dart
FutureBuilder<List<User>>(
  future: fetchUsers(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    return ListView(children: ...);
  },
)
```

## Project Structure

```
lib/
├── main.dart              # App entry and UI screens
├── models/
│   ├── user.dart         # User model with fromJson/toJson
│   └── post.dart         # Post model with fromJson/toJson
└── services/
    └── api_service.dart  # API service with HTTP methods
```

## Learning Points

1. Making HTTP requests (GET, POST, PUT, DELETE)
2. Parsing JSON responses
3. Creating model classes with fromJson/toJson
4. Using FutureBuilder for async data
5. Handling loading and error states
6. Implementing retry mechanisms
7. Creating reusable API service classes
8. Query parameters in API calls
9. Error handling and user feedback
10. Separation of concerns (models, services, UI)

## Error Handling

The app demonstrates proper error handling:
- Try-catch blocks for network errors
- Status code checking
- User-friendly error messages
- Retry functionality
- Loading indicators

## Best Practices

1. **Separate API logic** - ApiService class
2. **Model classes** - Type-safe data structures
3. **Error handling** - Comprehensive error management
4. **Loading states** - User feedback during operations
5. **Code organization** - Clear project structure
