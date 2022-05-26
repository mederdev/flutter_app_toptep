import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:top_tep/domains/user_panel/home_view_model.dart';
import 'package:top_tep/domains/user_panel/home_views/news_view.dart';
import 'package:top_tep/domains/user_panel/home_views/shedule_view.dart';
import 'package:top_tep/domains/user_panel/home_views/standings_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      onModelReady: (viewModel) => {viewModel.activateListeners()},
      builder: (context, viewModel, child) => DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Топ Теп'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'Новости'),
                Tab(text: 'Таблица'),
                Tab(text: 'Расписание'),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(color: Colors.green),
                      accountName: Text(viewModel.getName()),
                      accountEmail: Text(viewModel.getEmail()),
                    )),
                ListTile(
                  title: const Text("Log Out"),
                  trailing: const Icon(Icons.exit_to_app),
                  onTap: () => {viewModel.signOut()},
                ),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () {
                      viewModel.setStanding();
                    },
                    child: const Text('Admin Panel'),
                  ),
                  visible: viewModel.getAdmin() ? true : false,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              NewsView(viewModel),
              StandingView(viewModel),
              ScheduleView(viewModel)
            ],
          ),
        ),
      ),
    );
  }
}
