part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();
}

class GetResultEvent extends ResultEvent {
  final String enrollment;

  GetResultEvent(this.enrollment);
  @override
  List<Object> get props => [enrollment];
}
