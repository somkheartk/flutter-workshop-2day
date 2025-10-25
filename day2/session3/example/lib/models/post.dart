/// Post Model - Represents a blog post from the API
/// 
/// This class demonstrates:
/// 1. Creating model classes for API data
/// 2. JSON serialization and deserialization
/// 3. Type-safe data handling
/// 
/// API JSON structure:
/// {
///   "id": 1,
///   "userId": 1,
///   "title": "Post title",
///   "body": "Post content text..."
/// }
class Post {
  // Post properties
  final int id;        // Unique post identifier
  final int userId;    // ID of the user who created this post
  final String title;  // Post title/headline
  final String body;   // Post content/text

  /// Constructor - Creates a new Post instance
  /// All fields required for data completeness
  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  /// Factory constructor - JSON to Post object
  /// 
  /// Called when receiving post data from API
  /// 
  /// Data flow:
  /// API Response (JSON String) 
  ///   → jsonDecode() → Map<String, dynamic>
  ///   → Post.fromJson() → Post object
  /// 
  /// Example:
  /// ```dart
  /// String apiResponse = '{"id": 1, "userId": 1, "title": "Hello", "body": "World"}';
  /// Map<String, dynamic> json = jsonDecode(apiResponse);
  /// Post post = Post.fromJson(json);
  /// print(post.title); // "Hello"
  /// ```
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  /// Method - Post object to JSON
  /// 
  /// Called when sending post data to API
  /// 
  /// Data flow:
  /// Post object 
  ///   → post.toJson() → Map<String, dynamic>
  ///   → jsonEncode() → JSON String for API
  /// 
  /// Example:
  /// ```dart
  /// Post post = Post(id: 0, userId: 1, title: 'New Post', body: 'Content');
  /// Map<String, dynamic> json = post.toJson();
  /// String jsonString = jsonEncode(json); // Send to API
  /// ```
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
  
  /// Optional: toString() override for easier debugging
  /// Useful when printing Post objects during development
  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, title: $title)';
  }
}
