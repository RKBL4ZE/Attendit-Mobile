import 'package:Attendit/core/icons/icons_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RankListCard extends StatelessWidget {
  final String studentName;
  final String clgName;
  final num rank;
  final String percentage;

  const RankListCard(
      {Key key, this.studentName, this.clgName, this.rank, this.percentage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
