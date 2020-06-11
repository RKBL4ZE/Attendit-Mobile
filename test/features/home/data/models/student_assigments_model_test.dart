import 'dart:convert';

import 'package:Attendit/features/home/data/models/student_assigments_model.dart';
//import 'package:Attendit/features/home/data/models/student_attendence_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tStudentAssignmentModel = StudentAssignmentModel(
      id: "11591088112085",
      facultyId: "1",
      classroomId: "5edf9cd0fc13ae21cb000001",
      subjectCode: "BCA 202",
      subjectName: "Maths II",
      title: "Test Assignment",
      file:
          "https://msidata.s3.amazonaws.com/assignment/student/11591088108235.pdf",
      submitFile: "https://msidata.s3.amazonaws.com/assignment/student/11591088108235.pdf",
      marks: 0,
      totalMarks: 10,
      status: "PENDING", facultyName: "null");

  test(
    'should be a subclass of StudentAttendanceModel entity',
    () async {
      // assert
      expect(tStudentAssignmentModel, isA<StudentAssignmentModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON data is passed',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('student_assigments.json'));
        // act
        final result = StudentAssignmentModel.fromJson(jsonMap);
        // assert
        expect(result, tStudentAssignmentModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tStudentAssignmentModel.toJson();
        // assert
        final expectedJsonMap = {
          "id": "11591088112085",
          "facultyId": "1",
          "classroomId": "5edf9cd0fc13ae21cb000001",
          "subjectCode": "BCA 202",
          "subjectName": "Maths II",
          "title": "Test Assignment",
          "file":
              "https://msidata.s3.amazonaws.com/assignment/student/11591088108235.pdf",
          "submitFile": "https://msidata.s3.amazonaws.com/assignment/student/11591088108235.pdf",
          "marks": 0,
          "totalMarks": 10,
          "status": "PENDING",
           "facultyName": "null"
                  };
        expect(result, expectedJsonMap);
      },
    );
  });
}
