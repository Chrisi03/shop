import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/pages/CartPage.dart';

import '../widgets/MyDrawer.dart';

class ShopPage extends StatefulWidget {
  static const route = '/shop';
  ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Prime +'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
          Badge(
            padding: EdgeInsets.all(2),
            badgeContent: Text('1'),
            child: IconButton(onPressed: () {
              Navigator.of(context).pushNamed(CartPage.route);
            }, icon: Icon(Icons.shopping_cart)),
            position: BadgePosition.topEnd(end: 5,top: 7),
            animationType: BadgeAnimationType.scale,
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}