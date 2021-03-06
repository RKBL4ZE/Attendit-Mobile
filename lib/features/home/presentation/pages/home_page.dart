import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/home/presentation/bloc/home_bloc.dart';
import 'package:Attendit/features/home/presentation/widgets/assignments/assignments.dart';
import 'package:Attendit/features/home/presentation/widgets/attendance/all_subject_attendance_card.dart';
import 'package:Attendit/features/home/presentation/widgets/attendance/attendance_bar.dart';
import 'package:Attendit/features/home/presentation/widgets/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        cubit: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is DetailsLoading) {
            return loaderWidget;
          }
          if (state is DetailsLoaded) {
            final student = state.student;
            return SingleChildScrollView(
              padding: PrimaryStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StudentProfileWidget(
                    enrollmentno: student.enrollment,
                    othrdetail:
                        "${student.batch.classroom.course.name} Section-${student.batch.classroom.section}",
                    studentimg: student.profilePicture,
                    studentname: student.name,
                  ),
                  /* Container(
                margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                child: Text(
                  "Attendance",
                  style: TextStyle(
                      // fontFamily: 'Rubik',
                      fontSize: 25,
                      color: Styles.headingfontcolor,
                      fontWeight: FontWeight.bold),
                ),
              ), */
                  AttendenceBarWidget(
                    attendanceBar: state.attendanceList,
                  ),
                  AttendanceCardWidget(allatendancelist: state.attendanceList),
                  /*  Container(
                margin: EdgeInsets.fromLTRB(20, 0, 15, 10),
                child: Text(
                  "Assignments",
                  style: TextStyle(
                      // fontFamily: 'Rubik',
                      fontSize: 25,
                      color: Styles.headingfontcolor,
                      fontWeight: FontWeight.bold),
                ),
              ), */
                  AssignmentsWidget(assignments: state.assignmentsList),
                ],
              ),
            );
          }
          if (state is DetailsError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text('Initial'),
          );
        },
      ),
    );
  }
}
