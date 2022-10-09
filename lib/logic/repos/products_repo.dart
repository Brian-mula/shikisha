import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shikisha/logic/models/products_model.dart';

class ProductsRepo {
  Future<Product> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
