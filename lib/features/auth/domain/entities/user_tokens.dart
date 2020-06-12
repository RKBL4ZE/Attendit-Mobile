import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserTokens extends Equatable {
  final num iat;

  final num exp;

  final String accesstoken;

  final String refreshtoken;

  UserTokens(
      {@required this.iat,
      @required this.exp,
      @required this.accesstoken,
      @required this.refreshtoken});

  @override
  List<Object> get props => [iat, exp, accesstoken, refreshtoken];
}
