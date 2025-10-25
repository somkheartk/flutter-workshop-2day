/// DetailsScreen - Demonstrates receiving data from navigation
/// 
/// This screen shows:
/// 1. How to receive data passed via Navigator arguments
/// 2. Safe handling of optional data (null safety)
/// 3. Using received data to build UI
/// 4. How to navigate back (Navigator.pop)
/// 
/// Data Flow:
/// HomeScreen ---{title, description, price}---> DetailsScreen
///                      Navigator.pushNamed              ModalRoute.of(context)
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// RECEIVING DATA FROM PREVIOUS SCREEN
    /// 
    /// Step 1: Get the arguments passed via Navigator
    /// ModalRoute.of(context) gives us route information
    /// settings.arguments contains the data sent
    /// 
    /// The '?' makes it null-safe (might be null if no data sent)
    /// We cast to Map<String, dynamic> to work with the data
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    /// Step 2: Extract individual fields from the Map
    /// Using '??' operator to provide default values if data is missing
    /// This makes our app safe even if someone navigates here without data
    /// 
    /// Example: If args['title'] is null, use 'No Title' instead
    final title = args?['title'] ?? 'No Title';
    final description = args?['description'] ?? 'No Description';
    final price = args?['price'] ?? 0.0;
    
    /// Step 3: Use the received data to build UI
    /// The data from HomeScreen is now available as variables!

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: Colors.purple,
        // Back button is automatically added by Flutter
        // Clicking it calls Navigator.pop(context)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image placeholder
            Center(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Display TITLE received from arguments
            Text(
              title,  // ← Data from HomeScreen!
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            // Display PRICE received from arguments
            // Using toStringAsFixed(2) to show 2 decimal places
            Text(
              '฿${price.toStringAsFixed(2)}',  // ← Data from HomeScreen!
              style: const TextStyle(
                fontSize: 24,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // Description section
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            // Display DESCRIPTION received from arguments
            Text(
              description,  // ← Data from HomeScreen!
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            
            // Features card (static data, not from navigation)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Features:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Helper method to build feature items
                    _buildFeature('High Quality'),
                    _buildFeature('Fast Delivery'),
                    _buildFeature('1 Year Warranty'),
                    _buildFeature('Free Returns'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Action buttons
            Row(
              children: [
                // Add to Cart button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Show confirmation message
                      // In a real app, this would add to cart state
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                
                /// NAVIGATION BACK EXAMPLE
                /// 
                /// Navigator.pop removes current screen from stack
                /// User returns to HomeScreen
                /// 
                /// Navigation Stack:
                /// Before: [Home, Details]
                /// After:  [Home]
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Go back to previous screen (HomeScreen)
                      // Same as pressing device back button
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
            
            // Info box explaining the data flow
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.purple, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Data Flow Demo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This screen received title, description, and price '
                    'from the Home screen via navigation arguments. '
                    'This is useful for passing data between screens!',
                    style: TextStyle(fontSize: 12, color: Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to build feature list items
  /// Takes a feature string and returns a formatted row with checkmark
  Widget _buildFeature(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(feature, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
