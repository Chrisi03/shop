import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';

class EditProduct extends StatelessWidget {
  static const route = '/edit-page';
  final _formKey = GlobalKey<FormState>();

  EditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final NullableProduct nullableProduct = new NullableProduct();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () {
                var formState = _formKey.currentState;
                if (formState!.validate()) {
                  var product = Product(
                      nullableProduct.title!,
                      nullableProduct.price!,
                      nullableProduct.description!,
                      nullableProduct.imageUrl!);
                  products.addProduct(product);
                }
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    nullableProduct.title = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    nullableProduct.price = double.parse(value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    nullableProduct.description = value;
                  },
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Text("Hallo"),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: TextFormField(
                        //key: _formKey,
                        decoration: InputDecoration(labelText: 'URL'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          nullableProduct.imageUrl = value;
                        },
                      ),
                    ),
                  ],
                )
                //Image(image: , width: 10,height: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NullableProduct {
  String? title;
  double? price;
  String? description;
  String? imageUrl;

  NullableProduct();
//NullableProduct(this.title,this.price,this.description,this.imageUrl);
}
