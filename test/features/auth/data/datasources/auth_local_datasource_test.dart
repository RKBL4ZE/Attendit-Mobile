import 'dart:convert';

import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockBox extends Mock implements Box {}

void main() {
  AuthLocalDataSource dataSource;
  MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = AuthLocalDataSource(mockBox);
  });

  group('UserLogin', () {
    final tUserTokensModel =
        UserTokensModel.fromJson(json.decode(fixture('user_tokens.json')));
    test(
      'should return UserTokens from Box[Hive] when there is one in the cache',
      () async {
        // arrange
        when(mockBox.get(any)).thenReturn(fixture('user_tokens.json'));
        // act
        final result = await dataSource.getLocalTokens();
        print(result);
        // assert
        verify(mockBox.get(any));
        expect(result, equals(tUserTokensModel));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockBox.get(any)).thenReturn(null);
        // act
        final call = dataSource.getLocalTokens;
        // assert
        expect(() => call(), throwsA(isInstanceOf<CacheException>()));
      },
    );
  });
}
