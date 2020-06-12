part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailsLoading extends HomeState {}

class DetailsLoaded extends HomeState {
  final StudentDetails studentDetails;

  DetailsLoaded(this.studentDetails);
}

class DetailsError extends HomeState {
  final String message;

  DetailsError({@required this.message});

  @override
  List<Object> get props => [message];
}
