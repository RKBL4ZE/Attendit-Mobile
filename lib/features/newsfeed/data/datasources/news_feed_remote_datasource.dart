import 'dart:async';
import 'dart:convert';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/network/graphql_service.dart';
import 'package:Attendit/core/util/gql_query.dart';
import 'package:Attendit/features/newsfeed/data/models/news_feed_model.dart';
import 'package:injectable/injectable.dart';

abstract class INewsFeedRemoteDataSource {
  /// Gets the cached [StudentDetailsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if no cached data is present.
  ///
  Future<List<NewsFeedModel>> getNewsFeed();
}

@Injectable(as: INewsFeedRemoteDataSource)
@lazySingleton
class NewsFeedRemoteDataSource implements INewsFeedRemoteDataSource {
  final IGraphQLService _client;

  NewsFeedRemoteDataSource(this._client);

  @override
  Future<List<NewsFeedModel>> getNewsFeed() async {
    try {
      final result = await _client.query(query: Gqlquery.newsFeedQuery);

      if (result.exception == null) {
        return json
            .decode(result.data["news"])
            .map<NewsFeedModel>((e) => NewsFeedModel.fromJson(e))
            .toList();
      }
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}
