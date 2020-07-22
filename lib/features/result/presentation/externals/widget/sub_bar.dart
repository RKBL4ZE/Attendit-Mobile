import 'package:Attendit/config/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TotalMarksBarWidget extends StatelessWidget {
  final num percentage;
  final num percentageWithCredits;

  const TotalMarksBarWidget(
      {Key key, this.percentage=0, this.percentageWithCredits=0})
      : super(key: key);

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
                  percent: percentage.toDouble()/100,
                  //footer: Text("ve"),
                  center: new Text(
                    "$percentage%",
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
                  percent: percentageWithCredits.toDouble()/100,
                  footer: AutoSizeText(
                    "% with Credits",
                    style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: footersize,
                        color: GraphStyle.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  center: new Text(
                    "$percentageWithCredits%",
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
