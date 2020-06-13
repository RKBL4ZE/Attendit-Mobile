part of 'timetable_bloc.dart';

abstract class TimetableState extends Equatable {
  const TimetableState();
}

class TimetableLoading extends TimetableState {
  @override
  List<Object> get props => [];
}

class TimetableLoaded extends TimetableState {
  final TimeTableModel timetable;

  TimetableLoaded(this.timetable);
  @override
  List<Object> get props => [timetable];
}

class FullTimetableLoaded extends TimetableState {
  final TimeTableModel full;

  FullTimetableLoaded(this.full);
  @override
  List<Object> get props => [full];
}

class TimetableError extends TimetableState {
  final String message;

  TimetableError({this.message});
  @override
  List<Object> get props => [message];
}
