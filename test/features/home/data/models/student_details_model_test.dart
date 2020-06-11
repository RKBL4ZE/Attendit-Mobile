import 'dart:convert';

import 'package:Attendit/features/home/data/models/student_details_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStudentDetailsModel = StudentDetailsModel(
      enrollment: "00414902019",
      name: "Raj Kishore",
      email: "rkzofficial@outlook.in",
      profilePicture: "http://localhost/raj.jpeg",
      mobile: "9999123658",
      gender: "Male",
      section: "B",
      session: "2019-2022",
      shift: "Morning",
      parentName: "Shiv Kumar",
      parentMobile: "9910221228",
      parentAltMobile: "9871589291",
      parentEmail: "kshiv0639@gmail.com",
      address: "L - Extn 9B, 110059",
      semesterId: 2,
      courseId: 1,
      semesterName: "BCA Sem2",
      courseName: "BCA",
      classroomId: "classroomId");

  test(
    'should be a subclass of StudentDetailsModel entity',
    () async {
      // assert
      expect(tStudentDetailsModel, isA<StudentDetailsModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON data is passed',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('student_details.json'));
        // act
        final result = StudentDetailsModel.fromJson(jsonMap);
        // assert
        expect(result, tStudentDetailsModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tStudentDetailsModel.toJson();
        // assert
        final expectedJsonMap = {
          "enrollment": "00414902019",
          "name": "Raj Kishore",
          "email": "rkzofficial@outlook.in",
          "profilePicture": "http://localhost/raj.jpeg",
          "mobile": "9999123658",
          "gender": "Male",
          "section": "B",
          "session": "2019-2022",
          "shift": "Morning",
          "parentName": "Shiv Kumar",
          "parentMobile": "9910221228",
          "parentAltMobile": "9871589291",
          "parentEmail": "kshiv0639@gmail.com",
          "address": "L - Extn 9B, 110059",
          "semesterId": 2,
          "courseId": 1,
          "semesterName": "BCA Sem2",
          "courseName": "BCA",
          "classroomId": "classroomId"
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
