import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  List<CartItem> get itemList {
    return _items.values.toList();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    return _items.values.fold(
      0,
      (previousValue, item) => previousValue + item.quantity * item.price,
    );
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCardItem) => CartItem(
            id: existingCardItem.id,
            title: existingCardItem.title,
            quantity: existingCardItem.quantity + 1,
            price: existingCardItem.price),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
