import 'dart:convert';

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

@Injectable(as: IAuthRemoteDataSource)
@lazySingleton
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
            "prefix": prefix,
            "userType": userType,
            "username": username,
            "password": password
          }));
      if (result.exception == null) {
        return UserTokensModel.fromJson(result.data['login']);
      }
      print(result.exception);
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<UserTokensModel> tryRefresh(String refreshtoken) async {
    try {
      final result = await _client.mutate(MutationOptions(
          documentNode: gql(Gqlmutation.loginMutation),
          variables: {"refreshtoken": refreshtoken}));
      if (result.exception == null) {
        return Future.value(UserTokensModel.fromJson(result.data['refresh']));
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
