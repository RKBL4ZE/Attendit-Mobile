import 'dart:convert';

import 'package:Attendit/features/newsfeed/data/models/news_feed_model.dart';
import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';

abstract class INewsFeedLocalDataSource {
  /// Gets the cached [NewsFeedModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  ///
  Future<List<NewsFeed>> getNewsFeed();

  Future<void> cacheNewsFeed(List<NewsFeedModel> newsFeed);
}

const String CACHE_NEWS_FEED = "CACHE_NEWS_FEED";

@Injectable(as: INewsFeedLocalDataSource)
@lazySingleton
class NewsFeedLocalDataSource implements INewsFeedLocalDataSource {
  final Box _box;

  NewsFeedLocalDataSource(this._box);

  @override
  Future<void> cacheNewsFeed(List<NewsFeedModel> newsFeed) {
    return _box.put(CACHE_NEWS_FEED,
        json.encode(newsFeed.map((e) => e.toJson()).toList()).toString());
  }

  @override
  Future<List<NewsFeed>> getNewsFeed() {
    final newsFeedString = _box.get(CACHE_NEWS_FEED);
    if (newsFeedString != null) {
      final newsFeedModel = json
          .decode(newsFeedString)
          .map<NewsFeedModel>((e) => {NewsFeedModel.fromJson(e)})
          .toList();

      return Future.value(newsFeedModel);
    }
    throw CacheException();
  }
}
