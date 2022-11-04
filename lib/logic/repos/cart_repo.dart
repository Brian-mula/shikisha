import 'package:shikisha/logic/models/cart_model.dart';
import 'package:shikisha/logic/models/products_model.dart';

class CartRepo {
  final Map<String, CartModel> _items = {};
  Map<String, CartModel> get items => _items;
  void addCartItem(ProductModel product, int quantity) {
    int totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });
      if (totalQuantity < 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          print("you are adding the product to cart ${product.id.toString()}");
          return CartModel(
              id: product.id,
              name: product.title,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product);
        });
      }
    }
  }
}
