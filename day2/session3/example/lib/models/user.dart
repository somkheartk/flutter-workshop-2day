/// User Model - Represents a user from the API
/// 
/// This class is a data model that:
/// 1. Holds user information from the API response
/// 2. Provides type safety (instead of using raw Maps)
/// 3. Converts between JSON (API format) and Dart objects
/// 
/// JSON from API looks like:
/// {
///   "id": 1,
///   "name": "Leanne Graham",
///   "email": "leanne@april.biz",
///   "phone": "1-770-736-8031",
///   "website": "hildegard.org"
/// }
class User {
  // User properties - match the JSON keys from API
  final int id;           // Unique user identifier
  final String name;      // Full name of the user
  final String email;     // Email address
  final String phone;     // Phone number
  final String website;   // Personal website URL

  /// Constructor - Creates a User instance
  /// All fields are required to ensure data integrity
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });

  /// Factory constructor - Converts JSON to User object
  /// 
  /// This is called when we receive data from the API:
  /// 1. API sends JSON string
  /// 2. We decode it to Map<String, dynamic>
  /// 3. We pass that map to User.fromJson()
  /// 4. Returns a User object we can use
  /// 
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'id': 1, 'name': 'John', ...};
  /// User user = User.fromJson(json);
  /// print(user.name); // "John"
  /// ```
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // Extract each field from the JSON map
      // json['key'] gets the value for that key
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  /// Method - Converts User object to JSON
  /// 
  /// This is called when we need to send data to the API:
  /// 1. We have a User object
  /// 2. Call user.toJson()
  /// 3. Returns Map<String, dynamic>
  /// 4. We encode that to JSON string for API
  /// 
  /// Example usage:
  /// ```dart
  /// User user = User(id: 1, name: 'John', ...);
  /// Map<String, dynamic> json = user.toJson();
  /// String jsonString = jsonEncode(json); // Send to API
  /// ```
  Map<String, dynamic> toJson() {
    return {
      // Create a map with keys matching API expectations
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
  
  /// Optional: Override toString() for debugging
  /// Helps when printing User objects during development
  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email)';
  }
}
