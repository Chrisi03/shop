import 'package:flutter/cupertino.dart';

import 'Product.dart';

class Products with ChangeNotifier{
  final _values = [
    Product('Title 1',0.0,'Descritpion 1','https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    Product('Title 2',2.0,'Descritpion 2','https://www.planet-wissen.de/natur/voegel/eulen/eulen-uhu-kopf-100~_v-Podcast.jpg'),
  ];

  List<Product> get values{
    return [..._values];
  }

  void addProduct(Product input){
    _values.add(input);
    notifyListeners();
  }

  void removeProduct(Product product){
    _values.remove(product);
    notifyListeners();
  }
}