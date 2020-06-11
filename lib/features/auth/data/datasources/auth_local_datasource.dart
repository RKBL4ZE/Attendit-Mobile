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
    final userTokenString = _box.get(CACHED_USER_TOKENS);
    if (userTokenString == null) {
      throw CacheException();
    }
    return json.decode(userTokenString);
  }

  @override
  Future<void> setLocalTokens(UserTokensModel userTokensModel) {
    return _box.put(CACHED_USER_TOKENS, json.encode(userTokensModel.toJson()));
  }
}
