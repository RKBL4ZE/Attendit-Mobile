import 'package:Attendit/config/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TotalMarksBarWidget extends StatelessWidget {
  final List attendanceBar;
  //final attendence = DUMMY_subdetailsatten.toList();

  TotalMarksBarWidget({
    /*@required*/ this.attendanceBar,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = 120;
    final double angle = 0;
    final double footersize = 20;

    final double insidefont = 30;

    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
            margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularPercentIndicator(
                  footer: Text(
                    "Percentage",
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: footersize,
                        color: GraphStyle.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  startAngle: angle,
                  progressColor: GraphStyle.primary,
                  circularStrokeCap: CircularStrokeCap.round,
                  // arcType: ArcType.FULL,
                  // arcBackgroundColor: Colors.white,
                  animation: true,
                  backgroundColor: Colors.transparent,
                  animationDuration: 1000,
                  radius: radius,
                  lineWidth: 15.0,
                  percent: 0.6,
                  //footer: Text("ve"),
                  center: new Text(
                    "60%",
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: insidefont,
                        color: GraphStyle.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  //progressColor: Color.fromRGBO(95, 197, 209, 1),
                ),
                SizedBox(
                  width: 10,
                ),
                CircularPercentIndicator(
                  startAngle: angle,
                  progressColor: GraphStyle.primary,
                  circularStrokeCap: CircularStrokeCap.round,
                  // arcType: ArcType.FULL,
                  // arcBackgroundColor: Colors.white,
                  animation: true,
                  backgroundColor: Colors.transparent,
                  animationDuration: 1000,
                  radius: radius,
                  lineWidth: 15.0,
                  percent: 1,
                  footer: AutoSizeText(
                    "% with Credits",
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: footersize,
                        color: GraphStyle.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  center: new Text(
                    "60%",
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: insidefont,
                        color: GraphStyle.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  //progressColor: Color.fromRGBO(95, 197, 209, 1),
                ),
              ],
            )));
  }
}
