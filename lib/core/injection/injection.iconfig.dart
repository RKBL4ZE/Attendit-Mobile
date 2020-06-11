// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:Attendit/features/auth/data/repositories/auth_repository.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:Attendit/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:hive/hive.dart';
import 'package:Attendit/core/injection/register_module.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:Attendit/features/auth/domain/usecases/get_user_tokens.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:graphql/client.dart';
import 'package:Attendit/features/auth/domain/usecases/user_login.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<AuthRepository>(() => AuthRepository(
        g<INetworkInfo>(),
        g<IAuthLocalDataSource>(),
        g<IAuthRemoteDataSource>(),
      ));
  final box = await registerModule.openBox;
  g.registerLazySingleton<Box<dynamic>>(() => box);
  g.registerLazySingleton<DataConnectionChecker>(
      () => registerModule.connectionChecker);
  g.registerLazySingleton<GetUserTokens>(
      () => GetUserTokens(g<IAuthRepository>()));
  g.registerLazySingleton<GraphQLClient>(() => registerModule.gqlClient);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(g<DataConnectionChecker>()));
  g.registerLazySingleton<UserLogin>(() => UserLogin(g<IAuthRepository>()));
  g.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(g<Box<dynamic>>()));
  g.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(g<GraphQLClient>()));
}

class _$RegisterModule extends RegisterModule {}
