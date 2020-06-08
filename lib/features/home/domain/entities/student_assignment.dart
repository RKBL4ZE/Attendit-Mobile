import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StudentAssignment extends Equatable {
  final String id;
  final String facultyId;
  final String facultyName;
  final num semesterId;
  final String semesterName;
  final String subjectCode;
  final String subjectName;
  final String title;
  final String file;
  final String submitFile;
  final String status;

  StudentAssignment(
      {@required this.id,
      @required this.facultyId,
      @required this.facultyName,
      @required this.semesterId,
      @required this.semesterName,
      @required this.subjectCode,
      @required this.subjectName,
      @required this.title,
      @required this.file,
      @required this.submitFile,
      @required this.status});

  @override
  List<Object> get props => [
        id,
        facultyId,
        facultyName,
        semesterId,
        semesterName,
        subjectCode,
        subjectName,
        title,
        file,
        submitFile,
        status
      ];
}
