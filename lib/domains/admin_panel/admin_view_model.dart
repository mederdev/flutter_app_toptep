import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminViewModel {
  TextEditingController headerController = TextEditingController();

  TextEditingController mainController = TextEditingController();

  void addnews() async {
    final db = FirebaseFirestore.instance;
    int count =
        await db.collection('news').get().then((value) => value.docs.length) +
            1;

    db.collection('news').doc('$count').set({
      "header": headerController.text,
      "main": mainController.text,
    });
  }
}
