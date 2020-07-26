import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/virtual_id_card/presentation/bloc/virtualidcard_bloc.dart';
import 'package:Attendit/features/virtual_id_card/presentation/widgets/virtual_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VirtualID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VirtualidcardBloc, VirtualidcardState>(
      builder: (context, state) {
        if (state is VirtualidcardLoading) {
          return loaderWidget;
        }
        if (state is VirtualidcardLoaded) {
          final student = state.student;
          return VirtualIdCard(
            profileUrl: student.profilePicture,
            name: student.name,
            enrollment: student.enrollment,
            course: student.batch.classroom.course.name,
            year: student.batch.session,
          );
        }
        if (state is VirtualidcardError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Center(
          child: Text('Initial'),
        );
      },
    );
  }
}
