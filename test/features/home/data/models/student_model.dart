import 'dart:convert';

import 'package:Attendit/features/home/data/models/student_details_model.dart';
import 'package:Attendit/features/home/domain/usecases/get_student_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStudentDetails = StudentDetailsModel(
    address: "L - Extn 9B, 110059",
    courseName: "BCA",
    courseId: 1,
    email: "rkzofficial@outlook.in",
    enrollment: "00414902019",
    gender: "Male",
    mobile: "9999123658",
    name: "Raj Kishore",
    parentAltMobile: "9871589291",
    parentEmail: "kshiv0639@gmail.com",
    parentName: "Shiv Kumar",
    profilePicture: "http://localhost/raj.jpeg",
    parentMobile: "9910221228",
    section: "B",
    semesterName: "BCA Sem2",
    semesterId: 2,
    session: "2019-2022",
    shift: "Morning",
  );

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tStudentDetails, isA<GetStudentDetails>());
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
        expect(result, tStudentDetails);
      },
    );
  });

group('toJson', () {
  test(
    'should return a JSON map containing the proper data',
    () async {
      // act
      final result = tStudentDetails.toJson();
      // assert
      final expectedJsonMap = {
        "Enrollment": "00414902019",
      "Name": "Raj Kishore",
      "Email": "rkzofficial@outlook.in",
      "ProfilePicture": "http://localhost/raj.jpeg",
      "Mobile": "9999123658",
      "Gender": "Male",
      "Section": "B",
      "Session": "2019-2022",
      "Shift": "Morning",
      "ParentName": "Shiv Kumar",
      "ParentMobile": "9910221228",
      "ParentAltMobile": "9871589291",
      "ParentEmail": "kshiv0639@gmail.com",
      "Address": "L - Extn 9B, 110059",
      "SemesterId": 2,
      "CourseId": 1,
      "SemesterName": "BCA Sem2",
      "CourseName": "BCA"
      };
      expect(result, expectedJsonMap);
    },
  );
});


}

