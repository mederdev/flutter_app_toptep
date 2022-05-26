import 'package:firebase_auth/firebase_auth.dart';

class HomeModel {
  String name = '';
  bool admin = false;
  User user = FirebaseAuth.instance.currentUser!;

  List<DataNew> dataNews = [];

  List<DataStanding> dataStanding = [];

  List<DataSchedule> dataSchedule = [];
}

class DataNew {
  String? headerText;
  String? mainText;

  DataNew(a, b) {
    headerText = a;
    mainText = b;
  }
}

class DataStanding {
  String? clubName;
  String? mp;
  String? mw;
  String? ml;
  String? md;
  String? pts;

  DataStanding(
      String club, String mp, String mw, String ml, String md, String pts) {
    clubName = club;
    this.mp = mp;
    this.mw = mw;
    this.ml = ml;
    this.md = md;
    this.pts = pts;
  }
}

class DataSchedule {
  String? name1;
  String? name2;
  String? date;
  String? time;

  DataSchedule(String name1, String name2, String date, String time) {
    this.name1 = name1;
    this.name2 = name2;
    this.date = date;
    this.time = time;
  }
}
