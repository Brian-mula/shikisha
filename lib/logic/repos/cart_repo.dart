import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shikisha/logic/models/cart_model.dart';
import 'package:shikisha/logic/models/products_model.dart';

class CartRepo extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _orders =
      FirebaseFirestore.instance.collection("orders");

  FirebaseAuth auth = FirebaseAuth.instance;
  final Map<String, CartModel> cartItems = {};
  void addToCart(ProductModel product) {
    cartItems.forEach((key, value) {
      print(value.name);
    });
    cartItems.putIfAbsent(product.id!, () {
      print("You are adding product to cart id ${product.id}");

      return CartModel(
          id: product.id,
          name: product.title,
          price: product.price,
          img: product.img,
          quantity: 1,
          isExist: true,
          product: product);
    });
  }

  List<CartModel> getCartProducts() {
    return cartItems.entries.map((e) {
      return e.value;
    }).toList();
  }

  int getTotal() {
    int total = 0;
    cartItems.forEach((key, value) {
      total += value.price!;
    });
    return total;
  }

  int getCartItemList() {
    int totalItems = 0;
    totalItems += cartItems.length;
    // notifyListeners();
    return totalItems;
  }

  Future<void> newOrder(
      CartModel items, String? id, BuildContext context) async {
    try {
      await _orders.doc(id).set({
        "owner": auth.currentUser!.email!,
        "date": DateTime.now(),
        "name": items.name,
        "price": items.price,
        "image": items.img,
        "quantity": items.quantity
      });
      Navigator.pushNamed(context, "/payments");
    } catch (e) {
      print(e.toString());
    }
  }

  // final Map<String, CartModel> _items = {};
  // Map<String, CartModel> get items => _items;
  // void addCartItem(ProductModel product, int quantity) {
  //   int totalQuantity = 0;
  //   if (_items.containsKey(product.id)) {
  //     _items.update(product.id!, (value) {
  //       print("item contained in the object");
  //       totalQuantity = value.quantity! + quantity;
  //       return CartModel(
  //           id: value.id,
  //           name: value.name,
  //           price: value.price,
  //           img: value.img,
  //           quantity: value.quantity! + quantity,
  //           isExist: true,
  //           time: DateTime.now().toString(),
  //           product: product);
  //     });
  //     if (totalQuantity < 0) {
  //       _items.remove(product.id);
  //     }
  //   } else {
  //     if (quantity > 0) {
  //       _items.putIfAbsent(product.id!, () {
  //         print(
  //             "you are adding the product to cart ${product.id.toString()} quantity $quantity");

  //         _items.forEach(
  //           (key, value) => {print(value.name)},
  //         );
  //         return CartModel(
  //             id: product.id,
  //             name: product.title,
  //             price: product.price,
  //             img: product.img,
  //             quantity: quantity,
  //             isExist: true,
  //             time: DateTime.now().toString(),
  //             product: product);
  //       });
  //     }
  //   }
  //   notifyListeners();
  // }

  // // List<CartModel> get getItems {
  // //   return _items.entries.map((e) {
  // //     print("these are cart items");
  // //     print(e.key);
  // //     return e.value;
  // //   }).toList();
  // // }
  // List<CartModel> getCartItems() {
  //   return _items.entries.map((e) {
  //     return e.value;
  //   }).toList();
  // }

  // int get totalItems {
  //   int totalQ = 0;
  //   _items.forEach((key, value) {
  //     totalQ += value.quantity!;
  //   });
  //   return totalQ;
  // }
}
