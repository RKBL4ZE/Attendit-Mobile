import 'dart:math';

import 'package:Attendit/features/home/data/models/student_attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

num percentage=0, totalattendance = 0, attendanceget = 0;

class AttendenceBarWidget extends StatelessWidget {
  final List<StudentAttendanceModel> attendanceBar;

  // final List attendanceBar;
  //final attendence = DUMMY_subdetailsatten.toList();

  AttendenceBarWidget({
    @required this.attendanceBar,
  });

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < attendanceBar.length; i++) {
      totalattendance = totalattendance + attendanceBar[i].totalLectures;
      attendanceget = attendanceget + attendanceBar[i].lecturesAttended;
      percentage = attendanceget / totalattendance;
    }

    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
           // margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      linearGradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 145, 86, 1),
                        Color.fromRGBO(245, 102, 116, 1)
                      ]),
                      circularStrokeCap: CircularStrokeCap.round,
                      arcType: ArcType.HALF,
                      arcBackgroundColor: Colors.white,
                      animation: true,
                      backgroundColor: Colors.transparent,
                      animationDuration: 1000,
                      radius: 170.0,
                      lineWidth: 15.0,
                      percent: percentage.toDouble(),
                      //footer: Text("ve"),
                      center: new Text(
                        "${(percentage * 100).toStringAsFixed(0)}%",
                        style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 40,
                            color: Color.fromRGBO(245, 102, 116, 1),
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
                          "Total Attendance",
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
