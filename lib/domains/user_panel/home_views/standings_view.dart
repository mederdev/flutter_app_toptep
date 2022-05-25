import 'package:flutter/material.dart';
import 'package:top_tep/domains/user_panel/home_view_model.dart';

class StandingView extends StatelessWidget {
  HomePageViewModel? homePageViewModel;
  TableRow? tableRow;

  StandingView(HomePageViewModel a, {Key? key}) : super(key: key) {
    tableRow = TableRow(a);
    homePageViewModel = a;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: PaginatedDataTable(
          dataRowHeight: 25,
          columnSpacing: 15,
          showFirstLastButtons: false,
          columns: <DataColumn>[
            DataColumn(
              label: Text('КЛУБ'),
              onSort: (columnIndex, ascending) {},
            ),
            DataColumn(
              label: Text('M_P'),
            ),
            DataColumn(
              label: Text('M_W'),
            ),
            DataColumn(
              label: Text('M_L'),
            ),
            DataColumn(
              label: Text('M_D'),
            ),
            DataColumn(
              label: Text('PTS'),
            ),
          ],
          source: tableRow!,
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  HomePageViewModel? tableSource;

  TableRow(HomePageViewModel d) {
    tableSource = d;
  }

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(tableSource!.homeModel.dataStanding[index].clubName!)),
      DataCell(Text(tableSource!.homeModel.dataStanding[index].mp!)),
      DataCell(Text(tableSource!.homeModel.dataStanding[index].mw!)),
      DataCell(Text(tableSource!.homeModel.dataStanding[index].ml!)),
      DataCell(Text(tableSource!.homeModel.dataStanding[index].md!)),
      DataCell(Text(tableSource!.homeModel.dataStanding[index].pts!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => tableSource!.homeModel.dataStanding.length;

  @override
  int get selectedRowCount => 0;
}
