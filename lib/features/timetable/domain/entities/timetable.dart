import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Subject {
  final String subjectCode;
  final String subjectName;

  Subject(this.subjectCode, this.subjectName);
}

abstract class SubjectName {
  final String name;
  final String fullName;

  SubjectName(this.name, this.fullName);

}

abstract class Faculty {
  final String name;

  Faculty(this.name);
}

abstract class Timing {
  final String startTime;
  final String endTime;
  final SubjectName subject;
  final Faculty faculty;

  Timing(this.startTime, this.endTime, this.subject, this.faculty);
}

abstract class TimeTable extends Equatable {
  final List<Timing> monday;
  final List<Timing> tuesday;
  final List<Timing> wednesday;
  final List<Timing> thursday;
  final List<Timing> friday;
  final List<Timing> saturday;
  // final List<Timing> sunday;

  TimeTable({
    @required this.monday,
    @required this.tuesday,
    @required this.wednesday,
    @required this.thursday,
    @required this.friday,
    @required this.saturday,
    // @required this.sunday,
  });

  @override
  List<Object> get props =>
      [monday, tuesday, wednesday, thursday, friday, saturday];
}

abstract class Group extends Equatable {
  final num id;
  final TimeTable timetable;

  Group(this.id, this.timetable);

  @override
  List<Object> get props => [id, timetable];
}
