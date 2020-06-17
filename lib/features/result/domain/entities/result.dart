import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Internals {
  final String subjectCode;
  final String subjectName;
  final num semesterId;
  final num marks;
  final num maxMarks;

  Internals(this.subjectCode, this.subjectName, this.semesterId, this.marks,
      this.maxMarks);
}

abstract class Externals {
  final String subjectCode;
  final String subjectName;
  final num semesterId;
  final num internalsMarks;
  final num externalMarks;
  final num maxInternalsMarks;
  final String grade;

  Externals(
      this.subjectCode,
      this.subjectName,
      this.semesterId,
      this.internalsMarks,
      this.externalMarks,
      this.maxInternalsMarks,
      this.grade);
}

abstract class Grade {
  final String name;
  final num percentage;
  final num semesterId;

  Grade(this.name, this.percentage, this.semesterId);
}

abstract class Credits {
  final num semsterId;
  final num credits;

  Credits(this.semsterId, this.credits);
}

class Result extends Equatable {
  final String enrollment;
  final String name;
  final List<Internals> internals;
  final List<Externals> externals;
  final List<Grade> grade;
  final List<Credits> credits;

  Result(
      {@required this.enrollment,
      @required this.name,
      @required this.internals,
      @required this.externals,
      @required this.grade,
      @required this.credits});

  @override
  List<Object> get props =>
      [enrollment, name, internals, externals, grade, credits];
}
