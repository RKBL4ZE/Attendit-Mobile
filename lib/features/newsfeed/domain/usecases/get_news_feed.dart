import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:Attendit/features/newsfeed/domain/repositories/i_news_feed_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetNewsFeed implements UseCase<List<NewsFeed>, NoParams> {
  final INewsFeedRepository repository;

  GetNewsFeed(this.repository);

  Future<Either<Failure, List<NewsFeed>>> call(NoParams params) async {
    return await repository.getNewsFeed();
  }
}


