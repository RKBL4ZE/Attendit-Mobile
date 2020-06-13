import 'package:meta/meta.dart';

import '../../domain/entities/student_assignment.dart';

class StudentAssignmentModel extends StudentAssignment {
  StudentAssignmentModel({
    @required final String id,
    @required final String facultyId,
    @required final String facultyName,
    @required final String subjectCode,
    @required final String subjectName,
    @required final String title,
    @required final String file,
    @required final String submitFile,
    @required final num marks,
    @required final num totalMarks,
    @required final String status,
    @required final String classroomId,
    @required final String dueDate
  }) : super(
            id: id,
            facultyId: facultyId,
            facultyName: facultyName,
            subjectCode: subjectCode,
            subjectName: subjectName,
            title: title,
            file: file,
            submitFile: submitFile,
            status: status,
            marks: marks,
            totalMarks: totalMarks,
            classroomId: classroomId,
            dueDate: dueDate);

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) {
    return StudentAssignmentModel(
      subjectCode: json['subjectCode'],
      subjectName: json['subjectName'],
      classroomId: json['classroomId'],
      facultyId: json['facultyId'],
      facultyName: json['facultyName'],
      file: json['file'],
      id: json['id'],
      marks: json['marks'],
      status: json['status'],
      submitFile: json['submitFile'],
      title: json['title'],
      totalMarks: json['totalMarks'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectCode': subjectCode,
      'subjectName': subjectName,
      'classroomId': classroomId,
      'facultyId': facultyId,
      'facultyName': facultyName,
      'file': file,
      'id': id,
      'marks': marks,
      'status': status,
      'submitFile': submitFile,
      'title': title,
      'totalMarks': totalMarks,
      'dueDate': dueDate,
    };
  }
}
