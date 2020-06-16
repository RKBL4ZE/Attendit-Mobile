import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:flutter/material.dart';

class FullTimeTablePage extends StatelessWidget {
final TimeTableModel fulltimetable;

  const FullTimeTablePage({Key key, this.fulltimetable}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   // final TimeTableModel full = ModalRoute.of(context).settings.arguments;
    return Text(fulltimetable.friday[0].facultyName);
  }
}
