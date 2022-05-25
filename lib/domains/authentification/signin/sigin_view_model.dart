import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool admin = false;
  bool stateUser = false;

  Future<void> signin(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        stateUser = false;
      } else if (e.code == 'email-already-in-use') {
        stateUser = false;
      }
    } catch (e) {
      print(e);
    }
    addnameuser(FirebaseAuth.instance.currentUser?.uid);
    Navigator.pop(context);
    stateUser = true;
  }

  void addnameuser(String? id) async {
    final db = FirebaseFirestore.instance;

    db.collection('users').doc(id.toString()).set({
      "admin": admin,
      "name": nameController.text,
    });
  }
}
