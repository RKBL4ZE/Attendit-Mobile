import 'package:meta/meta.dart';

import '../../domain/entities/student_attendance.dart';

class StudentAttendanceModel extends StudentAttendance {
  StudentAttendanceModel({
    @required final String subjectCode,
    @required final String subjectName,
    @required final num lecturesAttended,
    @required final num totalLectures,
  }) : super(
          subjectCode: subjectCode,
          subjectName: subjectName,
          lecturesAttended: lecturesAttended,
          totalLectures: totalLectures,
        );

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceModel(
      subjectCode: json['subjectCode'],
      subjectName: json['subjectName'],
      lecturesAttended: json['lecturesAttended'],
      totalLectures: json['totalLectures'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectCode': subjectCode,
      'subjectName': subjectName,
      'lecturesAttended': lecturesAttended,
      'totalLectures': totalLectures,
    };
  }
}
