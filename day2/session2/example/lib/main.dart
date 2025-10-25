/// Navigation and Routing Demo App
/// 
/// This app demonstrates different navigation patterns in Flutter:
/// 
/// 1. NAMED ROUTES - Using route names instead of direct widget references
///    - Cleaner code organization
///    - Easier to manage navigation in large apps
///    - Centralized route definitions
/// 
/// 2. DATA PASSING - Sending data between screens
///    - Using arguments parameter
///    - Receiving with ModalRoute.of(context)
/// 
/// 3. NAVIGATION STACK - How screens are managed
///    - push: Add screen to stack
///    - pop: Remove screen from stack
///    - Navigation history is maintained
/// 
/// App Structure:
/// HomeScreen → [Profile, Settings, Details with data]
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/details_screen.dart';

/// Main entry point of the application
void main() {
  runApp(const MyApp());
}

/// MyApp - Root widget that sets up navigation
/// 
/// Key concepts demonstrated here:
/// - Named routes configuration
/// - Initial route setup
/// - Route table definition
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      
      // App theme configuration
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,  // Use Material Design 3 styling
      ),
      
      /// NAMED ROUTES SETUP
      /// 
      /// Why use named routes?
      /// ✅ Clean and maintainable code
      /// ✅ Easy to navigate: Navigator.pushNamed(context, '/profile')
      /// ✅ Centralized route definitions
      /// ✅ Easy to add deep linking later
      
      // initialRoute: The first screen to show when app starts
      // '/' is conventional for the home/main screen
      initialRoute: '/',
      
      // routes: Map of route names to screen builders
      // Format: 'route_name': (context) => ScreenWidget()
      routes: {
        // Home route - Starting point
        '/': (context) => const HomeScreen(),
        
        // Profile route - User profile screen
        '/profile': (context) => const ProfileScreen(),
        
        // Settings route - App settings screen
        '/settings': (context) => const SettingsScreen(),
        
        // Details route - Product/item details screen
        // This screen receives data via arguments
        '/details': (context) => const DetailsScreen(),
      },
      
      /// NAVIGATION USAGE EXAMPLES:
      /// 
      /// Navigate to a screen:
      /// Navigator.pushNamed(context, '/profile');
      /// 
      /// Navigate with data:
      /// Navigator.pushNamed(
      ///   context, 
      ///   '/details',
      ///   arguments: {'id': 1, 'name': 'Product'},
      /// );
      /// 
      /// Go back:
      /// Navigator.pop(context);
      /// 
      /// Replace current screen:
      /// Navigator.pushReplacementNamed(context, '/home');
    );
  }
}
