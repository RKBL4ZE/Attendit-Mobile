import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/auth/domain/entities/user_tokens.dart';
import 'package:Attendit/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:Attendit/features/auth/domain/usecases/get_user_tokens.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  GetUserTokens usecase;
  MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetUserTokens(mockAuthRepository);
  });

  final tUserTokens =
      UserTokens(accesstoken: "ACCESS_TOKEN", refreshtoken: "REFRESH_TOKEN");

  test('shoudl received user tokens from repository ', () async {
    // arrange
    when(mockAuthRepository.getTokens())
        .thenAnswer((_) async => Right(tUserTokens));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tUserTokens));
    verify(mockAuthRepository.getTokens());
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
