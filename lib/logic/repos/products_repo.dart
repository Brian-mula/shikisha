import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shikisha/logic/models/products_model.dart';

class ProductsRepo {
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
}
