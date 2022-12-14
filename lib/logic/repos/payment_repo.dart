import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PaymentRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _payments =
      FirebaseFirestore.instance.collection("payments");

  Future<void> mpesaName(String mname, BuildContext context) async {
    await _payments
        .add({"email": _auth.currentUser!.email, "mpesaName": mname});
    Navigator.pushNamed(context, "/home");
  }
}
