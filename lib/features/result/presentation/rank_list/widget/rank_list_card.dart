import 'package:Attendit/core/icons/icons_service.dart';
import 'package:Attendit/features/result/presentation/externals/pages/external.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RankListCard extends StatelessWidget {
  final String studentName;
  final String clgName;
  final num rank;
  final String percentage;
  final String rollNumber;

  const RankListCard(
      {Key key,
      this.studentName,
      this.clgName,
      this.rank,
      this.percentage,
      this.rollNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(context, screen: ExternalPage(enrollment: rollNumber));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                rank.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            title: Row(
              children: <Widget>[
                AutoSizeText(studentName),
                SizedBox(
                  width: 5,
                ),
                geticon(rank),
              ],
            ),
            subtitle: Text(clgName),
            trailing: Text(percentage),
          ),
        ),
      ),
    );
  }
}

Widget geticon(num rank) {
  Widget icon = Text("");
  if (rank == 1) {
    icon = IconsService.rank1;
  } else if (rank == 2) {
    icon = IconsService.rank2;
  } else if (rank == 3) {
    icon = IconsService.rank3;
  }
  return icon;
}
