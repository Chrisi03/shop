import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const route = '/cart';
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
    );
  }
}
