import 'package:Attendit/features/home/data/models/student_attendence_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../../config/styles.dart';

class AttendanceCardWidget extends StatelessWidget {
  final List<StudentAttendanceModel> allatendancelist;

  AttendanceCardWidget({
    @required this.allatendancelist,
  });

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
   //double height = MediaQuery.of(context).size.height;
   Color percolor(num percentage) {
      if (percentage < 0.75) {
        return GraphStyle.low;
      } else if (percentage >= 0.75 && percentage <= 0.80) {
        return GraphStyle.mid;
      } else if (percentage > 0.80) {
        return GraphStyle.high;
      }
      return Colors.white30;
    }

    Color percolorshadow(num percolor) {
      if (percolor < 0.75) {
        return GraphStyle.lowAccent;
      } else if (percolor >= 0.75 && percolor <= 0.80) {
        return GraphStyle.midAccent;
      } else if (percolor > 0.80) {
        return GraphStyle.highAccent;
      }
      return Colors.white30;
    }

    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(0),
                boxShadow: [CardStyle.boxShadow]),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  //margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Text(
                          "Attendance By Subjects :",
                          style: CardStyle.headingStyle,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                // vertical: 5,
                                horizontal: 10,
                              ),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minHeight: 50, maxHeight: 50),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // Expanded(
                                        //     flex: 2, // 20%
                                        //     child: ),
                                        Expanded(
                                            flex: 8, // 60%
                                            child: Container(
                                              child: Column(
                                                children: <Widget>[
                                                  AutoSizeText(
                                                      allatendancelist[index]
                                                          .subject
                                                          .subjectName,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          CardStyle.textStyle),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  LinearPercentIndicator(
                                                    animationDuration: 700,
                                                    animation: true,
                                                    // width: width * .74,
                                                    lineHeight: 7.0,
                                                    percent: allatendancelist[
                                                                index]
                                                            .lecturesAttended /
                                                        allatendancelist[index]
                                                            .totalLectures,
                                                    backgroundColor: percolorshadow(
                                                        allatendancelist[index]
                                                                .lecturesAttended /
                                                            allatendancelist[
                                                                    index]
                                                                .totalLectures),
                                                    progressColor: percolor(
                                                        allatendancelist[index]
                                                                .lecturesAttended /
                                                            allatendancelist[
                                                                    index]
                                                                .totalLectures),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                          flex: 2, // 20%
                                          child: Text(
                                            "${allatendancelist[index].lecturesAttended.toString()}/${allatendancelist[index].totalLectures.toString()}",
                                            textAlign: TextAlign.right,
                                            style: CardStyle.textStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Divider()
                                  ],
                                ),
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
