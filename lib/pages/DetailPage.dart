import 'package:flutter/material.dart';
import 'package:shop/domains/Product.dart';

class DetailPage extends StatelessWidget {
  static const route = '/detail_page';
  Product product;
   DetailPage(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.price.toString()),
          Text(product.description)
        ],
      ),
    );
  }
}


