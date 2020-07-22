import 'dart:io';

import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/assignment/presentation/bloc/assignment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'assignment_button.dart';

class AssignmentSubmitButton extends StatelessWidget {
  final String id;
  final File file;

  const AssignmentSubmitButton(
      {Key key, @required this.id, @required this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubmitAssignmentBloc>(
      create: (_) => getIt(),
      child: BlocBuilder<SubmitAssignmentBloc, SubmitAssignmentState>(
          builder: (context, state) {
        if (state is SubmitAssignmentInitial ||
            state is SubmitAssignmentUploading ||
            state is SubmitAssignmentUploaded) {
          return AssignmentButton(state: state, id: id, file: file);
        }

        if (state is SubmitAssignmentError) {
          return Column(
            children: <Widget>[
              Text("error"),
              // LoginForm()
            ],
          );
        }
        return Container();
      }),
    );
  }
}
