/// ApiService - Handles all HTTP requests to the API
/// 
/// This class demonstrates:
/// 1. Making HTTP requests (GET, POST, PUT, DELETE)
/// 2. Handling async operations with Future
/// 3. Error handling for network requests
/// 4. JSON parsing and model conversion
/// 5. Organizing API calls in one place
/// 
/// API Used: JSONPlaceholder (free fake API for testing)
/// Base URL: https://jsonplaceholder.typicode.com
/// 
/// Common HTTP Methods:
/// - GET: Retrieve data (Read)
/// - POST: Create new data (Create)
/// - PUT: Update existing data (Update)
/// - DELETE: Remove data (Delete)
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/post.dart';

class ApiService {
  /// Base URL - All API endpoints start with this
  /// Using JSONPlaceholder - a free fake REST API for testing
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  /// GET REQUEST - Fetch all users
  /// 
  /// HTTP Method: GET
  /// Endpoint: /users
  /// Returns: List of all users from the API
  /// 
  /// Request Flow:
  /// 1. Send GET request to API
  /// 2. Wait for response
  /// 3. Check status code (200 = success)
  /// 4. Parse JSON response to List of User objects
  /// 5. Return list or throw exception
  /// 
  /// Usage:
  /// ```dart
  /// List<User> users = await apiService.getUsers();
  /// ```
  Future<List<User>> getUsers() async {
    try {
      // Make HTTP GET request
      // await: Wait for the request to complete before continuing
      // Uri.parse: Convert string URL to Uri object
      final response = await http.get(Uri.parse('$baseUrl/users'));

      // Check if request was successful
      // 200 = OK (success)
      // Other codes: 404 (not found), 500 (server error), etc.
      if (response.statusCode == 200) {
        // Success! Parse the response
        // 1. response.body is a JSON string
        // 2. json.decode() converts JSON string to Dart object (List/Map)
        // 3. jsonList is a List of Maps
        List<dynamic> jsonList = json.decode(response.body);
        
        // Convert each JSON map to a User object
        // map(): Transform each item in the list
        // toList(): Convert back to a regular List
        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        // Request failed - throw error with status code
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any errors (network issues, parsing errors, etc.)
      throw Exception('Error fetching users: $e');
    }
  }

  /// GET REQUEST - Fetch a single user by ID
  /// 
  /// HTTP Method: GET
  /// Endpoint: /users/{id}
  /// Parameter: [id] - The user ID to fetch
  /// Returns: Single User object
  /// 
  /// Example:
  /// ```dart
  /// User user = await apiService.getUser(1); // Get user with ID 1
  /// ```
  Future<User> getUser(int id) async {
    try {
      // Make GET request with user ID in URL
      final response = await http.get(Uri.parse('$baseUrl/users/$id'));

      if (response.statusCode == 200) {
        // Parse single user object from JSON
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }

  /// GET REQUEST - Fetch all posts
  /// 
  /// HTTP Method: GET
  /// Endpoint: /posts
  /// Returns: List of all posts from the API
  /// 
  /// Similar to getUsers() but for posts
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        // Decode JSON array to List of Post objects
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  /// GET REQUEST with QUERY PARAMETERS - Fetch posts by specific user
  /// 
  /// HTTP Method: GET
  /// Endpoint: /posts?userId={userId}
  /// Parameter: [userId] - Filter posts by this user ID
  /// Returns: List of posts created by the specified user
  /// 
  /// Query Parameters:
  /// - Added to URL after '?'
  /// - Format: ?key=value
  /// - Multiple params: ?key1=value1&key2=value2
  /// 
  /// Example:
  /// ```dart
  /// List<Post> posts = await apiService.getPostsByUser(1);
  /// // Gets all posts where userId = 1
  /// ```
  Future<List<Post>> getPostsByUser(int userId) async {
    try {
      // Note the '?userId=$userId' - this is a query parameter
      final response = await http.get(
        Uri.parse('$baseUrl/posts?userId=$userId'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  /// POST REQUEST - Create a new post
  /// 
  /// HTTP Method: POST
  /// Endpoint: /posts
  /// Parameter: [post] - The Post object to create
  /// Returns: The created Post (with ID assigned by server)
  /// 
  /// POST is used to CREATE new resources
  /// 
  /// Request components:
  /// 1. URL: Where to send the data
  /// 2. Headers: Metadata about the request
  ///    - Content-Type: tells server we're sending JSON
  /// 3. Body: The actual data to send (JSON format)
  /// 
  /// Flow:
  /// 1. Convert Post object to JSON
  /// 2. Send to API
  /// 3. API creates the post and returns it
  /// 4. Parse response and return new Post
  /// 
  /// Example:
  /// ```dart
  /// Post newPost = Post(id: 0, userId: 1, title: 'New', body: 'Content');
  /// Post created = await apiService.createPost(newPost);
  /// print(created.id); // Server-assigned ID
  /// ```
  Future<Post> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        
        // Headers: Tell API we're sending JSON
        headers: {'Content-Type': 'application/json'},
        
        // Body: Convert Post object to JSON string
        // 1. post.toJson() → Map<String, dynamic>
        // 2. json.encode() → JSON string
        body: json.encode(post.toJson()),
      );

      // 201 = Created (success for POST requests)
      if (response.statusCode == 201) {
        // Parse and return the created post
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating post: $e');
    }
  }

  /// PUT REQUEST - Update an existing post
  /// 
  /// HTTP Method: PUT
  /// Endpoint: /posts/{id}
  /// Parameter: [post] - The Post object with updated data
  /// Returns: The updated Post
  /// 
  /// PUT is used to UPDATE existing resources
  /// Usually replaces the entire resource
  /// 
  /// Example:
  /// ```dart
  /// Post existingPost = Post(id: 1, userId: 1, 
  ///                           title: 'Updated', body: 'New content');
  /// Post updated = await apiService.updatePost(existingPost);
  /// ```
  Future<Post> updatePost(Post post) async {
    try {
      final response = await http.put(
        // Include post ID in URL
        Uri.parse('$baseUrl/posts/${post.id}'),
        headers: {'Content-Type': 'application/json'},
        // Send updated data
        body: json.encode(post.toJson()),
      );

      // 200 = OK (success for PUT requests)
      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating post: $e');
    }
  }

  /// DELETE REQUEST - Delete a post
  /// 
  /// HTTP Method: DELETE
  /// Endpoint: /posts/{id}
  /// Parameter: [id] - The ID of the post to delete
  /// Returns: Nothing (void)
  /// 
  /// DELETE is used to REMOVE resources
  /// 
  /// Example:
  /// ```dart
  /// await apiService.deletePost(1); // Delete post with ID 1
  /// ```
  Future<void> deletePost(int id) async {
    try {
      final response = await http.delete(
        // Include post ID in URL
        Uri.parse('$baseUrl/posts/$id'),
      );

      // Check if deletion was successful
      if (response.statusCode != 200) {
        throw Exception('Failed to delete post: ${response.statusCode}');
      }
      // Success - no return value needed
    } catch (e) {
      throw Exception('Error deleting post: $e');
    }
  }
  
  /// SUMMARY OF HTTP METHODS
  /// 
  /// HTTP Method | Purpose      | Returns Data? | Has Body?
  /// ------------|--------------|---------------|----------
  /// GET         | Read/Fetch   | Yes           | No
  /// POST        | Create       | Yes (created) | Yes
  /// PUT         | Update       | Yes (updated) | Yes
  /// PATCH       | Partial Edit | Yes (updated) | Yes
  /// DELETE      | Remove       | Usually No    | No
}
