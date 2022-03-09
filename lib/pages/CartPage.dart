import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/ShoppingList.dart';

class CartPage extends StatefulWidget {
  static const route = '/cart';

  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;

  double getTotalPrice(ShoppingList shoppingList) {
    totalPrice = 0;
    for (var i = 0; i < shoppingList.values.length; i++) {
      totalPrice += shoppingList.values[i].totalPrice;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final shoppingList = Provider.of<ShoppingList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(10),
            child: Card(
                child: Row(
              children: [
                Text('Total'),
                Badge(
                  shape: BadgeShape.square,
                  borderRadius: BorderRadius.circular(15),
                  badgeContent:
                      Text('€' + getTotalPrice(shoppingList).toString()),
                ),
                TextButton(onPressed: () {}, child: Text('ORDER NOW'))
              ],
            )),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: shoppingList.values.length,
              itemBuilder: (_, index) {
                return Dismissible(
                  confirmDismiss: (DismissDirection direction) async{
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Confirmation"),
                          content: const Text("Are you sure you want to delete this item?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text("Delete")
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  key: ValueKey<int>(shoppingList.values.length),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      shoppingList.removeFromList(shoppingList.values[index]);
                    });
                  },
                  child: Card(
                    margin: EdgeInsets.all(11),
                    child: ListTile(
                      leading: Text(
                          shoppingList.values[index].product.price.toString()),
                      title: Text(shoppingList.values[index].product.title),
                      subtitle: Text('Total:\n' +
                          shoppingList.values[index].totalPrice.toString()),
                      trailing:
                          Text(shoppingList.values[index].count.toString() + 'x'),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
