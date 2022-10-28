import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shikisha/logic/models/products_model.dart';
import 'package:shikisha/widgets/text_widget.dart';

class SellerProduct {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  Stream get allProducts => _firestore.collection("products").snapshots();

  Future<void> addNewProduct(Product product, BuildContext context) async {
    try {
      await _products.add({
        "name": product.title,
        "price": product.price,
        "description": product.description,
        "category": product.category,
        "image": product.image,
      });
    } on FirebaseException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: TextWidget(
                  text: "Error Occured",
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red.shade500),
                ),
                content: TextWidget(
                  text: e.toString(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red.shade500),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const TextWidget(text: "OK"))
                ],
              ));
    }
  }

// ! delete a product

  Future<void> deleteProduct(String id, BuildContext context) async {
    final snackBar = SnackBar(
        content: TextWidget(
      text: "product deleted successfully",
      textStyle: Theme.of(context).textTheme.bodySmall,
    ));
    try {
      await _products.doc(id).delete();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: TextWidget(
                  text: "Error Occured",
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red.shade500),
                ),
                content: TextWidget(
                  text: e.toString(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red.shade500),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const TextWidget(text: "OK"))
                ],
              ));
    }
  }

  Future<void> updateProduct(
      String id, BuildContext context, Product product) async {
    try {
      _products.doc(id).update({
        "name": product.title,
        "price": product.price,
        "description": product.description,
        "category": product.category,
        "image": product.image,
      });
    } on FirebaseException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: TextWidget(
                  text: "Error Occured",
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red.shade500),
                ),
                content: TextWidget(
                  text: e.toString(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red.shade500),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const TextWidget(text: "OK"))
                ],
              ));
    }
  }
}
