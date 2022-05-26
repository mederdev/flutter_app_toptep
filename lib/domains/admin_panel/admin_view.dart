import 'package:flutter/material.dart';
import 'package:top_tep/constants.dart';
import 'package:top_tep/domains/admin_panel/admin_view_model.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  AdminViewModel adminViewModel = AdminViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: headerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Добавить новость",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: adminViewModel.headerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Заголовок новостей',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: adminViewModel.mainController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Описание',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: ElevatedButton(
                child: const Text('Добавить'),
                onPressed: () async {
                  adminViewModel.addnews();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
