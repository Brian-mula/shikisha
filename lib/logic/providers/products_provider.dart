import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/repos/cart_repo.dart';
import 'package:shikisha/logic/repos/firebase.dart';
import 'package:shikisha/logic/repos/products_repo.dart';

final productsProvider = ChangeNotifierProvider<ProductsRepo>((ref) {
  return ProductsRepo();
});

ProductsContoller _products = ProductsContoller();
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  return _products.allProducts;
});
ProductsRepo _productRepo = ProductsRepo();

CartRepo _cart = CartRepo();

final cartItems = ChangeNotifierProvider<CartRepo>((ref) {
  return _cart;
});
