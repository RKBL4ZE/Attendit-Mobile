import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Timing {
  final String time;
  final String subjectName;
  final String facultyName;

  Timing(this.time, this.subjectName, this.facultyName);
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
