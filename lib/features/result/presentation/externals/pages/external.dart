import 'package:Attendit/features/result/presentation/externals/widget/marksbysub_card.dart';
import 'package:Attendit/features/result/presentation/externals/widget/semesterselector.dart';
import 'package:Attendit/features/result/presentation/externals/widget/studentnamecard.dart';
import 'package:Attendit/features/result/presentation/externals/widget/sub_bar.dart';
import '../../../../../config/styles.dart';
import 'package:flutter/material.dart';

//import '../screens/Create_Property_screen.dart';
//import '../dummy_data.dart';
//import '../widgets/AllProperty_widget.dart';

class ExternalPage extends StatelessWidget {
  // static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: PrimaryStyle.padding,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              "Student External Report",
              textAlign: TextAlign.center,
              style: ResultCardStyle.headingTextStyle,
            ),
          ),
          StudentNameCard(),
          TotalMarksBarWidget(),
          SemSelect(),
          SizedBox(
            height: 20,
          ),
          MarksBySub(),
          MarksBySub(),
          MarksBySub(),
        ],
      ),
    )));
  }
}
