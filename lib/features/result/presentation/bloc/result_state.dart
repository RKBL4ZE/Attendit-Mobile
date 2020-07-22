part of 'result_bloc.dart';

abstract class ResultState extends Equatable {
  const ResultState();
}

class ResultInitial extends ResultState {
  @override
  List<Object> get props => [];
}

class ResultLoading extends ResultState {
  @override
  List<Object> get props => [];
}

class ResultLoaded extends ResultState {
  final ResultData resultData;

  ResultLoaded({this.resultData});
  @override
  List<Object> get props => [resultData];
}

class ResultError extends ResultState {
  final String message;

  ResultError({this.message});
  @override
  List<Object> get props => [message];
}
