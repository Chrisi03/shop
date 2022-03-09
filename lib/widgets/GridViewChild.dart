import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/domains/ShoppingList.dart';
import 'package:shop/domains/ShoppingListItem.dart';
import 'package:shop/domains/User.dart';

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
    final shoppingList = Provider.of<ShoppingList>(context, listen: true);
    return GridTile(
      child: Image.network(widget.product.imageUrl),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
            onPressed: () {
              print(widget.product.isLiked);
              widget.product.isLiked = !widget.product.isLiked;
              print(widget.product.isLiked);
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
                      for (var i = 0; i < shoppingList.values.length; i++) {
                        if (shoppingList.values[i].product == widget.product) {
                          if (shoppingList.values[i].count > 1) {
                            shoppingList.values[i].totalPrice -=
                                widget.product.price;
                            shoppingList.values[i].count--;
                          } else {
                            shoppingList.removeFromList(shoppingList.values[i]);
                          }
                        }
                      }
                    },
                  ),
                ),
              );

              if (shoppingList.values.isNotEmpty) {
                for (var i = 0; i < shoppingList.values.length; i++) {
                  if (shoppingList.values[i].product == widget.product) {
                    shoppingList.values[i].totalPrice += widget.product.price;
                    shoppingList.values[i].count++;
                    return;
                  }
                }
              }
              shoppingList.addToList(
                  ShoppingListItem(widget.product, widget.product.price, 1));
            },
            icon: Icon(Icons.shopping_cart)),
      ),
    );
  }
}
