part of 'timetable_bloc.dart';

abstract class TimetableEvent extends Equatable {
  const TimetableEvent();
}

class GetTimeTableEvent extends TimetableEvent {
  @override
  List<Object> get props => [];
}
