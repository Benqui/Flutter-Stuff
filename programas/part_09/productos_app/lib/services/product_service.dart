import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-1ecb8-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  Product? selectedProduct;

  File? newPictureFile;

  bool isLoadign = true;
  bool isSaving = false;

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

  Future saveAllCreataProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //es necesario crearlo
      await createProduct(product);
    } else {
      //Actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodeData = resp.body;
    // print(decodeData);

    //todo: actualizar el estado de productos

    // mi propuesta que no jalo xD
    // products.forEach((element) {
    //   if (element.id == product.id) {
    //     element = product;
    //   }
    //   print(element.name);
    // });

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodeData = json.decode(resp.body);

    // print(decodeData);
    product.id = decodeData['name'];

    products.add(product);
    // final index = products.indexWhere((element) => element.id == product.id);
    // products[index] = product;

    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct!.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadimage() async {
    if (newPictureFile == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/benqui/image/upload?upload_preset=productsMark1');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
    // print(resp.body);

    // return '';
  }
}
