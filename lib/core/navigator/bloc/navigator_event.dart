part of 'navigator_bloc.dart';

class NavigatorEvent extends Equatable {
  List<Object> get props => [];
}

class NavigatorActionPop extends NavigatorEvent {}

class NavigateToHomeEvent extends NavigatorEvent {}

class NavigateToFullTimetableEvent extends NavigatorEvent {
  final TimeTableModel full;

  NavigateToFullTimetableEvent(this.full);
}
