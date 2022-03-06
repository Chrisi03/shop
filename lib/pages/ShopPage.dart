import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/domains/User.dart';
import 'package:shop/pages/CartPage.dart';
import 'package:shop/widgets/GridViewChild.dart';

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
    final products = Provider.of<Products>(context, listen: false);
    return ChangeNotifierProvider<User>(
      create: (BuildContext context){
        return User();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Amazon Prime +'),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.more_vert),
            ),
            Badge(
              padding: EdgeInsets.all(2),
              badgeContent: Text('0'),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartPage.route);
                  },
                  icon: Icon(Icons.shopping_cart)),
              position: BadgePosition.topEnd(end: 5, top: 7),
              animationType: BadgeAnimationType.scale,
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Consumer<Products>(
          builder: (context, products, child) => GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: products.values.length,
            itemBuilder: (_, index) {
              var productList = products.values
                  .map((product) => Product(product.title, product.price,
                      product.description, product.imageUrl))
                  .toList();
              return GridViewChild(productList[index]);
            },
          ),
        ),
      ),
    );
  }
}
