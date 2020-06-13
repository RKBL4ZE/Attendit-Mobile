import 'dart:math';

import 'package:Attendit/features/home/data/models/student_attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AttendanceCardWidget extends StatelessWidget {
  final List<StudentAttendanceModel> allatendancelist;

  AttendanceCardWidget({
    @required this.allatendancelist,
  });

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          // border: Border.all(color: Colors.grey),
          // borderRadius: BorderRadius.circular(10),
          ),
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      height: 100 * allatendancelist.length.truncateToDouble(),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
//double height = MediaQuery.of(context).size.height;
    Color percolor(num percolor) {
      if (percolor < 0.4) {
        return Colors.red;
      } else if (percolor >= 0.4 && percolor <= 0.8) {
        return Colors.yellow;
      } else if (percolor > 0.8) {
        return Colors.green;
      }
      return Colors.white30;
    }

    Color percolorshadow(num percolor) {
      if (percolor < 0.4) {
        return Colors.red[50];
      } else if (percolor >= 0.4 && percolor <= 0.8) {
        return Colors.yellow[50];
      } else if (percolor > 0.8) {
        return Colors.green[50];
      }
      return Colors.white30;
    }

    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(50),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                            ),
                          ]),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          "Attendance By Subjects :",
                          style: TextStyle(
                            // fontFamily: 'Rubik',
                            fontSize: 20,
                            color: Color.fromRGBO(46, 96, 102, 1),
                            //  fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      buildContainer(
                        ListView.builder(
                          primary:
                              false, //physics: const NeverScrollableScrollPhysics()
                          itemBuilder: (ctx, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      flex: 2, // 20%
                                      child: Text(
                                        allatendancelist[index].subjectName,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          // fontFamily: 'Rubik',
                                          fontSize: 15,
                                          color:
                                              Color.fromRGBO(128, 139, 151, 1),
                                          //  fontWeight: FontWeight.bold
                                        ),
                                      )),
                                  Expanded(
                                      flex: 6, // 60%
                                      child: Container(
                                        child: LinearPercentIndicator(
                                          animationDuration: 700,
                                          animation: true,
                                          width: width * .48,
                                          lineHeight: 10.0,
                                          percent: allatendancelist[index]
                                                  .lecturesAttended /
                                              allatendancelist[index]
                                                  .totalLectures,
                                          backgroundColor: percolorshadow(
                                              allatendancelist[index]
                                                      .lecturesAttended /
                                                  allatendancelist[index]
                                                      .totalLectures),
                                          progressColor: percolor(
                                              allatendancelist[index]
                                                      .lecturesAttended /
                                                  allatendancelist[index]
                                                      .totalLectures),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2, // 20%
                                      child: Text(
                                        "${allatendancelist[index].lecturesAttended.toString()}/${allatendancelist[index].totalLectures.toString()}",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          // fontFamily: 'Rubik',
                                          fontSize: 15,
                                          color:
                                              Color.fromRGBO(128, 139, 151, 1),
                                          //  fontWeight: FontWeight.bold
                                        ),
                                      )),
                                ],
                              )),
                          itemCount: allatendancelist.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
