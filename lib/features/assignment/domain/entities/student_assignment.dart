import 'package:equatable/equatable.dart';
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

class StudentAssignment extends Equatable {
  final String id;
  final String title;
  final Faculty faculty;

  final String file;
  final String submitFile;
  final Subject subject;
  final String status;
  final num marks;
  final num totalMarks;
  final String createdAt;
  final String dueDate;

  StudentAssignment({
    @required this.id,
    @required this.title,
    @required this.faculty,

    @required this.file,
    @required this.submitFile,
    @required this.subject,
    @required this.status,
    @required this.marks,
    @required this.totalMarks,
    @required this.createdAt,
    @required this.dueDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        faculty,

        file,
        submitFile,
        subject,
        status,
        marks,
        totalMarks,
        createdAt,
        dueDate,
      ];
}
