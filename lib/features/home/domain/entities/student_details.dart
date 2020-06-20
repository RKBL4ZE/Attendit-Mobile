import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Course {
  final String name;
  Course(this.name);
}

abstract class Classroom {
  final num semester;
  final String section;
  final Course course;

  Classroom(this.semester, this.section, this.course);
}

abstract class Batch {
  final Classroom classroom;

  Batch(this.classroom);
}

class StudentDetails extends Equatable {
  final String profilePicture;
  final String enrollment;
  final String name;
  final Batch batch;

  StudentDetails({
    @required this.profilePicture,
    @required this.enrollment,
    @required this.name,
    @required this.batch,
  });

  @override
  List<Object> get props => [
        enrollment,
        name,
        batch
      ];
}
