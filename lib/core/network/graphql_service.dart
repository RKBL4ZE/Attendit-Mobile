import 'dart:async';
import 'dart:convert';

import 'package:Attendit/core/environment/environment.dart';
import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/navigator/navigator.service.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/core/util/gql_mutation.dart';
import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IGraphQLService {
  Future<QueryResult> query(
      {String query,
      Map<String, dynamic> variables,
      FetchPolicy fetchPolicy = FetchPolicy.cacheFirst});
  Future<QueryResult> mutate({
    String mutation,
    Map<String, dynamic> variables,
  });
  Future<QueryResult> mutateNoAuth(
      {String mutation, Map<String, dynamic> variables});
}

const CACHED_USER_TOKENS = 'CACHED_USER_TOKENS';

@Injectable(as: IGraphQLService)
@singleton
class GraphQLService implements IGraphQLService {
  final Box _box;
  final INetworkInfo _networkInfo;
  final NavigationService navigationService;

  GraphQLClient _client;
  GraphQLClient _clientNoAuth;

  GraphQLService(this._box, this._networkInfo, this.navigationService) {
    print(EnvironmentConfig.API_URL);
    const String ENDPOINT = EnvironmentConfig.API_URL;
    final HttpLink httpLink = HttpLink(
      uri: ENDPOINT,
    );

    final AuthLink authLink = AuthLink(
      getToken: () async {
        String token = await getFreshToken();
        return "Bearer $token";
      },
    );

    final ErrorLink errorLink = ErrorLink(
      errorHandler: (error) {
        if (error.exception.graphqlErrors[0].message == "Unauthorized") {
          _box.delete(CACHED_USER_TOKENS);
          navigationService.navigateToReplace('/');
        }
      },
    );

    final Link link = errorLink.concat(authLink.concat(httpLink));

    _client = new GraphQLClient(link: link, cache: InMemoryCache());
    _clientNoAuth = new GraphQLClient(link: httpLink, cache: InMemoryCache());
  }

  @override
  Future<QueryResult> query(
      {String query,
      Map<String, dynamic> variables,
      FetchPolicy fetchPolicy = FetchPolicy.cacheFirst}) {
    return _client.query(QueryOptions(
        documentNode: gql(query),
        variables: variables,
        fetchPolicy: fetchPolicy));
  }

  @override
  Future<QueryResult> mutate(
      {String mutation, Map<String, dynamic> variables}) {
    return _client.mutate(
        MutationOptions(documentNode: gql(mutation), variables: variables));
  }

  @override
  Future<QueryResult> mutateNoAuth(
      {String mutation, Map<String, dynamic> variables}) {
    return _clientNoAuth.mutate(
        MutationOptions(documentNode: gql(mutation), variables: variables));
  }

  Future<String> getFreshToken() async {
    final userTokenString = _box.get(CACHED_USER_TOKENS);
    if (userTokenString != null) {
      final tUserTokensModel =
          UserTokensModel.fromJson(json.decode(userTokenString));

      final currenTime = DateTime.now().millisecondsSinceEpoch;
      final tokenExpiration = tUserTokensModel.exp;
      if ((currenTime / 1000) < (tokenExpiration - 600)) {
        return Future.value(tUserTokensModel.accesstoken);
      } else {
        if (await _networkInfo.isConnected) {
          try {
            final result = await _clientNoAuth.mutate(MutationOptions(
                documentNode: gql(Gqlmutation.refreshMutation),
                variables: {"refreshtoken": tUserTokensModel.refreshtoken}));
            if (result.exception == null) {
              _box.put(CACHED_USER_TOKENS, json.encode(result.data['refresh']));
              return Future.value(result.data['refresh']['accesstoken']);
            }
          } on ServerException {
            return "NO ACCESS TOKEN";
          }
        } else {
          return "NO ACCESS TOKEN";
        }
      }
    }
    return "NO ACCESS TOKEN";
  }
}
