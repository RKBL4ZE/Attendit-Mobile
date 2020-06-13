import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/newsfeed/data/datasources/news_feed_local_datasource.dart';
import 'package:Attendit/features/newsfeed/data/datasources/news_feed_remote_datasource.dart';
import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:Attendit/features/newsfeed/domain/repositories/i_news_feed_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: INewsFeedRepository)
@lazySingleton
class NewsFeedRepository implements INewsFeedRepository{

  final INewsFeedLocalDataSource _localDataSource;
  final INetworkInfo _networkInfo;
  final INewsFeedRemoteDataSource _remoteDataSource;

  NewsFeedRepository(this._localDataSource, this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, List<NewsFeed>>> getNewsFeed() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getNewsFeed();
         await _localDataSource.cacheNewsFeed(models);
        return Right(models);
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }


}



