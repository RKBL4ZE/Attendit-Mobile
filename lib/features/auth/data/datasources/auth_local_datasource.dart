import 'dart:convert';

import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthLocalDataSource {
  Future<void> setLocalTokens(UserTokensModel userTokensModel);

  Future<bool> getLocalTokens();

  Future<void> removeLocalTokens();

  Future<bool> getFirstTime();

  Future<void> setFirstTime();

  

}

const CACHED_USER_TOKENS = 'CACHED_USER_TOKENS';
const FIRST_TIME_STRING = 'FIRST_TIME_STRING';

@Injectable(as: IAuthLocalDataSource)
@lazySingleton
class AuthLocalDataSource implements IAuthLocalDataSource {
  final Box _box;

  AuthLocalDataSource(this._box);

  @override
  Future<void> setLocalTokens(UserTokensModel userTokensModel) {
    return _box.put(CACHED_USER_TOKENS, json.encode(userTokensModel.toJson()));
  }

  @override
  Future<bool> getLocalTokens() {
    final result = _box.get(CACHED_USER_TOKENS);

    if (result == null) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Future<bool> getFirstTime() {
    final result = _box.get(FIRST_TIME_STRING);

    if (result == null) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Future<void> setFirstTime() {
    _box.put(FIRST_TIME_STRING, FIRST_TIME_STRING);
    return Future.value();
  }

  @override
  Future<void> removeLocalTokens() {
    _box.delete(CACHED_USER_TOKENS);
	return Future.value();
  }
}
