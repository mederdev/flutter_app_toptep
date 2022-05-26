import 'package:flutter/material.dart';
import '../home_view_model.dart';

class ScheduleView extends StatelessWidget {
  HomePageViewModel? homePageViewModel;

  int counter = 1;

  ScheduleView(HomePageViewModel a, {Key? key}) : super(key: key) {
    homePageViewModel = a;
  }

  @override
  Widget build(BuildContext context) {
    counter = 1;
    return Scrollbar(
      child: ListView(
        restorationId: 'list_demo_list_view',
        padding: const EdgeInsets.symmetric(vertical: 6),
        children: [
          for (int index = homePageViewModel!.homeModel.dataSchedule.length - 1;
              index > -1;
              index--, counter++)
            Container(
              color: Color.fromARGB(255, 219, 214, 198),
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      child: Text(
                        homePageViewModel!.homeModel.dataSchedule[index].name1!,
                        style: TextStyle(fontSize: 15),
                      )),
                  Container(
                      child: Text(
                    homePageViewModel!.homeModel.dataSchedule[index].date! +
                        "\n" +
                        homePageViewModel!.homeModel.dataSchedule[index].time!,
                    textAlign: TextAlign.center,
                  )),
                  Container(
                    child: Text(
                        homePageViewModel!.homeModel.dataSchedule[index].name2!,
                        style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
