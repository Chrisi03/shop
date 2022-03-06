import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/domains/User.dart';
import 'package:shop/widgets/MyDrawer.dart';

import 'EditProduct.dart';

class ManageProductsPage extends StatefulWidget {
  static const route = '/manage-Products';

  ManageProductsPage({Key? key}) : super(key: key);

  @override
  State<ManageProductsPage> createState() => _ManageProductsPageState();
}

class _ManageProductsPageState extends State<ManageProductsPage> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      EditProduct(NullableProduct.empty(),0)));
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: products.values.length,
          itemBuilder: (_, index) {
            return ListTile(
              minVerticalPadding: 30,
              leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(products.values[index].imageUrl,errorBuilder:
                      (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Text('');
                  },)),
              title: Text(products.values[index].title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      user.removeLike(products.values[index]);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              EditProduct(NullableProduct(
                                  products.values[index].title,
                                  products.values[index].price,
                                  products.values[index].description,
                                  products.values[index].imageUrl,
                              products.values[index].isLiked),index)));
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      user.removeLike(products.values[index]);
                      products.removeProduct(products.values[index]);
                    },
                    icon: Icon(Icons.delete_forever),
                  ),
                ],
              ),
            );
          }),
      drawer: MyDrawer(),
    );
  }
}


class NullableProduct {
  String? title;
  double? price;
  String? description;
  String? imageUrl;
  bool? isLiked;

  NullableProduct.empty();

  NullableProduct(this.title, this.price, this.description, this.imageUrl,this.isLiked);
}
