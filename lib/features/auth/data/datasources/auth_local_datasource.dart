import 'dart:convert';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthLocalDataSource {
  /// Gets the cached [UserTokensModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserTokensModel> getLocalTokens();

  Future<void> setLocalTokens(UserTokensModel userTokensModel);
}

const CACHED_USER_TOKENS = 'CACHED_USER_TOKENS';

@lazySingleton
@Injectable(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  final Box _box;

  AuthLocalDataSource(this._box);

  @override
  Future<UserTokensModel> getLocalTokens() {
    final accesstoken = _box.get('accesstoken');
    final refreshtoken = _box.get('refreshtoken');
    if (accesstoken != null && refreshtoken != null) {
      final tUserTokensModel =
          UserTokensModel(accesstoken: accesstoken, refreshtoken: refreshtoken);

      return Future.value(tUserTokensModel);
    }
    throw CacheException();
  }

  @override
  Future<void> setLocalTokens(UserTokensModel userTokensModel) {
    return _box.putAll(userTokensModel.toJson());
  }
}
