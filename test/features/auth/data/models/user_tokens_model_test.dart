import 'dart:convert';

import 'package:Attendit/features/auth/data/models/user_tokens_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserTokensModel = UserTokensModel(
      accesstoken: "ACCESS_TOKEN", refreshtoken: "REFRESH_TOKEN");

  test(
    'should be a subclass of UserTokensModel entity',
    () async {
      // assert
      expect(tUserTokensModel, isA<UserTokensModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON data is passed',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('user_tokens.json'));
        // act
        final result = UserTokensModel.fromJson(jsonMap);
        // assert
        expect(result, tUserTokensModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tUserTokensModel.toJson();
        // assert
        final expectedJsonMap = {
          "accesstoken": "ACCESS_TOKEN",
          "refreshtoken": "REFRESH_TOKEN"
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
