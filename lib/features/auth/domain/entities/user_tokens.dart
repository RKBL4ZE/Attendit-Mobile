import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserTokens extends Equatable {
  final String accesstoken;

  final String refreshtoken;

  UserTokens({@required this.accesstoken,@required this.refreshtoken});

  @override
  List<Object> get props => [accesstoken, refreshtoken];
}
