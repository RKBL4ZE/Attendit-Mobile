import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:meta/meta.dart';

class UserTokensModel extends UserTokens {
  UserTokensModel({@required String accesstoken, @required String refreshtoken})
      : super(accesstoken: accesstoken, refreshtoken: refreshtoken);

  factory UserTokensModel.fromJson(Map<String, dynamic> json) {
    return UserTokensModel(
        accesstoken: json['accesstoken'], refreshtoken: json['refreshtoken']);
  }

  Map<String, dynamic> toJson() {
    return {
      'accesstoken': accesstoken,
      'refreshtoken': refreshtoken,
    };
  }
}
