import 'package:flutter/material.dart';
import 'package:shop/widgets/MyDrawer.dart';

import 'EditProduct.dart';

class ManageProductsPage extends StatelessWidget {
  static const route = '/manage-Products';
  ManageProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProduct.route);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
