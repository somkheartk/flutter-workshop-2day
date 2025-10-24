import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.total);
  }

  void addItem(String id, String name, double price) {
    // Check if item already exists
    final existingIndex = _items.indexWhere((item) => item.id == id);
    
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(id: id, name: name, price: price));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final item = _items.firstWhere((item) => item.id == id);
    item.quantity = quantity;
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
