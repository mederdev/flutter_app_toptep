import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:top_tep/domains/user_panel/home_model.dart';

class HomePageViewModel extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  HomeModel homeModel = HomeModel();

  String getName() {
    return homeModel.name;
  }

  bool getAdmin() {
    return homeModel.admin;
  }

  String getEmail() {
    return homeModel.user.email!;
  }

  List getNews() {
    return homeModel.dataNews;
  }

  void activateListeners() {
    _firebaseFirestore
        .collection('users')
        .doc(homeModel.user.uid)
        .get()
        .then((value) {
      homeModel.name = value.data()?.values.first;
      homeModel.admin = value.data()?.values.elementAt(1);
    });
    setNews();
    setStanding();
    notifyListeners();
  }

  void setNews() async {
    await _firebaseFirestore.collection('news').get().then((value) => {
          value.docs.forEach((element) {
            final a = element.data().values.first;
            final b = element.data().values.last;
            homeModel.dataNews.add(DataNew(a, b));
          })
        });
    notifyListeners();
  }

  void setStanding() async {
    await _firebaseFirestore.collection('standings').get().then((value) => {
          value.docs.forEach((element) {
            final club = element.data().values.elementAt(3).toString();
            final md = element.data().values.elementAt(1).toString();
            final ml = element.data().values.elementAt(5).toString();
            final mp = element.data().values.elementAt(0).toString();
            final mw = element.data().values.elementAt(2).toString();
            final pts = element.data().values.elementAt(4).toString();
            homeModel.dataStanding.add(DataStanding(club, mp, mw, ml, md, pts));
          }),
        });

    notifyListeners();
  }
}
