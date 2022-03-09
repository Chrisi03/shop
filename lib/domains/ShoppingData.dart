import 'package:flutter/cupertino.dart';
import 'package:shop/domains/ShoppingList.dart';

import 'ShoppingListItem.dart';

class ShoppingData with ChangeNotifier{
  ShoppingList currentShoppingList = ShoppingList();
  List<ShoppingList> pastShoppingList = [];

  void addToCurrentShoppingList(ShoppingListItem input) {
    currentShoppingList.addToList(input);
    notifyListeners();
  }

  void removeFromCurrentShoppingList(ShoppingListItem shoppingListItem) {
    currentShoppingList.removeFromList(shoppingListItem);
    notifyListeners();
  }

  void removeAllFromList() {
    currentShoppingList.removeAllFromList();
    notifyListeners();
  }

  void order(){
    pastShoppingList.add(currentShoppingList);
    currentShoppingList = ShoppingList();
    notifyListeners();
  }
}
