part of 'assignment_bloc.dart';

@immutable
abstract class AssignmentEvent extends Equatable {
  const AssignmentEvent();
}

class GetAssignmentDetailsEvent extends AssignmentEvent {
  @override
  List<Object> get props => [];
}

class SubmitAssignmentEvent extends AssignmentEvent {
  final String id;
  final File file;

  SubmitAssignmentEvent({
    this.id,
    this.file,
  });

  @override
  List<Object> get props => [
        id,
        file,
      ];
}

class UnsubmitAssignmentEvent extends AssignmentEvent {
  final String id;

  UnsubmitAssignmentEvent(this.id);

  @override
  List<Object> get props => [
        id,
      ];
}
