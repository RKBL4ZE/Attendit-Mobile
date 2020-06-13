import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:flutter/material.dart';

class FullTimeTableWidget extends StatelessWidget {
  final TimeTableModel full;

  const FullTimeTableWidget(this.full);

  @override
  Widget build(BuildContext context) {
    return Text(this.full.friday[0].facultyName);
  }
}
