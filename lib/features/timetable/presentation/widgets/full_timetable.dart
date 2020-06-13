import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:flutter/material.dart';

class FullTimeTablePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TimeTableModel full = ModalRoute.of(context).settings.arguments;
    return Text(full.friday[0].facultyName);
  }
}
