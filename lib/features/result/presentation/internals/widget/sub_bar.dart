import 'dart:math';

import 'package:Attendit/config/styles.dart';
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
    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      linearGradient: LinearGradient(
                          colors: [Styles.colorPrimary, Styles.colorSecondary]),
                      circularStrokeCap: CircularStrokeCap.round,
                      arcType: ArcType.HALF,
                      arcBackgroundColor: Colors.white,
                      animation: true,
                      backgroundColor: Colors.transparent,
                      animationDuration: 1000,
                      radius: 170.0,
                      lineWidth: 15.0,
                      percent: 0.6,
                      //footer: Text("ve"),
                      center: new Text(
                        "60%",
                        style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 40,
                            color: Styles.colorSecondary,
                            fontWeight: FontWeight.bold),
                      ),
                      //progressColor: Color.fromRGBO(95, 197, 209, 1),
                    ),
                    Positioned(
                      bottom: 20,
                      //right: 10,
                      child: Container(
                        //  width: 300,
                        // color: Colors.black54,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Text(
                          "Total Percentage",
                          style: TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(128, 139, 151, 1),
                          ),
                          //  softWrap: true,
                          //  overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
