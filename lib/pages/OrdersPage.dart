import 'package:flutter/material.dart';
import 'package:shop/widgets/MyDrawer.dart';

class OrdersPage extends StatelessWidget {
  static const route = '/orders';
   OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
        ),
      drawer: MyDrawer(),
    );
  }
}
