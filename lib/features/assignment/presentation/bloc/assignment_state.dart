part of 'assignment_bloc.dart';

// @immutable
abstract class AssignmentState {}

class DetailsLoading extends AssignmentState {}

class DetailsLoaded extends AssignmentState {
  final Map<String, dynamic> _assignmentDetails;

  List<StudentAssignmentModel> assignmentsList;

  DetailsLoaded(this._assignmentDetails) {
    assignmentsList = _assignmentDetails['StudentAssignments'];
  }
}

class DetailsError extends AssignmentState {
  final String message;

  DetailsError({@required this.message});

  // @override
  // List<Object> get props => [message];
}

abstract class SubmitAssignmentState {}

class SubmitAssignmentInitial extends SubmitAssignmentState {}

class SubmitAssignmentUploading extends SubmitAssignmentState {}

class SubmitAssignmentUploaded extends SubmitAssignmentState {}

class SubmitAssignmentError extends SubmitAssignmentState {
  final String message;

  SubmitAssignmentError({this.message});
}
