import 'dart:convert';

import 'package:Attendit/features/home/data/models/student_attendence_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStudentAttendanceModel = StudentAttendanceModel(
    subjectName: "subname",
    subjectCode: "123",
    lecturesAttended: 45,
    totalLectures: 50,
  );

  test(
    'should be a subclass of StudentAttendanceModel entity',
    () async {
      // assert
      expect(tStudentAttendanceModel, isA<StudentAttendanceModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON data is passed',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('student_attendence.json'));
        // act
        final result = StudentAttendanceModel.fromJson(jsonMap);
        // assert
        expect(result, tStudentAttendanceModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tStudentAttendanceModel.toJson();
        // assert
        final expectedJsonMap = {
          "subjectName": "subname",
          "subjectCode": "123",
          "lecturesAttended": 45,
          "totalLectures": 50,
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
