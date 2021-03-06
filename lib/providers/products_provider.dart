import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/product_provider.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // var _showOnlyFavorites = false;

  List<Product> get items {
    // if (_showOnlyFavorites) {
    //   return _items.where((productItem) => productItem.isFavorite).toList();
    // }
    // to not return the list as reference type.
    // allows to send a copy so that it cannot be directly editted
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((products) => products.isFavorite).toList();
  }

  void addProduct() {
    // _items.add(value);
    // rebuild all the widgets that listen to this provider.
    notifyListeners();
  }

  Product findById(String productId) {
    return _items.firstWhere((product) => product.id == productId);
  }

  // void showFavoritesOnly() {
  //   _showOnlyFavorites = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showOnlyFavorites = false;
  //   notifyListeners();
  // }
}
