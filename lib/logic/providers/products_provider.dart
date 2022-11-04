import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/repos/firebase.dart';
import 'package:shikisha/logic/repos/products_repo.dart';

// final productsProvider = FutureProvider<List<Product>>((ref) async {
//   return ProductsRepo().getAllProducts();
// });

final productsProvider = ChangeNotifierProvider<ProductsRepo>((ref) {
  return ProductsRepo();
});

// final cartProvider = Provider<CartRepo>((ref) {
//   return CartRepo();
// });

// final firebaseProvider = Provider<SellerProduct>((ref) {
//   return SellerProduct();
// });
ProductsContoller _products = ProductsContoller();
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  return _products.allProducts;
});
