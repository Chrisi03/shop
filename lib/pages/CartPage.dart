import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/ShoppingList.dart';

class CartPage extends StatelessWidget {
  static const route = '/cart';
  CartPage({Key? key}) : super(key: key);

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
                    badgeContent: Text('€0.00'),
                  ),
                  TextButton(onPressed: () {}, child: Text('ORDER NOW'))
                ],
              )
            ),
          ),
             ListView.builder(
               shrinkWrap: true,
               itemCount: shoppingList.values.length,
                 itemBuilder: (_,index){
                 return Card(
                   margin: EdgeInsets.all(11),
                   child: ListTile(
                      leading: Text(shoppingList.values[index].product.price.toString()),
                     title: Text(shoppingList.values[index].product.title),
                     subtitle: Text('Total:\n' + shoppingList.values[index].totalPrice.toString()),

                   ),
                 );
                 })
        ],
      ),
    );
  }
}
