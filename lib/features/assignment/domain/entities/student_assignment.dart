import 'package:meta/meta.dart';

abstract class Faculty {
  final String name;

  Faculty(this.name);
}

abstract class Subject {
  final String subjectCode;
  final String subjectName;

  Subject(this.subjectCode, this.subjectName);
}

abstract class Assignment {
  final String id;
  final String title;
  final String description;
  final Faculty faculty;
  final String file;
  final String fileName;
  final Subject subject;
  final num totalMarks;
  final String createdAt;
  final String dueDate;

  Assignment({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.faculty,
    @required this.file,
    @required this.fileName,
    @required this.subject,
    @required this.totalMarks,
    @required this.createdAt,
    @required this.dueDate,
  });
}

abstract class StudentAssignment {
  final String id;
  final Assignment assignment;
  final num earnedMarks;
  final String remarks;
  final String status;
  final String submitFile;
  final String submitFileName;
  final String submittedDate;

  StudentAssignment(
      {this.id,
      this.assignment,
      this.earnedMarks,
      this.remarks,
      this.status,
      this.submitFile,
      this.submitFileName,
      this.submittedDate});
}
