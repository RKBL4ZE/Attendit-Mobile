import 'dart:async';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';

import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:Attendit/features/newsfeed/domain/usecases/get_news_feed.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'newsfeed_event.dart';
part 'newsfeed_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String UNAUTHORIZED_FAILURE_MESSAGE = 'Invalid Crendentials';

@injectable
class NewsfeedBloc extends Bloc<NewsfeedEvent, NewsfeedState> {
  final GetNewsFeed getNewsFeed;

  NewsfeedBloc(this.getNewsFeed);
  @override
  NewsfeedState get initialState => NewsfeedLoading();

  @override
  Stream<NewsfeedState> mapEventToState(
    NewsfeedEvent event,
  ) async* {
    if (event is GetNewsfeedEvent) {
      final failureOrNewsFeed = await getNewsFeed(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrNewsFeed);
    }
  }

  Stream<NewsfeedState> _eitherLoadedOrErrorState(
    Either<Failure, List<NewsFeed>> failureOrNewsFeed,
  ) async* {
    yield failureOrNewsFeed.fold(
      (failure) => NewsfeedError(message: _mapFailureToMessage(failure)),
      (details) => NewsfeedLoaded(details),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case UnauthorizedFailure:
        return UNAUTHORIZED_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
