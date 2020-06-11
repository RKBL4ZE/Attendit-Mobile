import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:Attendit/features/auth/domain/usecases/user_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  UserLogin usecase;
  MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserLogin(mockAuthRepository);
  });

  final prefix = 'msi';
  final userType = 'student';
  final username = 'student';
  final password = 'student';

  final success = true;
  final failed = false;

  group('user login', () {
    test('should received success from the repo', () async {
      // arrange
      when(mockAuthRepository.signin(
              prefix: prefix,
              userType: userType,
              username: username,
              password: password))
          .thenAnswer((_) async => Right(success));

      // act
      final result = await usecase(Params(
          prefix: prefix,
          userType: userType,
          username: username,
          password: password));

      // asert
      expect(result, Right(success));
      verify(mockAuthRepository.signin(
          prefix: prefix,
          userType: userType,
          username: username,
          password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should received failed from the repo', () async {
      // arrange
      when(mockAuthRepository.signin(
              prefix: prefix,
              userType: userType,
              username: username,
              password: password))
          .thenAnswer((_) async => Right(failed));

      // act
      final result = await usecase(Params(
          prefix: prefix,
          userType: userType,
          username: username,
          password: password));

      // asert
      expect(result, Right(failed));
      verify(mockAuthRepository.signin(
          prefix: prefix,
          userType: userType,
          username: username,
          password: password));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
