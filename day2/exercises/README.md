# Day 2 Exercises

Complete these advanced exercises to master state management, navigation, and API integration.

---

## Exercise 1: Todo App with Provider

### Objective
Create a complete Todo application using Provider for state management.

### Requirements

**Features:**
- [ ] Add new todos
- [ ] Mark todos as complete/incomplete
- [ ] Delete todos
- [ ] Edit existing todos
- [ ] Filter by status (All, Active, Completed)
- [ ] Show todo count
- [ ] Persist data using SharedPreferences

**State Management:**
- [ ] Use Provider for state management
- [ ] Create TodoModel with ChangeNotifier
- [ ] Implement proper state updates

### Starter Code

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  
  int get totalCount => _todos.length;
  int get activeCount => _todos.where((t) => !t.isCompleted).length;
  int get completedCount => _todos.where((t) => t.isCompleted).length;

  // TODO: Implement methods
  // - addTodo(String title)
  // - toggleTodo(String id)
  // - deleteTodo(String id)
  // - updateTodo(String id, String newTitle)
  // - saveTodos() - save to SharedPreferences
  // - loadTodos() - load from SharedPreferences
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MyApp(),
    ),
  );
}

// TODO: Implement your app
```

---

## Exercise 2: News Reader App

### Objective
Create a news reader app that fetches articles from an API.

### Requirements

- [ ] Fetch news from JSONPlaceholder or News API
- [ ] Display articles in a ListView
- [ ] Show article details on a separate screen
- [ ] Implement pull-to-refresh
- [ ] Show loading indicator
- [ ] Handle errors gracefully
- [ ] Add favorite/bookmark functionality
- [ ] Save favorites locally

### API Endpoint

Use JSONPlaceholder:
```
https://jsonplaceholder.typicode.com/posts
```

### Data Model

```dart
class Article {
  final int id;
  final String title;
  final String body;
  bool isFavorite;

  Article({
    required this.id,
    required this.title,
    required this.body,
    this.isFavorite = false,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
```

### Screens to Implement

1. **Home Screen**: List of articles
2. **Detail Screen**: Full article content
3. **Favorites Screen**: Bookmarked articles

---

## Exercise 3: E-Commerce App (Complete Project)

### Objective
Build a complete e-commerce app combining all concepts learned.

### Requirements

**Features:**
- [ ] Product catalog with images
- [ ] Product categories
- [ ] Shopping cart
- [ ] Add/remove items from cart
- [ ] Quantity adjustment
- [ ] Total price calculation
- [ ] Checkout screen
- [ ] Order history (stored locally)
- [ ] Search functionality
- [ ] Product details page
- [ ] Bottom navigation (Home, Cart, Profile)

**Technical Requirements:**
- [ ] Use Provider for state management
- [ ] Multiple screens with navigation
- [ ] API integration (mock data or real API)
- [ ] Local storage for cart and orders
- [ ] Proper error handling
- [ ] Loading states

### Screens

1. **Home Screen**
   - Product grid
   - Categories
   - Search bar

2. **Product Detail Screen**
   - Product image
   - Description
   - Price
   - Add to cart button

3. **Cart Screen**
   - Cart items list
   - Quantity controls
   - Total price
   - Checkout button

4. **Checkout Screen**
   - Order summary
   - Delivery information form
   - Place order button

5. **Orders Screen**
   - Order history
   - Order details

6. **Profile Screen**
   - User information
   - Settings

### Data Models

```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
  
  double get total => product.price * quantity;
}

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
  });
}
```

---

## Exercise 4: Weather App with Multiple Cities

### Objective
Create a weather app that displays weather for multiple cities.

### Requirements

- [ ] Add/remove cities
- [ ] Display current weather for each city
- [ ] Show weather details (temperature, humidity, wind)
- [ ] Use weather icons
- [ ] Pull-to-refresh
- [ ] Save favorite cities locally
- [ ] Search for cities

### API

Use OpenWeatherMap API or WeatherAPI:
```
https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}
```

---

## Bonus Exercise: Social Media Feed

### Objective
Create a simplified social media feed app.

### Features

- [ ] Display posts in a feed
- [ ] Like/unlike posts
- [ ] Comment on posts
- [ ] User profiles
- [ ] Create new posts
- [ ] Image picker for post images
- [ ] Save posts locally
- [ ] Pull-to-refresh

### Data Structure

```dart
class Post {
  final String id;
  final String userId;
  final String content;
  final String? imageUrl;
  final DateTime createdAt;
  int likes;
  List<Comment> comments;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    this.imageUrl,
    required this.createdAt,
    this.likes = 0,
    this.comments = const [],
  });
}

class Comment {
  final String userId;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.userId,
    required this.content,
    required this.createdAt,
  });
}
```

---

## Testing Requirements

For each exercise:

1. **Unit Tests**
   - Test your model classes
   - Test business logic functions

2. **Widget Tests**
   - Test key widgets
   - Test user interactions

### Example Test

```dart
void main() {
  test('Todo should toggle completion status', () {
    final todo = Todo(id: '1', title: 'Test');
    expect(todo.isCompleted, false);
    
    todo.isCompleted = true;
    expect(todo.isCompleted, true);
  });
}
```

---

## Submission Guidelines

1. Create a new Flutter project for each exercise
2. Implement all required features
3. Write tests
4. Add README with:
   - App description
   - Features implemented
   - How to run the app
   - Screenshots
5. Build APK (optional)

---

## Evaluation Criteria

- **Functionality** (40%): All features work correctly
- **Code Quality** (30%): Clean, organized, commented code
- **UI/UX** (20%): Beautiful and user-friendly interface
- **State Management** (10%): Proper use of Provider

---

## Tips for Success

1. **Start Simple**: Begin with basic functionality, then add features
2. **Use Provider**: Practice state management with Provider
3. **Error Handling**: Always handle errors and loading states
4. **Test Often**: Test your app frequently during development
5. **Code Organization**: Keep your code organized in separate files
6. **Comments**: Add comments to explain complex logic
7. **Git Commits**: Commit your changes regularly

---

## Resources

- [Provider Examples](https://pub.dev/packages/provider/example)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)
- [Free APIs](https://github.com/public-apis/public-apis)

---

## Need Help?

- Review the session materials
- Check Flutter documentation
- Ask in Flutter communities
- Debug with print statements
- Use Flutter DevTools

---

**Good luck! Build something amazing! 🚀**

---

[← Back to Day 2](../README.md)
