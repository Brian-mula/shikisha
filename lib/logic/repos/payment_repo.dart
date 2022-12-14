import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _payments =
      FirebaseFirestore.instance.collection("payments");

  Future<void> mpesaName(String name) async {
    await _payments.add({"email": _auth.currentUser!.email, "mpesaName": name});
  }
}
