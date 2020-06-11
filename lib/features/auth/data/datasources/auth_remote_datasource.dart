import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/util/gql_mutation.dart';
import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthRemoteDataSource {
  /// Calls the login mutation and get [UserTokensModel]
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if there is server error
  Future<UserTokensModel> trySignin(
      {String prefix, String userType, String username, String password});

  /// Calls the refresh mutation and get [UserTokensModel]
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if there is server error
  Future<UserTokensModel> tryRefresh(String refreshtoken);
}

@lazySingleton
@Injectable(as: IAuthRemoteDataSource)
class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final GraphQLClient _client;

  AuthRemoteDataSource(this._client);

  @override
  Future<UserTokensModel> trySignin(
      {String prefix,
      String userType,
      String username,
      String password}) async {
    try {
      final result = await _client.mutate(MutationOptions(
          documentNode: gql(Gqlmutation.loginMutation),
          variables: {
            prefix: prefix,
            userType: userType,
            username: username,
            password: password
          }));
      return result.data['login'];
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }

  @override
  Future<UserTokensModel> tryRefresh(String refreshtoken) async {
    try {
      final result = await _client.mutate(MutationOptions(
          documentNode: gql(Gqlmutation.loginMutation),
          variables: {refreshtoken: refreshtoken}));
      return result.data['refresh'];
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}
