part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();
}

class GetResultEvent extends ResultEvent {
  @override
  List<Object> get props => [];
}
