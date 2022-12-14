import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/repos/product_service.dart';

final sellerproductProvider =
    Provider<ProductsService>((ref) => ProductsService());

FirebaseAuth auth = FirebaseAuth.instance;

ProductsService _products = ProductsService();
final userProduct = FutureProvider<List<ProductModel>>((ref) async {
  return _products.userProducts(auth.currentUser!.uid);
});
