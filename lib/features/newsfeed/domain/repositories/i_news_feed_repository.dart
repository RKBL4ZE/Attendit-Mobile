import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class INewsFeedRepository {
  Future<Either<Failure, List<NewsFeed>>> getNewsFeed();

  
}
