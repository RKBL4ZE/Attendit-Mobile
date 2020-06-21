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
  final String session;
  final String status;

  Batch(this.classroom, this.session, this.status);
}

class StudentDetails extends Equatable {
  final String profilePicture;
  final String enrollment;
  final String name;
  final String email;
  final String address;
  final String gender;
  final String parentName;
  final String parentEmail;
  final String mobile;
  final String parentMobile;
  final String parentAltMobile;
  final Batch batch;

  StudentDetails({
    @required this.email,
    @required this.address,
    @required this.gender,
    @required this.parentName,
    @required this.parentEmail,
    @required this.mobile,
    @required this.parentMobile,
    this.parentAltMobile,
    @required this.profilePicture,
    @required this.enrollment,
    @required this.name,
    @required this.batch,
  });

  @override
  List<Object> get props => [enrollment, name, batch];
}
