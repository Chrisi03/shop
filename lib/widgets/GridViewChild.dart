import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/domains/ShoppingData.dart';
import 'package:shop/domains/ShoppingList.dart';
import 'package:shop/domains/ShoppingListItem.dart';
import 'package:shop/domains/User.dart';
import 'package:shop/pages/DetailPage.dart';

class GridViewChild extends StatefulWidget {
  Product product;

  GridViewChild(this.product, {Key? key}) : super(key: key);

  @override
  State<GridViewChild> createState() => _GridViewChildState();
}

class _GridViewChildState extends State<GridViewChild> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    final shoppingData = Provider.of<ShoppingData>(context);
    return GridTile(
      child: GestureDetector(
        child: Image.network(widget.product.imageUrl),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage(widget.product)));
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
            onPressed: () {
              widget.product.isLiked = !widget.product.isLiked;
              if (widget.product.isLiked) {
                user.addLike(widget.product);
              } else {
                user.removeLike(widget.product);
              }
            },
            icon: widget.product.isLiked
                ? Icon(Icons.favorite_outlined)
                : Icon(Icons.favorite_outline)),
        title: Text(widget.product.title),
        trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(widget.product.title + 'added'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      for (var i = 0;
                          i < shoppingData.currentShoppingList.values.length;
                          i++) {
                        if (shoppingData
                                .currentShoppingList.values[i].product ==
                            widget.product) {
                          if (shoppingData.currentShoppingList.values[i].count >
                              1) {
                            shoppingData.currentShoppingList.values[i]
                                .totalPrice -= widget.product.price;
                            shoppingData.currentShoppingList.values[i].count--;
                          } else {
                            shoppingData.removeFromCurrentShoppingList(
                                shoppingData.currentShoppingList.values[i]);
                          }
                        }
                      }
                    },
                  ),
                ),
              );

              if (shoppingData.currentShoppingList.values.isNotEmpty) {
                for (var i = 0;
                    i < shoppingData.currentShoppingList.values.length;
                    i++) {
                  if (shoppingData.currentShoppingList.values[i].product ==
                      widget.product) {
                    shoppingData.currentShoppingList.values[i].totalPrice +=
                        widget.product.price;
                    shoppingData.currentShoppingList.values[i].count++;
                    return;
                  }
                }
              }
              shoppingData.addToCurrentShoppingList(
                  ShoppingListItem(widget.product, widget.product.price, 1));
            },
            icon: Icon(Icons.shopping_cart)),
      ),
    );
  }
}
