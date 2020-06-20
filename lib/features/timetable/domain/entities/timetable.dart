import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class Subject{
  final String subjectCode;
  final String subjectName;

  Subject(this.subjectCode, this.subjectName);
}

abstract class Faculty{
  final String name;

  Faculty(this.name);
}



abstract class Timing {
  final String startTime;
  final String endTime;
  final List<Subject> subject;
  final List<Faculty> faculty;

  Timing(this.startTime, this.endTime, this.subject, this.faculty);

 
}

class TimeTable extends Equatable {
  final List<Timing> monday;
  final List<Timing> tuesday;
  final List<Timing> wednesday;
  final List<Timing> thursday;
  final List<Timing> friday;
  final List<Timing> saturday;
 

  TimeTable({
      @required this.monday,
      @required this.tuesday,
      @required this.wednesday,
      @required this.thursday,
      @required this.friday,
      @required this.saturday,
      });

  @override
  List<Object> get props =>
      [monday, tuesday, wednesday, thursday, friday, saturday];
}


