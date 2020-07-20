
import 'package:meta/meta.dart';

import '../../domain/entities/student_assignment.dart';

class FacultyModel extends Faculty {
  FacultyModel({@required final String name}) : super(name);

  factory FacultyModel.fromJson(Map<String, dynamic> json) {
    return FacultyModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}

class SubjectModel extends Subject {
  SubjectModel(
      {@required final String subjectCode, @required final String subjectName})
      : super(subjectCode, subjectName);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectCode: json['subjectCode'],
      subjectName: json['subjectName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectCode": subjectCode,
      "subjectName": subjectName,
    };
  }
}

class StudentAssignmentModel extends StudentAssignment {
  StudentAssignmentModel(
      {@required final String id,
      @required final String title,
      @required final FacultyModel faculty,
      @required final String file,
      @required final String submitFile,
      @required final SubjectModel subject,
      @required final String status,
      @required final num marks,
      @required final num totalMarks,
      @required final String createdAt,
      @required final String dueDate})
      : super(
            id: id,
            title: title,
            faculty: faculty,
            file: file,
            submitFile: submitFile,
            subject: subject,
            status: status,
            marks: marks,
            totalMarks: totalMarks,
            createdAt: createdAt,
            dueDate: dueDate);

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) {
    return StudentAssignmentModel(
      id: json['_id'],
      title: json['title'],
      faculty: FacultyModel.fromJson(json['faculty']),
      file: json['file'],
      submitFile: json['submitFile'],
      subject: SubjectModel.fromJson(json['subject']),
      status: json['status'],
      marks: json['marks'],
      totalMarks: json['totalMarks'],
      createdAt: json['createdAt'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'faculty': faculty,
      'file': file,
      'submitFile': submitFile,
      'subject': subject,
      'status': status,
      'marks': marks,
      'totalMarks': totalMarks,
      'createdAt': createdAt,
      'dueDate': dueDate,
    };
  }
}
