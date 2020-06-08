import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StudentDetails extends Equatable {
  final String enrollment;
  final String name;
  final String email;
  final String profilePicture;
  final String mobile;
  final String gender;
  final String section;
  final String session;
  final String shift;
  final String parentName;
  final String parentMobile;
  final String parentAltMobile;
  final String parentEmail;
  final String address;
  final num semesterId;
  final String semesterName;
  final num courseId;
  final String courseName;

  StudentDetails(
      {@required this.enrollment,
      @required this.name,
      @required this.email,
      @required this.profilePicture,
      @required this.mobile,
      @required this.gender,
      @required this.section,
      @required this.session,
      @required this.shift,
      @required this.parentName,
      @required this.parentMobile,
      @required this.parentAltMobile,
      @required this.parentEmail,
      @required this.address,
      @required this.semesterId,
      @required this.semesterName,
      @required this.courseId,
      @required this.courseName});

  @override
  List<Object> get props => [
        enrollment,
        name,
        email,
        profilePicture,
        mobile,
        gender,
        section,
        session,
        shift,
        parentName,
        parentMobile,
        parentAltMobile,
        parentEmail,
        address,
        semesterId,
        semesterName,
        courseId,
        courseName
      ];



  
}
