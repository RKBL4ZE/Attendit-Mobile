part of 'timetable_bloc.dart';

abstract class TimetableEvent extends Equatable {
  const TimetableEvent();
}

class GetTimeTableEvent extends TimetableEvent {
  @override
  List<Object> get props => [];
}

class GetFullTimeTableEvent extends TimetableEvent {
  final TimeTableModel timetable;

  GetFullTimeTableEvent(this.timetable);
  @override
  List<Object> get props => [];
}
