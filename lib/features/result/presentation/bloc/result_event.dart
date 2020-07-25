part of 'result_bloc.dart';

abstract class ResultEvent {}

class GetResultEvent extends ResultEvent {
  final String enrollment;

  GetResultEvent({this.enrollment});
}
