# State Management with Provider - Shopping Cart

A complete shopping cart application demonstrating the Provider package for state management.

## Features

- Product list with prices
- Add items to cart
- View cart with item count badge
- Update quantities
- Remove items from cart
- Calculate total price
- Checkout with confirmation dialog
- Empty cart state

## How to Run

```bash
flutter pub get
flutter run
```

## Key Concepts

### Provider Package
- **ChangeNotifier** - Base class for models that notify listeners
- **ChangeNotifierProvider** - Provides the model to widget tree
- **Consumer** - Rebuilds when model changes
- **context.read()** - Access model without listening to changes
- **context.watch()** - Access model and listen to changes

### State Management Benefits
- Share state across multiple widgets
- No prop drilling
- Automatic UI updates when state changes
- Better organized code

## Project Structure

```
lib/
├── main.dart              # App entry and UI
└── models/
    └── cart_model.dart    # CartModel with ChangeNotifier
```

## Learning Points

1. Creating ChangeNotifier classes
2. Providing state with ChangeNotifierProvider
3. Consuming state with Consumer widget
4. Using context.read() for actions
5. Managing lists in state
6. Notifying listeners after state changes
7. Computed properties (totalPrice, itemCount)
8. Navigation between screens with shared state
