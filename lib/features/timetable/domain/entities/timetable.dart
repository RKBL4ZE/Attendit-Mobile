import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TimeTable extends Equatable {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;

  TimeTable({
      @required this.monday,
      @required this.tuesday,
      @required this.wednesday,
      @required this.thursday,
      @required this.friday,
      @required this.saturday,
      @required this.sunday});

  @override
  List<Object> get props =>
      [monday, tuesday, wednesday, thursday, friday, saturday, sunday];
}
