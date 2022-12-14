import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shikisha/logic/providers/seller_products_provider.dart';
import 'package:shikisha/widgets/text_widget.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  Stream<User?> get authStateChange => _auth.authStateChanges();

  // !signin the user with email and password

  Future<void> signin(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: TextWidget(
                  text: "Error occured",
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red),
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

  // !signup with email and password
  Future<void> signUp(String email, String password, BuildContext context,
      {String? phone}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _users.add({"name": email, "isApproved": false});

      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: TextWidget(
                  text: "Error occured",
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.red),
                ),
                content: TextWidget(
                  text: e.toString(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red.shade600),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const TextWidget(text: "OK"))
                ],
              ));
    } catch (e) {
      if (e == 'email-already-in-use') {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const TextWidget(text: "An Error occured"),
                  content: TextWidget(
                    text: "Email Already in use",
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.red.shade600),
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

  Future<void> signOutUser() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    try {
      await _auth.signInWithCredential(credential);
      Navigator.pushNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
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

  Future<void> sendVerification(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
