/// HomeScreen - Main landing screen of the navigation demo
/// 
/// This screen demonstrates:
/// 1. Named route navigation (Navigator.pushNamed)
/// 2. Passing data to other screens via arguments
/// 3. Creating navigation buttons to different sections
/// 
/// Navigation Patterns Shown:
/// - Simple navigation to Profile
/// - Simple navigation to Settings
/// - Navigation with data passing to Details screen
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blue,
        // Note: No back button here because this is the root screen (initialRoute: '/')
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Home icon for visual appeal
              const Icon(
                Icons.home,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              
              // Welcome text
              const Text(
                'Welcome to Navigation Demo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Explore different navigation patterns',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              /// NAVIGATION EXAMPLE 1: Simple named route navigation
              /// 
              /// When clicked: Pushes ProfileScreen onto navigation stack
              /// Navigation Stack: [Home] → [Home, Profile]
              /// 
              /// User can press back button to return to Home
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to profile screen using named route
                  // The '/profile' route is defined in main.dart
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.person),
                label: const Text('Go to Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              /// NAVIGATION EXAMPLE 2: Another simple navigation
              /// 
              /// Same pattern as above, but goes to Settings screen
              /// Navigation Stack: [Home] → [Home, Settings]
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to settings screen
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings),
                label: const Text('Go to Settings'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              /// NAVIGATION EXAMPLE 3: Navigation with data passing
              /// 
              /// This demonstrates how to pass data to the next screen
              /// The data is sent via the 'arguments' parameter
              /// 
              /// Navigation Stack: [Home] → [Home, Details]
              /// Data Flow: Home ---{title, description, price}---> Details
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to details screen WITH data
                  Navigator.pushNamed(
                    context,
                    '/details',  // Route name (destination)
                    
                    // arguments: Any data you want to send
                    // Can be a Map, object, list, or any type
                    // Recipient uses ModalRoute.of(context).settings.arguments
                    arguments: {
                      'title': 'Flutter Workshop Product',
                      'description': 'This is a sample product demonstrating '
                                   'data passing between screens in Flutter',
                      'price': 999.99,
                    },
                  );
                },
                icon: const Icon(Icons.info),
                label: const Text('View Details (with data)'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Helpful hint for users
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.blue, size: 20),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Tip: Press back button on each screen\nto return to Home',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
