import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Subject {
  final String subjectCode;
  final String subjectName;

  Subject(this.subjectCode, this.subjectName);
}

class StudentAttendance extends Equatable {
  final Subject subject;
  final num lecturesAttended;
  final num totalLectures;

  StudentAttendance(
      {@required this.subject,
      @required this.lecturesAttended,
      @required this.totalLectures});

  @override
  List<Object> get props =>
      [subject, lecturesAttended, totalLectures];
}
