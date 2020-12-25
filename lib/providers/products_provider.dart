import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    // to not return the list as reference type.
    // allows to send a copy so that it cannot be directly editted
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    // rebuild all the widgets that listen to this provider.
    notifyListeners();
  }
}
