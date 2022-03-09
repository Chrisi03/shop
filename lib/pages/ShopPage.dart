import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/domains/ShoppingData.dart';
import 'package:shop/domains/ShoppingList.dart';
import 'package:shop/domains/User.dart';
import 'package:shop/pages/CartPage.dart';
import 'package:shop/widgets/GridViewChild.dart';

import '../widgets/MyDrawer.dart';

class ShopPage extends StatefulWidget {
  static const route = '/shop';

  ShopPage({Key? key}) : super(key: key);
  bool onlyFav = false;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<Products>(context, listen: true);
    final user = Provider.of<User>(context, listen: false);
    final shoppingData = Provider.of<ShoppingData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Prime +'),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  if (value == 1) {
                    widget.onlyFav = false;
                  } else {
                    widget.onlyFav = true;
                  }
                });

                print(widget.onlyFav);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('All Products'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Only favourites'),
                      value: 2,
                    )
                  ]),
          Badge(
            padding: EdgeInsets.all(2),
            badgeContent: Text(shoppingData.currentShoppingList.values.length.toString()),
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
          itemCount:
              widget.onlyFav ? user.values.length : products.values.length,
          itemBuilder: (_, index) {
            if (widget.onlyFav == true) {
              /* var favouriteProductList = user.values
                  .map((product) => Product(product.title, product.price,
                      product.description, product.imageUrl,product.isLiked))
                  .toList();

              */
              print('only facvourites');
              return GridViewChild(user.values[index]);
            } else {
             /* var productList = products.values
                  .map((product) => Product(product.title, product.price,
                      product.description, product.imageUrl, product.isLiked))
                  .toList();
              print('all products');

              */
              return GridViewChild(products.values[index]);
            }
          },
        ),
      ),
    );
  }
}
