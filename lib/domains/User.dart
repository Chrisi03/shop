import 'package:flutter/material.dart';

import 'Product.dart';

class User with ChangeNotifier {
  final _values = [];

  List<Product> get values {
    return [..._values];
  }

  void addLike(Product input) {
    _values.add(input);
    notifyListeners();
  }

  void removeLike(Product product) {
    _values.remove(product);
    notifyListeners();
  }
}