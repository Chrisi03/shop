import 'package:flutter/cupertino.dart';
import 'package:shop/domains/ShoppingListItem.dart';

import 'Product.dart';

class ShoppingList {
  double? totalPrice;
  DateTime? date;
  final _values = [];

  List<ShoppingListItem> get values {
    return [..._values];
  }

  void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }

  void setToCurrentDate() {
    date = DateTime.now();
  }

  void addToList(ShoppingListItem input) {
    _values.add(input);
  }

  void removeFromList(ShoppingListItem shoppingListItem) {
    _values.remove(shoppingListItem);
  }

  void removeAllFromList() {
    _values.clear();
  }
}
