import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/repos/cart_repo.dart';

class ProductsRepo extends ChangeNotifier {
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartRepo _cartRepo;
  Future<List<ProductModel>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List jsonRes = json.decode(response.body);
      return jsonRes.map((product) => ProductModel.fromJson(product)).toList();
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

  void initProduct(CartRepo cartRepo) {
    _quantity = 0;
    _inCartItems = 0;
    _cartRepo = cartRepo;
  }

  void addToCart(ProductModel product) {
    _cartRepo = CartRepo();
    _cartRepo.addCartItem(product, _quantity);
  }
}
