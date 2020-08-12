import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:Attendit/features/shared/domain/entities/subject.dart';

class StudentAttendance extends Equatable {
  final Subject subject;
  final num lecturesAttended;
  final num totalLectures;

  StudentAttendance(
      {@required this.subject,
      @required this.lecturesAttended,
      @required this.totalLectures});

  @override
  List<Object> get props => [subject, lecturesAttended, totalLectures];
}
