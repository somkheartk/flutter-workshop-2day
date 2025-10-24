// Session 2: Object-Oriented Programming Examples
// Run with: dart 04_oop.dart

void main() {
  print('=== Object-Oriented Programming ===\n');
  
  // Creating objects
  print('1. Creating Objects:');
  var person1 = Person('John Doe', 25);
  var person2 = Person('Jane Smith', 30);
  
  person1.introduce();
  person2.introduce();
  
  // Using methods
  print('\n2. Using Methods:');
  person1.haveBirthday();
  person1.introduce();
  
  // Different constructors
  print('\n3. Different Constructors:');
  var user1 = User('Alice', 28, 'alice@example.com');
  var user2 = User.guest();
  var user3 = User.fromJson({
    'name': 'Bob',
    'age': 35,
    'email': 'bob@example.com'
  });
  
  user1.displayInfo();
  user2.displayInfo();
  user3.displayInfo();
  
  // Getters and Setters
  print('\n4. Getters and Setters:');
  var rect = Rectangle(5, 10);
  print('Rectangle: ${rect.width} × ${rect.height}');
  print('Area: ${rect.area}');
  print('Perimeter: ${rect.perimeter}');
  
  rect.dimensions = [3, 4];
  print('New dimensions: ${rect.width} × ${rect.height}');
  print('New area: ${rect.area}');
  
  // Inheritance
  print('\n5. Inheritance:');
  var dog = Dog('Buddy', 'Golden Retriever');
  dog.makeSound();
  dog.fetch();
  dog.displayInfo();
  
  var cat = Cat('Whiskers', 'Persian');
  cat.makeSound();
  cat.climb();
  cat.displayInfo();
}

// Basic class
class Person {
  String name;
  int age;
  
  // Constructor
  Person(this.name, this.age);
  
  // Method
  void introduce() {
    print('Hi, I am $name and I am $age years old.');
  }
  
  void haveBirthday() {
    age++;
    print('Happy birthday $name! You are now $age years old.');
  }
}

// Class with multiple constructors
class User {
  String name;
  int age;
  String? email;
  
  // Default constructor
  User(this.name, this.age, [this.email]);
  
  // Named constructor
  User.guest()
      : name = 'Guest',
        age = 0,
        email = null;
  
  // Named constructor from JSON
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        email = json['email'];
  
  void displayInfo() {
    print('User: $name, Age: $age${email != null ? ", Email: $email" : ""}');
  }
}

// Class with getters and setters
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  // Getter
  double get area => width * height;
  
  // Getter
  double get perimeter => 2 * (width + height);
  
  // Setter
  set dimensions(List<double> values) {
    width = values[0];
    height = values[1];
  }
}

// Base class
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('$name makes a sound');
  }
  
  void displayInfo() {
    print('Animal: $name');
  }
}

// Derived class - Dog
class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  @override
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }
  
  void fetch() {
    print('$name fetches the ball');
  }
  
  @override
  void displayInfo() {
    print('Dog: $name (Breed: $breed)');
  }
}

// Derived class - Cat
class Cat extends Animal {
  String breed;
  
  Cat(String name, this.breed) : super(name);
  
  @override
  void makeSound() {
    print('$name meows: Meow! Meow!');
  }
  
  void climb() {
    print('$name climbs the tree');
  }
  
  @override
  void displayInfo() {
    print('Cat: $name (Breed: $breed)');
  }
}
