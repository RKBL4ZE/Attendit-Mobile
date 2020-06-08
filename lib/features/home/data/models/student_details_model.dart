import 'package:meta/meta.dart';

import '../../domain/entities/student_details.dart';

class StudentDetailsModel extends StudentDetails {
  StudentDetailsModel({
    @required final String enrollment,
    @required final String name,
    @required final String email,
    @required final String profilePicture,
    @required final String mobile,
    @required final String gender,
    @required final String section,
    @required final String session,
    @required final String shift,
    @required final String parentName,
    @required final String parentMobile,
    @required final String parentAltMobile,
    @required final String parentEmail,
    @required final String address,
    @required final num semesterId,
    @required final String semesterName,
    @required final num courseId,
    @required final String courseName,
  }) : super(
          enrollment: enrollment,
          name: name,
          email: email,
          profilePicture: profilePicture,
          mobile: mobile,
          gender: gender,
          section: section,
          session: session,
          shift: shift,
          parentName: parentName,
          parentMobile: parentMobile,
          parentAltMobile: parentAltMobile,
          parentEmail: parentEmail,
          address: address,
          semesterId: semesterId,
          semesterName: semesterName,
          courseId: courseId,
          courseName: courseName,
        );

  factory StudentDetailsModel.fromJson(Map<String, dynamic> json) {
    return StudentDetailsModel(
      enrollment: json['enrollment'],
      name: json['name'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      mobile: json['mobile'],
      gender: json['gender'],
      section: json['section'],
      session: json['session'],
      shift: json['shift'],
      parentName: json['parentName'],
      parentMobile: json['parentMobile'],
      parentAltMobile: json['parentAltMobile'],
      parentEmail: json['parentEmail'],
      address: json['address'],
      semesterId: json['semesterId'],
      semesterName: json['semesterName'],
      courseId: json['courseId'],
      courseName: json['courseName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enrollment': enrollment,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'mobile': mobile,
      'gender': gender,
      'section': section,
      'session': session,
      'shift': shift,
      'parentName': parentName,
      'parentMobile': parentMobile,
      'parentAltMobile': parentAltMobile,
      'parentEmail': parentEmail,
      'address': address,
      'semesterId': semesterId,
      'semesterName': semesterName,
      'courseId': courseId,
      'courseName': courseName,
    };
  }
}
