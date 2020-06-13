part of 'newsfeed_bloc.dart';

abstract class NewsfeedState extends Equatable {
  const NewsfeedState();
}

class NewsfeedLoading extends NewsfeedState {

  @override
  List<Object> get props => [];
}
class NewsfeedLoaded extends NewsfeedState {
  final List<NewsFeed> newsfeed;

  NewsfeedLoaded(this.newsfeed);
  @override
  List<Object> get props => [];
}

class NewsfeedError extends NewsfeedState {
  final String message;

  NewsfeedError({this.message});
  @override
  List<Object> get props => [];
}
