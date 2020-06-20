import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class UserLogin implements UseCase<bool, Params> {
  final IAuthRepository repository;

  UserLogin(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.signin(
        
        userType: params.userType,
        username: params.username,
        password: params.password);
  }
}

class Params extends Equatable {
  

  final String userType;

  final String username;

  final String password;

  Params(
      {
      @required this.userType,
      @required this.username,
      @required this.password});

  @override
  List<Object> get props => [ userType, username, password];
}
