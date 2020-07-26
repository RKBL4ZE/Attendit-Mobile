// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:Attendit/features/navbar/presentation/bloc/bloc/bottom_navigation_bloc.dart';
import 'package:hive/hive.dart';
import 'package:Attendit/core/injection/register_module.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:Attendit/features/assignment/data/datasources/assignment_local_datasource.dart';
import 'package:Attendit/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:Attendit/features/home/data/datasources/home_local_datasource.dart';
import 'package:Attendit/core/network/network_info.dart';
import 'package:Attendit/features/newsfeed/data/datasources/news_feed_local_datasource.dart';
import 'package:Attendit/features/result/data/datasources/result_remote_datasource.dart';
import 'package:Attendit/features/result/data/repositories/result_repository.dart';
import 'package:Attendit/features/result/domain/repositories/i_result_repository.dart';
import 'package:Attendit/features/timetable/data/datasources/timetable_local_datasource.dart';
import 'package:Attendit/core/navigator/navigator.service.dart';
import 'package:Attendit/features/result/presentation/bloc/sem_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/switch_bloc.dart';
import 'package:Attendit/features/result/domain/usecases/get_rank_list.dart';
import 'package:Attendit/features/result/domain/usecases/get_result.dart';
import 'package:Attendit/core/network/graphql_service.dart';
import 'package:Attendit/features/home/data/datasources/home_remote_datasource.dart';
import 'package:Attendit/features/home/data/repositories/home_repository.dart';
import 'package:Attendit/features/home/domain/repositories/i_home_repository.dart';
import 'package:Attendit/features/newsfeed/data/datasources/news_feed_remote_datasource.dart';
import 'package:Attendit/features/newsfeed/data/repositories/news_feed_repository.dart';
import 'package:Attendit/features/newsfeed/domain/repositories/i_news_feed_repository.dart';
import 'package:Attendit/features/timetable/data/datasources/timetable_remote_datasource.dart';
import 'package:Attendit/features/timetable/data/repositories/timetable_repository.dart';
import 'package:Attendit/features/timetable/domain/repositories/i_timetable_repository.dart';
import 'package:Attendit/features/result/presentation/bloc/rank_bloc.dart';
import 'package:Attendit/features/home/domain/usecases/get_all_details.dart';
import 'package:Attendit/features/home/domain/usecases/get_enrollment.dart';
import 'package:Attendit/features/newsfeed/domain/usecases/get_news_feed.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_details.dart';
import 'package:Attendit/features/timetable/domain/usecases/get_timetable.dart';
import 'package:Attendit/features/home/presentation/bloc/home_bloc.dart';
import 'package:Attendit/features/assignment/data/datasources/assignment_remote_datasource.dart';
import 'package:Attendit/features/assignment/data/repositories/assignment_repository.dart';
import 'package:Attendit/features/assignment/domain/repositories/i_assignment_repository.dart';
import 'package:Attendit/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:Attendit/features/auth/data/repositories/auth_repository.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:Attendit/features/newsfeed/presentation/bloc/newsfeed_bloc.dart';
import 'package:Attendit/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/result_bloc.dart';
import 'package:Attendit/features/assignment/domain/usecases/submit_assignment.dart';
import 'package:Attendit/features/assignment/presentation/bloc/assignment_bloc.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:Attendit/features/auth/domain/usecases/user_login.dart';
import 'package:Attendit/features/auth/domain/usecases/user_logout.dart';
import 'package:Attendit/features/virtual_id_card/presentation/bloc/virtualidcard_bloc.dart';
import 'package:Attendit/features/auth/domain/usecases/check_first_time.dart';
import 'package:Attendit/features/auth/domain/usecases/check_session.dart';
import 'package:Attendit/features/assignment/domain/usecases/get_student_assignment.dart';
import 'package:Attendit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final registerModule = _$RegisterModule();
  g.registerFactory<BottomNavigationBloc>(() => BottomNavigationBloc());
  final box = await registerModule.openBox;
  g.registerLazySingleton<Box<dynamic>>(() => box);
  g.registerLazySingleton<DataConnectionChecker>(
      () => registerModule.connectionChecker);
  g.registerFactory<IAssignmentLocalDataSource>(
      () => AssignmentLocalDataSource(g<Box<dynamic>>()));
  g.registerFactory<IAuthLocalDataSource>(
      () => AuthLocalDataSource(g<Box<dynamic>>()));
  g.registerFactory<IHomeLocalDataSource>(
      () => HomeLocalDataSource(g<Box<dynamic>>()));
  g.registerFactory<INetworkInfo>(
      () => NetworkInfo(g<DataConnectionChecker>()));
  g.registerFactory<INewsFeedLocalDataSource>(
      () => NewsFeedLocalDataSource(g<Box<dynamic>>()));
  g.registerFactory<IResultRemoteDataSource>(() => ResultRemoteDataSource());
  g.registerFactory<IResultRepository>(
      () => ResultRepository(g<INetworkInfo>(), g<IResultRemoteDataSource>()));
  g.registerFactory<ITimeTableLocalDataSource>(
      () => TimeTableLocalDataSource(g<Box<dynamic>>()));
  g.registerLazySingleton<NavigationService>(() => NavigationService());
  g.registerFactory<SemBloc>(() => SemBloc());
  g.registerFactory<SwitchBloc>(() => SwitchBloc());
  g.registerLazySingleton<GetRankList>(
      () => GetRankList(g<IResultRepository>()));
  g.registerLazySingleton<GetResult>(() => GetResult(g<IResultRepository>()));
  g.registerFactory<IGraphQLService>(() => GraphQLService(
        g<Box<dynamic>>(),
        g<INetworkInfo>(),
        g<NavigationService>(),
      ));
  g.registerFactory<IHomeRemoteDataSource>(
      () => HomeRemoteDataSource(g<IGraphQLService>()));
  g.registerFactory<IHomeRepository>(() => HomeRepository(
        g<IHomeLocalDataSource>(),
        g<INetworkInfo>(),
        g<IHomeRemoteDataSource>(),
      ));
  g.registerFactory<INewsFeedRemoteDataSource>(
      () => NewsFeedRemoteDataSource(g<IGraphQLService>()));
  g.registerFactory<INewsFeedRepository>(() => NewsFeedRepository(
        g<INewsFeedLocalDataSource>(),
        g<INetworkInfo>(),
        g<INewsFeedRemoteDataSource>(),
      ));
  g.registerFactory<ITimeTableRemoteDatasource>(
      () => TimeTableRemoteDatasource(g<IGraphQLService>()));
  g.registerFactory<ITimeTableRepository>(() => TimeTableRepository(
        g<ITimeTableRemoteDatasource>(),
        g<ITimeTableLocalDataSource>(),
        g<INetworkInfo>(),
      ));
  g.registerFactory<RankBloc>(() => RankBloc(g<GetRankList>()));
  g.registerLazySingleton<GetAllDetails>(
      () => GetAllDetails(g<IHomeRepository>()));
  g.registerLazySingleton<GetEnrollment>(
      () => GetEnrollment(g<IHomeRepository>()));
  g.registerLazySingleton<GetNewsFeed>(
      () => GetNewsFeed(g<INewsFeedRepository>()));
  g.registerLazySingleton<GetStudentDetails>(
      () => GetStudentDetails(g<IHomeRepository>()));
  g.registerLazySingleton<GetTimeTable>(
      () => GetTimeTable(g<ITimeTableRepository>()));
  g.registerFactory<HomeBloc>(
      () => HomeBloc(g<GetStudentDetails>(), g<GetAllDetails>()));
  g.registerFactory<IAssignmentRemoteDataSource>(
      () => AssignmentRemoteDataSource(g<IGraphQLService>()));
  g.registerFactory<IAssignmentRepository>(() => AssignmentRepository(
      g<INetworkInfo>(), g<IAssignmentRemoteDataSource>()));
  g.registerFactory<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(g<IGraphQLService>()));
  g.registerFactory<IAuthRepository>(() => AuthRepository(
        g<INetworkInfo>(),
        g<IAuthLocalDataSource>(),
        g<IAuthRemoteDataSource>(),
      ));
  g.registerFactory<NewsfeedBloc>(() => NewsfeedBloc(g<GetNewsFeed>()));
  g.registerFactory<ProfileBloc>(() => ProfileBloc(g<GetAllDetails>()));
  g.registerFactory<ResultBloc>(
      () => ResultBloc(g<GetResult>(), g<GetEnrollment>()));
  g.registerLazySingleton<SubmitAssignment>(
      () => SubmitAssignment(g<IAssignmentRepository>()));
  g.registerFactory<SubmitAssignmentBloc>(
      () => SubmitAssignmentBloc(g<SubmitAssignment>()));
  g.registerFactory<TimetableBloc>(() => TimetableBloc(g<GetTimeTable>()));
  g.registerLazySingleton<UserLogin>(() => UserLogin(g<IAuthRepository>()));
  g.registerLazySingleton<UserLogout>(() => UserLogout(g<IAuthRepository>()));
  g.registerFactory<VirtualidcardBloc>(
      () => VirtualidcardBloc(g<GetAllDetails>()));
  g.registerLazySingleton<CheckFirstTime>(
      () => CheckFirstTime(g<IAuthRepository>()));
  g.registerLazySingleton<CheckSession>(
      () => CheckSession(g<IAuthRepository>()));
  g.registerLazySingleton<GetAssignmentDetails>(
      () => GetAssignmentDetails(g<IAssignmentRepository>()));
  g.registerFactory<AssignmentBloc>(
      () => AssignmentBloc(g<GetAssignmentDetails>(), g<SubmitAssignment>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(
        g<UserLogin>(),
        g<CheckSession>(),
        g<CheckFirstTime>(),
        g<UserLogout>(),
      ));
}

class _$RegisterModule extends RegisterModule {}
