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

class AssignmentModel extends Assignment {
  AssignmentModel(
      {@required final String id,
      @required final String title,
      @required final String description,
      @required final FacultyModel faculty,
      @required final String file,
      @required final String fileName,
      @required final SubjectModel subject,
      @required final num totalMarks,
      @required final String createdAt,
      @required final String dueDate})
      : super(
            id: id,
            title: title,
            description: description,
            faculty: faculty,
            file: file,
            fileName: fileName,
            subject: subject,
            totalMarks: totalMarks,
            createdAt: createdAt,
            dueDate: dueDate);

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      faculty: FacultyModel.fromJson(json['faculty']),
      file: json['file'],
      fileName: json['fileName'],
      subject: SubjectModel.fromJson(json['subject']),
      totalMarks: json['totalMarks'],
      createdAt: json['createdAt'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'faculty': faculty,
      'file': file,
      'fileName': fileName,
      'subject': subject,
      'totalMarks': totalMarks,
      'createdAt': createdAt,
      'dueDate': dueDate,
    };
  }
}

class StudentAssignmentModel extends StudentAssignment {
  StudentAssignmentModel({
    final String id,
    final Assignment assignment,
    final num earnedMarks,
    final String remarks,
    final String status,
    final String submitFile,
    final String submitFileName,
    final String submittedDate,
  }) : super(
          id: id,
          assignment: assignment,
          earnedMarks: earnedMarks,
          remarks: remarks,
          status: status,
          submitFile: submitFile,
          submitFileName: submitFileName,
          submittedDate: submittedDate,
        );

  factory StudentAssignmentModel.fromJson(Map<String, dynamic> json) {
    return StudentAssignmentModel(
      id: json['id'],
      assignment: AssignmentModel.fromJson(json['assignment']),
      earnedMarks: json['earnedMarks'],
      remarks: json['remarks'],
      status: json['status'],
      submitFile: json['submitFile'],
      submitFileName: json['submitFileName'],
      submittedDate: json['submittedDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assignment': assignment,
      'earnedMarks': earnedMarks,
      'remarks': remarks,
      'status': status,
      'submitFile': submitFile,
      'submitFileName': submitFileName,
      'submittedDate': submittedDate,
    };
  }
}
