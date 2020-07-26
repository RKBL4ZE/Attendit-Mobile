import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:Attendit/features/profile/presentation/widgets/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return loaderWidget;
          }
          if (state is ProfileLoaded) {
            final student = state.student;
            return EditProfile(
              profileURL: student.profilePicture,
              course: student.batch.classroom.course.name,
              section: student.batch.classroom.section,
              semester: student.batch.classroom.semester.toString(),
              enrollmentNo: student.enrollment,
              name: student.name,
              email: student.email,
              mobileNo: student.mobile,
            );
          }
          if (state is ProfileError) {
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
