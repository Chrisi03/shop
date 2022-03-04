import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';

class GridViewChild extends StatelessWidget {
  Product product;
  GridViewChild(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(onPressed: () {} ,icon: Icon(Icons.favorite_outline)),
        title: Text(product.title),
        trailing: IconButton(onPressed: () {} ,icon: Icon(Icons.shopping_cart)),
      ),
    );
  }
}
