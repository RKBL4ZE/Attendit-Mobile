import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/assignment/data/models/student_assigments_model.dart';
import 'package:Attendit/features/assignment/presentation/bloc/assignment_bloc.dart';
import 'package:Attendit/features/assignment/presentation/widgets/assignment_list_widget.dart';

import 'package:Attendit/loaders/color_loader_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentPage extends StatelessWidget {
  final String assignmentStatus;

  const AssignmentPage({Key key, this.assignmentStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssignmentBloc>(
      create: (_) => getIt(),
      child:
          Scaffold(body: AssignmentWidget(assignmentStatus: assignmentStatus)),
    );
  }
}

class AssignmentWidget extends StatelessWidget {
  final String assignmentStatus;

  const AssignmentWidget({Key key, this.assignmentStatus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    final _bloc = BlocProvider.of<AssignmentBloc>(context);
    _bloc.add(GetDetailsEvent());
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: BlocBuilder<AssignmentBloc, AssignmentState>(
        bloc: BlocProvider.of<AssignmentBloc>(context),
        builder: (context, state) {
          if (state is DetailsLoading) {
            return Center(child: ColorLoader3());
          }
          if (state is DetailsLoaded) {
            var completed = List<StudentAssignmentModel>();
            var pending = List<StudentAssignmentModel>();
            state.assignmentsList.forEach((e) {
              if (e.status == "PENDING")
                pending.add(e);
              else
                completed.add(e);
            });
            if (assignmentStatus == "COMPLETED") {
              return AssignmentsListWidget(
                  assignments: completed, assignmentStatus: assignmentStatus);
            } else if (assignmentStatus == "PENDING") {
              return AssignmentsListWidget(
                  assignments: pending, assignmentStatus: assignmentStatus);
            } else
              return Text("error");
          }
          if (state is DetailsError) {
            print(state);
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text('Initial'),
          );
        },
      ),
    ));
  }
}
