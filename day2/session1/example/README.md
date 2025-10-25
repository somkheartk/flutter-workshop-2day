# State Management with Provider - Shopping Cart

A complete shopping cart application demonstrating the Provider package for state management.

## 📋 What You'll Learn

This example teaches you:
- ✅ How to use Provider package for state management
- ✅ Creating ChangeNotifier classes to hold app state
- ✅ Sharing state across multiple screens
- ✅ Using Consumer to rebuild widgets when state changes
- ✅ Using context.read() to call methods without rebuilding
- ✅ Managing complex data structures (lists, calculations)

## 🎯 Features

- ✅ Product list with prices
- ✅ Add items to cart with smart quantity handling
- ✅ View cart with item count badge in AppBar
- ✅ Update quantities automatically
- ✅ Remove items from cart with confirmation
- ✅ Calculate total price dynamically
- ✅ Checkout with confirmation dialog
- ✅ Empty cart state with friendly message

## 🚀 How to Run

### Prerequisites
- Flutter SDK installed (run `flutter doctor` to check)
- An emulator/simulator running, or a physical device connected
- Internet connection (for downloading dependencies)

### Step-by-Step Instructions

1. **Navigate to the example directory:**
   ```bash
   cd day2/session1/example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
   
   This will install the Provider package and other dependencies.
   You should see: `Got dependencies!`

3. **Run the app:**
   ```bash
   flutter run
   ```
   
   Or select "Run without Debugging" in VS Code/Android Studio.

4. **Choose a device** (if multiple devices available):
   - Select your emulator, simulator, or physical device
   - Press Enter to use the default device

### Expected Output

When the app launches, you will see:

**Product List Screen:**
- 📱 Title: "Products" in blue AppBar
- 🛍️ List of 6 products (Laptop, Mouse, Keyboard, Monitor, Headphones, Webcam)
- 💰 Each product shows price in Thai Baht (฿)
- 🛒 Shopping cart icon in top-right corner
- ➕ "Add to Cart" button for each product

**What Happens When You Click:**
1. **Click "Add to Cart":**
   - Item is added to cart
   - Cart badge appears showing number of items (e.g., "1", "2", "3")
   - Success message: "Added to cart" appears at bottom
   - If you add the same item again, quantity increases (no duplicate entries)

2. **Click Shopping Cart Icon:**
   - Navigates to Cart Page
   - Shows all items with quantities
   - Displays total price at bottom

**Shopping Cart Screen:**
- 🛒 Title: "Shopping Cart"
- 📦 Each item shows:
  - Quantity in circle (e.g., "2")
  - Product name
  - Price per item × quantity
  - Total for that item
  - Red delete button 🗑️
- 💵 Bottom section shows:
  - Grand total of all items
  - Blue "Checkout" button

3. **Click Delete Button:**
   - Item removed immediately from cart
   - Cart badge and total update automatically
   - If all items removed, shows empty state

4. **Click Checkout Button:**
   - Dialog appears confirming total
   - Two options: "Cancel" or "Confirm"
   - On Confirm:
     - Cart is cleared
     - Returns to product list
     - Shows "Order placed successfully!" message

**Empty Cart State:**
- 🛒 Large shopping cart icon (gray)
- 📝 Message: "Your cart is empty"

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point, UI screens
│   ├── main()            # Wraps app with ChangeNotifierProvider
│   ├── MyApp             # Root MaterialApp widget
│   ├── ProductListPage   # Shows products, uses Consumer for cart badge
│   └── CartPage          # Shows cart contents, uses Consumer to rebuild
│
└── models/
    └── cart_model.dart    # State management classes
        ├── CartItem      # Represents a single cart item
        └── CartModel     # ChangeNotifier that manages cart state
```

## 🎓 Key Concepts Explained

### 1. ChangeNotifier Pattern
```dart
class CartModel extends ChangeNotifier {
  // When data changes, call:
  notifyListeners();  // ← Tells all listeners to rebuild
}
```

### 2. Providing State
```dart
ChangeNotifierProvider(
  create: (context) => CartModel(),  // ← Creates the model
  child: MyApp(),                    // ← All children can access it
)
```

### 3. Consuming State (Listening)
```dart
Consumer<CartModel>(
  builder: (context, cart, child) {
    return Text('${cart.itemCount}');  // ← Rebuilds when cart changes
  },
)
```

### 4. Accessing State (Not Listening)
```dart
// Use read() when you just need to call a method
context.read<CartModel>().addItem(...);  // ← Doesn't trigger rebuild
```

## 🎯 Learning Challenges

Try these modifications to test your understanding:

### Easy:
1. Add a "Clear Cart" button in the AppBar of CartPage
2. Change the products to your favorite items
3. Add more products to the list

### Medium:
4. Add a quantity selector (+ and - buttons) for each cart item
5. Show the cart total in the ProductListPage AppBar
6. Add a confirmation dialog before deleting items

### Hard:
7. Add product categories and filter buttons
8. Save cart to SharedPreferences so it persists after app restart
9. Add a "Favorites" feature with a separate model
10. Implement a search function for products

## 🐛 Troubleshooting

**Problem:** App doesn't build - "Provider not found"
```bash
# Solution: Make sure dependencies are installed
flutter pub get
# If still fails, clean and rebuild:
flutter clean
flutter pub get
flutter run
```

**Problem:** Cart badge doesn't update
- **Cause:** Probably not using Consumer or context.watch()
- **Solution:** Wrap the widget that needs to update with Consumer<CartModel>

**Problem:** Items added multiple times instead of increasing quantity
- **Cause:** Product IDs might not match
- **Solution:** Check that `id` field is unique and consistent

## 📚 Related Documentation

- [Provider Package](https://pub.dev/packages/provider) - Official documentation
- [State Management](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple) - Flutter guide
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) - API reference

## 💡 Next Steps

After understanding this example:
1. ✅ Try the exercises in `day2/session1/README.md`
2. ✅ Move on to Session 2: Navigation & Routing
3. ✅ Combine Provider with Navigation for multi-screen state
4. ✅ Learn about advanced state management (GetX, Riverpod, Bloc)

---

**💙 Happy Coding!** If you understand how Provider works with this example, you're ready for more complex state management scenarios!
