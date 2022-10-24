import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shikisha/logic/models/products_model.dart';

class ProductsRepo extends ChangeNotifier {
  int _quantity = 0;
  int get quantity => _quantity;
  Future<List<Product>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List jsonRes = json.decode(response.body);
      return jsonRes.map((product) => Product.fromJson(product)).toList();
      // return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }

  void checkSum(bool isAddition) {
    if (isAddition) {
      _quantity = checkQuantity(_quantity + 1);

      print("incrementing $_quantity");
    } else {
      _quantity = checkQuantity(_quantity - 1);

      print("decrementing $_quantity");
    }
    notifyListeners();
  }

  int checkQuantity(int quantity) {
    if (quantity <= 0) {
      return 0;
    }
    return quantity;
  }
}
