import 'package:flutter/material.dart';
import '../home_view_model.dart';

class NewsView extends StatelessWidget {
  HomePageViewModel? homePageViewModel;

  int counter = 1;

  NewsView(HomePageViewModel a, {Key? key}) : super(key: key) {
    homePageViewModel = a;
  }

  @override
  Widget build(BuildContext context) {
    counter = 1;
    return Scrollbar(
      child: ListView(
        restorationId: 'list_demo_list_view',
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (int index = homePageViewModel!.homeModel.dataNews.length - 1;
              index > -1;
              index--, counter++)
            ListTile(
              leading: ExcludeSemantics(
                child: CircleAvatar(child: Text('$counter')),
              ),
              title: Text(
                homePageViewModel!.homeModel.dataNews[index].headerText!,
              ),
              subtitle:
                  Text(homePageViewModel!.homeModel.dataNews[index].mainText!),
            ),
        ],
      ),
    );
  }
}
