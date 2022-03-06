import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/domains/Product.dart';
import 'package:shop/domains/Products.dart';
import 'package:shop/pages/ManageProductsPage.dart';

class EditProduct extends StatelessWidget {
  static const route = '/edit-page';
  final _formKey = GlobalKey<FormState>();
  NullableProduct nullableProduct;
  int index;

  EditProduct(this.nullableProduct, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    bool boolean = nullableProduct.title == null ? false : true;

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
                  if (boolean) {
                    products.updateProduct(index, product);
                  } else {
                    products.addProduct(product);
                  }
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
                  initialValue: nullableProduct.title,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
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
                  initialValue: nullableProduct.price == null
                      ? ''
                      : nullableProduct.price.toString(),
                  keyboardType: TextInputType.number,
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
                  initialValue: nullableProduct.description,
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
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(
                            nullableProduct.imageUrl == null
                                ? ''
                                : nullableProduct.imageUrl!,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Text(' Image');
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: nullableProduct.imageUrl,
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
