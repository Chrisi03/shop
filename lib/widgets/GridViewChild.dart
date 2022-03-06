import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
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


              print(user.values);
            },
            icon: widget.product.isLiked
                ? Icon(Icons.favorite_outlined)
                : Icon(Icons.favorite_outline)),
        title: Text(widget.product.title),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      ),
    );
  }
}
