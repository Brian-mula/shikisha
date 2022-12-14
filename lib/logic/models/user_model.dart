import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String phone;
  bool isApproved;

  UserModel(
      {required this.name,
      required this.phone,
      required this.id,
      required this.isApproved});

  Map<String, dynamic> toSnapshot() {
    return {"id": id, 'name': name, 'phone': phone, "isApproved": isApproved};
  }

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!['email'] ?? "email",
        phone = doc.data()!['phone'],
        isApproved = doc.data()!['isApproved'] ?? false;

  String toJson() => json.encode(toSnapshot());

  factory UserModel.fromJson(String source) =>
      UserModel.fromSnapshot(json.decode(source));
}
