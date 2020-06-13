import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:flutter/material.dart';

class FullTimeTableWidget extends StatelessWidget {
  static const routeName = '/fulltimetablewidget';
 // final TimeTableModel timetable;



 // const FullTimeTableWidget({@required this.timetable});

  @override
  Widget build(BuildContext context) {
    final fulltimetable =
        ModalRoute.of(context).settings.arguments as TimeTableModel;
    return Text(fulltimetable.monday[0].subjectName);
  }
}
