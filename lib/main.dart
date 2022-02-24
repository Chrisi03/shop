import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop/domains/DrawerItem.dart';
import 'package:shop/pages/CartPage.dart';
import 'package:shop/pages/ManageProductsPage.dart';
import 'package:shop/widgets/MyDrawer.dart';

import 'pages/OrdersPage.dart';
import 'pages/ShopPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Prime +',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home: const ShopPage(),
      routes: {
        '/': (context) => ShopPage(),
        ShopPage.route: (context) => ShopPage(),
        OrdersPage.route: (context) => OrdersPage(),
        ManageProductsPage.route: (context) => ManageProductsPage(),
        CartPage.route: (context) => CartPage()
      },

      debugShowCheckedModeBanner: false,
    );
  }
}
