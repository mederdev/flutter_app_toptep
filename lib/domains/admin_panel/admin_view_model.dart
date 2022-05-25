import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:top_tep/database_options/base_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _namee = '';
  bool _admin = false;
  User user = FirebaseAuth.instance.currentUser!;

  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _firebaseFirestore.collection('users').doc(user.uid).get().then((value) {
      final String nameUser = value.data()?.values.first;
      final bool adminUer = value.data()?.values.elementAt(1);
      setState(() {
        _namee = nameUser;
        _admin = adminUer;
      });
    });
  }

  void start() async {
    // TODO: implement initState
    final db = FirebaseFirestore.instance.collection("users").doc(user.uid);
    await db.get().then(
      (datasnapshot) {
        _namee = (datasnapshot.data()?.values.first);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Топ Теп'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.green),
                    accountName: Text(_namee),
                    accountEmail: Text(user.email!),
                  )),
              Visibility(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('User Panel'),
                ),
              )
            ],
          ),
        ),
        body: Text("asdasd"));
  }
}
