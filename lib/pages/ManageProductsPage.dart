import 'package:flutter/material.dart';
import 'package:shop/widgets/MyDrawer.dart';

class ManageProductsPage extends StatelessWidget {
  static const route = '/manage-Products';
  ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
      ),
      drawer: MyDrawer(),
    );
  }
}
