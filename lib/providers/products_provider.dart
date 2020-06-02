import 'package:flutter/material.dart';

import '../models/product.dart';


class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];                      //remember ----> the underscore makes it a PRIVATE property !

  List<Product> get items {
    return [..._items];                          // so we GET a COPY of the  original items, IMMUTABILITY !
  }

  void addProducts() {
    notifyListeners();
  }
}