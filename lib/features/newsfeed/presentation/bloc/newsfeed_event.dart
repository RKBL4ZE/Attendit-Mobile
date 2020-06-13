part of 'newsfeed_bloc.dart';

abstract class NewsfeedEvent extends Equatable {
  const NewsfeedEvent();
}

class GetNewsfeedEvent extends NewsfeedEvent {
  @override
  List<Object> get props => [];
}
