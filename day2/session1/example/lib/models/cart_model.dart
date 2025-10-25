import 'package:flutter/foundation.dart';

/// CartItem - Represents a single item in the shopping cart
/// 
/// This class holds information about a product in the cart:
/// - id: Unique identifier for the product
/// - name: Display name of the product
/// - price: Price per unit
/// - quantity: Number of items (can be modified)
/// - total: Computed property that calculates price * quantity
class CartItem {
  // Unique identifier for this product (e.g., "1", "2", "3")
  final String id;
  
  // Product name displayed in the cart (e.g., "Laptop", "Mouse")
  final String name;
  
  // Price per single unit in Thai Baht
  final double price;
  
  // Number of items in cart - can be increased/decreased
  // Default is 1 when first added
  int quantity;

  /// Constructor - Creates a new cart item
  /// [id], [name], [price] are required
  /// [quantity] defaults to 1 if not specified
  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  /// Computed property: Calculates total price for this item
  /// Formula: price × quantity
  /// Example: If price = 100 and quantity = 3, total = 300
  double get total => price * quantity;
}

/// CartModel - Main state management class for the shopping cart
/// 
/// This class extends ChangeNotifier which allows it to notify listeners
/// (widgets) when the cart data changes. This is the core of Provider pattern.
/// 
/// Key responsibilities:
/// 1. Store list of cart items
/// 2. Provide methods to add/remove/update items
/// 3. Calculate totals
/// 4. Notify UI to rebuild when data changes
class CartModel extends ChangeNotifier {
  // Private list of cart items
  // Using _ prefix makes it private to this class
  // This ensures items can only be modified through our methods
  final List<CartItem> _items = [];

  /// Getter: Returns the list of cart items
  /// Widgets can read this to display cart contents
  List<CartItem> get items => _items;

  /// Getter: Returns the number of items in cart
  /// Used to display cart badge count in the UI
  /// Example: If cart has 3 items, returns 3
  int get itemCount => _items.length;

  /// Getter: Calculates total price of all items in cart
  /// 
  /// Uses fold() method to sum up all item totals:
  /// - Starts with 0
  /// - For each item, adds item.total to the sum
  /// 
  /// Example: 
  /// Item 1: ฿100 × 2 = ฿200
  /// Item 2: ฿50 × 1 = ฿50
  /// Total: ฿250
  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.total);
  }

  /// Method: Add an item to the cart
  /// 
  /// Smart behavior:
  /// - If item already exists: increment quantity by 1
  /// - If item is new: add it to cart with quantity = 1
  /// 
  /// Parameters:
  /// [id] - Product ID to identify the item
  /// [name] - Product name for display
  /// [price] - Price per unit
  /// 
  /// After adding, notifyListeners() triggers UI rebuild
  void addItem(String id, String name, double price) {
    // Search for existing item with same ID
    // indexWhere returns index if found, -1 if not found
    final existingIndex = _items.indexWhere((item) => item.id == id);
    
    if (existingIndex >= 0) {
      // Item exists - just increase quantity
      _items[existingIndex].quantity++;
    } else {
      // New item - add to cart with default quantity 1
      _items.add(CartItem(id: id, name: name, price: price));
    }
    
    // IMPORTANT: Notify all listeners (widgets) that data changed
    // This triggers Consumer widgets to rebuild
    notifyListeners();
  }

  /// Method: Remove an item completely from cart
  /// 
  /// Uses removeWhere which removes all items matching the condition
  /// In our case, we match by ID
  /// 
  /// Parameter:
  /// [id] - ID of item to remove
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    
    // Notify listeners to update UI (cart badge, list, total)
    notifyListeners();
  }

  /// Method: Update quantity of a specific item
  /// 
  /// Finds item by ID and sets new quantity
  /// Useful if you want to let users type quantity directly
  /// 
  /// Parameters:
  /// [id] - ID of item to update
  /// [quantity] - New quantity value
  void updateQuantity(String id, int quantity) {
    // Find the item (throws error if not found)
    final item = _items.firstWhere((item) => item.id == id);
    
    // Update the quantity
    item.quantity = quantity;
    
    // Notify listeners to recalculate totals and update UI
    notifyListeners();
  }

  /// Method: Clear all items from cart
  /// 
  /// Called after successful checkout or when user wants to start fresh
  void clear() {
    // Remove all items from the list
    _items.clear();
    
    // Notify listeners (cart will show as empty)
    notifyListeners();
  }
}
