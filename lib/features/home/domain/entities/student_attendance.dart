import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class StudentAttendance extends Equatable {
  final String subjectCode;
  final String subjectName;
  final num lecturesAttended;
  final num totalLectures;

  StudentAttendance(
      {@required this.subjectCode,
      @required this.subjectName,
      @required this.lecturesAttended,
      @required this.totalLectures});

  @override
  List<Object> get props =>
      [subjectCode, subjectName, lecturesAttended, totalLectures];
}
