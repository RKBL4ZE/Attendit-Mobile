import 'package:meta/meta.dart';

import '../../domain/entities/student_details.dart';

class CourseModel extends Course {
  CourseModel({
    @required final String name,
  }) : super(name);

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}

class ClassroomModel extends Classroom {
  ClassroomModel(
      {@required final num semester,
      @required final String section,
      @required final CourseModel course})
      : super(semester, section, course);

  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return ClassroomModel(
      semester: json['semester'],
      section: json['section'],
      course: CourseModel.fromJson(json['course']),
    );
  }

  Map<String, dynamic> toJson() {
    return {"semester": semester, "section": section, "course": course};
  }
}

class BatchModel extends Batch {
  BatchModel({
    @required final ClassroomModel classroom,
    @required final String session,
    @required final String status,
  }) : super(classroom, session, status);

  factory BatchModel.fromJson(Map<String, dynamic> json) {
    return BatchModel(
      classroom: ClassroomModel.fromJson(json['classroom']),
      session: json['session'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "classroom": classroom,
      "session": session,
      "status": status,

    };
  }
}

class StudentDetailsModel extends StudentDetails {
  StudentDetailsModel({
    @required final String profilePicture,
    @required final String enrollment,
    @required final String name,
    @required final String email,
    @required final String address,
    @required final String gender,
    @required final String parentName,
    @required final String parentEmail,
    @required final String mobile,
    @required final String parentMobile,
    final String parentAltMobile,
    @required final BatchModel batch,
  }) : super(
            profilePicture: profilePicture,
            enrollment: enrollment,
            name: name,
            email: email,
            address: address,
            gender: gender,
            parentName: parentName,
            parentEmail: parentEmail,
            mobile: mobile,
            parentMobile: parentMobile,
            parentAltMobile: parentAltMobile,
            batch: batch
            );

  factory StudentDetailsModel.fromJson(Map<String, dynamic> json) {
    return StudentDetailsModel(
      profilePicture: json['profilePicture'],
      enrollment: json['enrollment'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
      parentName: json['parentName'],
      parentEmail: json['parentEmail'],
      mobile: json['mobile'],
      parentMobile: json['parentMobile'],
      parentAltMobile: json['parentAltMobile'],
      batch: BatchModel.fromJson(json['batch']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profilePicture': profilePicture,
      'enrollment': enrollment,
      'name': name,
      'email': email,
      'address': address,
      'gender': gender,
      'parentName': parentName,
      'parentEmail': parentEmail,
      'mobile': mobile,
      'parentMobile': parentMobile,
      'parentAltMobile': parentAltMobile,
      'batch': batch,
    };
  }
}
