import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/presentation/widgets/timetable_card.dart';
import 'package:flutter/material.dart';

Widget buildContainer(Widget child, num length) {
  return Container(
    decoration: BoxDecoration(
        // color: Colors.white,
        // border: Border.all(color: Colors.grey),
        // borderRadius: BorderRadius.circular(10),
        ),
    margin: EdgeInsets.all(10),
    // padding: EdgeInsets.all(10),
    height: 145 * length.truncateToDouble(),
    width: double.infinity,
    child: child,
  );
}

class SingleDayTimeTableWidget extends StatelessWidget {
  final List<TimingModel> day;

  const SingleDayTimeTableWidget(this.day);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(timetable[0].time),

            Container(
              margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text("Today's Lectures",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: 'Rubik',

                      fontSize: 31,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(46, 96, 102, 1),
                      fontWeight: FontWeight.bold)),
            ),

            buildContainer(
                ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    // String subjectName = "";
                    // String facultyName = "";

                    // day[index].subject.forEach(
                    //     (element) => subjectName += '${element.subjectName}/');
                    // day[index].faculty.forEach(
                    //     (element) => facultyName += '${element.name}/');

                    // subjectName = subjectName.substring(0, subjectName.length - 1);
                    // facultyName = facultyName.substring(0, facultyName.length - 1);

                    return TimeTableCardWidget(
                      startTime: day[index].startTime,
                      endTime: day[index].endTime,
                      subject: day[index].subject.name,
                      faculty: day[index].faculty.name,
                    );
                  },
                  itemCount: day.length,
                ),
                day.length),

            //FullTimeTableWidget(timetable: fulltimetable),
          ]),
    );
  }
}
