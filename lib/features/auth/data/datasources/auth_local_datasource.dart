import 'dart:convert';

import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthLocalDataSource {
  Future<void> setLocalTokens(UserTokensModel userTokensModel);
}

const CACHED_USER_TOKENS = 'CACHED_USER_TOKENS';

@Injectable(as: IAuthLocalDataSource)
@lazySingleton
class AuthLocalDataSource implements IAuthLocalDataSource {
  final Box _box;

  AuthLocalDataSource(this._box);

  @override
  Future<void> setLocalTokens(UserTokensModel userTokensModel) {
    return _box.put(CACHED_USER_TOKENS, json.encode(userTokensModel.toJson()));
  }
}
