import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:meta/meta.dart';

class UserTokensModel extends UserTokens {
  UserTokensModel(
      {@required num iat,
      @required num exp,
      @required String accesstoken,
      @required String refreshtoken})
      : super(
            iat: iat,
            exp: exp,
            accesstoken: accesstoken,
            refreshtoken: refreshtoken);

  factory UserTokensModel.fromJson(Map<String, dynamic> json) {
    return UserTokensModel(
        iat: json['iat'],
        exp: json['exp'],
        accesstoken: json['accesstoken'],
        refreshtoken: json['refreshtoken']);
  }

  Map<String, dynamic> toJson() {
    return {
      'iat': iat,
      'exp': exp,
      'accesstoken': accesstoken,
      'refreshtoken': refreshtoken,
    };
  }
}
