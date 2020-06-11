import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StudentAssignment extends Equatable {
  final String id;
  final String facultyId;
  final String facultyName;
  final String subjectCode;
  final String subjectName;
  final String title;
  final String file;
  final String submitFile;
  final num marks;
  final num totalMarks;
  final String status;
  final String classroomId;

  StudentAssignment(
      {@required this.id,
      @required this.facultyId,
      @required this.facultyName,
      @required this.marks,
      @required this.totalMarks,
      @required this.subjectCode,
      @required this.subjectName,
      @required this.title,
      @required this.file,
      @required this.submitFile,
      @required this.status,
      @required this.classroomId});

  @override
  List<Object> get props => [
        id,
        facultyId,
        facultyName,
        subjectCode,
        subjectName,
        title,
        file,
        submitFile,
        status,
        marks,
        totalMarks,
        classroomId
      ];
}
