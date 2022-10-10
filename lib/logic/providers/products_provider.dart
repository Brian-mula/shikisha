import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/repos/products_repo.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ProductsRepo().getAllProducts();
});
