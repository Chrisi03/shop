import 'package:flutter/cupertino.dart';
import 'package:shop/domains/ShoppingListItem.dart';

import 'Product.dart';

class ShoppingList with ChangeNotifier{
  final _values = [];

  List<ShoppingListItem> get values {
    return [..._values];
  }

  void addToList(ShoppingListItem input) {
    _values.add(input);
    notifyListeners();
  }

  void removeFromList(ShoppingListItem shoppingListItem) {
    _values.remove(shoppingListItem);
    notifyListeners();
  }

  void removeAllFromList(){
    _values.clear();
    notifyListeners();
  }
}