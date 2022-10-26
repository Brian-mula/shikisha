import 'package:shikisha/logic/models/cart_model.dart';
import 'package:shikisha/logic/models/products_model.dart';

class CartRepo {
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  void addCartItem(Product product, int quantity) {
    _items.putIfAbsent(product.id!, () {
      print("you are adding the product to cart ${product.id.toString()}");
      return CartModel(
          id: product.id,
          name: product.title,
          price: product.price,
          img: product.image,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product);
    });
  }
}
