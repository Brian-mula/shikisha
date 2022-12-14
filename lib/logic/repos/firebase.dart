import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/logic/models/user_model.dart';

class ProductsContoller {
  bool isExisting = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  // !get all products
  Future<List<ProductModel>> get allProducts async {
    QuerySnapshot<Map<String, dynamic>> productSnap = await _firestore
        .collectionGroup("userproducts")
        .where("isVerified", isEqualTo: true)
        .orderBy("price", descending: true)
        .get();

    return productSnap.docs
        .map((doc) => ProductModel.fromSnapshot(doc))
        .toList();

    // QuerySnapshot<Map<String, dynamic>> snapshot =
    //     await _firestore.collection("products").get();
    // return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    // QuerySnapshot<Map<String, dynamic>> usersnapshot =
    //     await _firestore.collection("users").get();
    // List<ProductModel> prodcuts = [];
    // List<UserModel> users =
    //     usersnapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    // for (var user in users) {
    //   QuerySnapshot<Map<String, dynamic>> snap =
    //       await _products.doc(user.id).collection("userproducts").get();
    //   prodcuts =
    //       snap.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    // }
    // return prodcuts;
  }

  Future<List<ProductModel>> userProducts() async {
    QuerySnapshot<Map<String, dynamic>> usersnapshot =
        await _firestore.collection("users").get();
    List<ProductModel> prodcuts = [];
    List<UserModel> users =
        usersnapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    for (var user in users) {
      QuerySnapshot<Map<String, dynamic>> snap =
          await _products.doc(user.id).collection("userproducts").get();
      prodcuts =
          snap.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    }
    // QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
    //     .collection("products")
    //     .where('phone', isEqualTo: user.phone)
    //     .get();
    // isExisting = true;
    return prodcuts;
  }

  // ! add a product
  Future<void> addProduct(ProductModel product, UserModel user) async {
    try {
      // await _products.add({
      //   "title": product.title,
      //   "category": product.category,
      //   "description": product.description,
      //   "price": product.price,
      //   "image": product.img,
      //   "seller": product.seller,
      //   "phone": product.phone
      // });
      await _products.doc(user.id).set({
        "title": product.title,
        "category": product.category,
        "description": product.description,
        "price": product.price,
        "image": product.img,
        "seller": product.seller,
        "phone": product.phone
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
