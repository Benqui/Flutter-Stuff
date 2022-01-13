import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-1ecb8-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  bool isLoadign = true;

  ProductsService() {
    loadProduct();
  }
  Future<List<Product>> loadProduct() async {
    // Future loadProduct() async {
    isLoadign = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> prodctsMap = json.decode(resp.body);
    // print(prodctsMap);
    prodctsMap.forEach((key, value) {
      final temProduct = Product.fromMap(value);
      temProduct.id = key;
      products.add(temProduct);
    });

    isLoadign = false;
    notifyListeners();

    // print(products[0].name);
    return products;
  }

  //Todo:hacer fetch de productos
}
