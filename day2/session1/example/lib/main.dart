/// Shopping Cart App - Provider State Management Example
/// 
/// This app demonstrates how to use Provider for state management:
/// 1. CartModel holds the shopping cart state
/// 2. ChangeNotifierProvider makes CartModel available to all widgets
/// 3. Consumer widgets listen for changes and rebuild when needed
/// 4. context.read() is used to call methods without listening
/// 
/// App Flow:
/// ProductListPage → Add items → CartPage → Checkout → Back to products
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart_model.dart';

/// Main entry point of the app
/// 
/// STEP 1: Wrap entire app with ChangeNotifierProvider
/// This makes CartModel accessible throughout the widget tree
void main() {
  runApp(
    // ChangeNotifierProvider creates an instance of CartModel
    // and provides it to all child widgets
    ChangeNotifierProvider(
      // create: function that returns the model instance
      // Called once when app starts
      create: (context) => CartModel(),
      
      // child: the root widget of our app
      child: const MyApp(),
    ),
  );
}

/// MyApp - Root widget of the application
/// 
/// This widget is wrapped by ChangeNotifierProvider in main()
/// So it has access to CartModel throughout its widget tree
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      
      // Set blue as primary color for buttons, AppBar, etc.
      theme: ThemeData(primarySwatch: Colors.blue),
      
      // Start with ProductListPage as home screen
      home: const ProductListPage(),
    );
  }
}

/// ProductListPage - Displays list of products that can be added to cart
/// 
/// Features:
/// - Shows product list with prices
/// - Shopping cart icon in AppBar with badge showing item count
/// - "Add to Cart" button for each product
/// - Navigates to CartPage when cart icon is tapped
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product data
    // In a real app, this would come from an API or database
    final products = [
      {'id': '1', 'name': 'Laptop', 'price': 29999.0},
      {'id': '2', 'name': 'Mouse', 'price': 599.0},
      {'id': '3', 'name': 'Keyboard', 'price': 1299.0},
      {'id': '4', 'name': 'Monitor', 'price': 8999.0},
      {'id': '5', 'name': 'Headphones', 'price': 2499.0},
      {'id': '6', 'name': 'Webcam', 'price': 1999.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          // STEP 2: Use Consumer to listen to CartModel changes
          // This widget rebuilds whenever cart.itemCount changes
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  // Shopping cart icon button
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Navigate to CartPage to view cart contents
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  
                  // Badge: Shows number of items in cart
                  // Only shown if cart has items (itemCount > 0)
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,  // Red background for visibility
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        // Display the item count number
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      
      // Body: List of products
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          
          // Each product is displayed as a Card
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              // Product icon
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.blue.shade700,
                ),
              ),
              
              // Product name
              title: Text(product['name'] as String),
              
              // Product price (฿ is Thai Baht symbol)
              subtitle: Text('฿${product['price']}'),
              
              // "Add to Cart" button
              trailing: ElevatedButton(
                onPressed: () {
                  // STEP 3: Use context.read() to call methods
                  // We use read() not watch() because we don't need to rebuild
                  // when cart changes - we just want to call addItem()
                  context.read<CartModel>().addItem(
                        product['id'] as String,
                        product['name'] as String,
                        product['price'] as double,
                      );
                  
                  // Show confirmation message at bottom of screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// CartPage - Displays shopping cart contents
/// 
/// Features:
/// - Shows all items in cart with quantity and price
/// - Delete button for each item
/// - Displays total price at bottom
/// - Checkout button that shows confirmation dialog
/// - Empty state when cart has no items
/// 
/// Uses Consumer to automatically update when cart changes
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        // Back button is automatically added by Flutter
      ),
      
      // STEP 4: Use Consumer to rebuild when cart data changes
      // Entire body rebuilds when CartModel notifies listeners
      body: Consumer<CartModel>(
        // builder receives:
        // - context: BuildContext
        // - cart: the CartModel instance
        // - child: optional static child widget (not used here)
        builder: (context, cart, child) {
          // Check if cart is empty
          if (cart.items.isEmpty) {
            // Show empty state with icon and message
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // Cart has items - display them in a list with total at bottom
          return Column(
            children: [
              // Expanded: Takes all available space
              // Contains scrollable list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        // Leading: Shows quantity in a circle
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Text('${item.quantity}'),
                        ),
                        
                        // Title: Product name
                        title: Text(item.name),
                        
                        // Subtitle: Shows price per item × quantity
                        subtitle: Text('฿${item.price} x ${item.quantity}'),
                        
                        // Trailing: Shows total price and delete button
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Total price for this item (price × quantity)
                            Text(
                              '฿${item.total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            
                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // STEP 5: Call removeItem method
                                // This triggers notifyListeners() in CartModel
                                // which rebuilds this Consumer widget
                                cart.removeItem(item.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Bottom section: Total price and checkout button
              // Fixed at bottom (not scrollable)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  // Shadow at top edge for visual separation
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side: Total price label and amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(fontSize: 16),
                        ),
                        // Display total from cart.totalPrice
                        // toStringAsFixed(2) formats to 2 decimal places
                        Text(
                          '฿${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    
                    // Right side: Checkout button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Show checkout confirmation dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Checkout'),
                            content: Text(
                              'Total: ฿${cart.totalPrice.toStringAsFixed(2)}\n\nProceed with checkout?',
                            ),
                            actions: [
                              // Cancel button - just closes dialog
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              
                              // Confirm button - clears cart and goes back
                              ElevatedButton(
                                onPressed: () {
                                  // STEP 6: Clear cart after successful checkout
                                  cart.clear();
                                  
                                  // Close dialog
                                  Navigator.pop(context);
                                  
                                  // Go back to product list
                                  Navigator.pop(context);
                                  
                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Order placed successfully!'),
                                    ),
                                  );
                                },
                                child: const Text('Confirm'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: const Text('Checkout'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
