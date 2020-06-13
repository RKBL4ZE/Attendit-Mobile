import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:Attendit/features/timetable/presentation/widgets/timetable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final TimeTableModel full;

  const SingleDayTimeTableWidget(this.day, this.full);

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
                  itemBuilder: (ctx, index) => TimeTableCardWidget(
                    time: day[index].time,
                    facultyName: day[index].facultyName,
                    subjectName: day[index].subjectName,
                  ),
                  itemCount: day.length,
                ),
                day.length),

            Container(
              alignment: Alignment.bottomCenter,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  // Navigate to Full Timetable
                  BlocProvider.of<TimetableBloc>(context)
                      .add(GetFullTimeTableEvent(full));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(95, 197, 209, 1),
                          Color.fromRGBO(152, 214, 217, 1)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "View Full Time Table",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            //FullTimeTableWidget(timetable: fulltimetable),
          ]),
    );
  }
}
