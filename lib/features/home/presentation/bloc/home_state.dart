part of 'home_bloc.dart';

// @immutable
abstract class HomeState {}

class DetailsLoading extends HomeState {}

class DetailsLoaded extends HomeState {
  final Map<String, dynamic> _allDetails;

  StudentDetailsModel student;
  List<StudentAssignmentModel> assignmentsList;
  List<StudentAttendanceModel> attendanceList;

  DetailsLoaded(this._allDetails) {
    student = _allDetails['Student'];
    assignmentsList = _allDetails['StudentAssignments'];
    attendanceList = _allDetails['StudentAttendance'];
  }
}

class DetailsError extends HomeState {
  final String message;

  DetailsError({@required this.message});

  // @override
  // List<Object> get props => [message];
}
