import 'dart:io';

import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/assignment/presentation/bloc/assignment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentButton extends StatefulWidget {
  final SubmitAssignmentState state;
  final String id;
  final File file;

  const AssignmentButton({Key key, this.state, this.id, this.file})
      : super(key: key);

  @override
  _AssignmentButtonState createState() => _AssignmentButtonState();
}

class _AssignmentButtonState extends State<AssignmentButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<SubmitAssignmentBloc>(context),
        builder: (context, state) => Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Container(
              //margin: EdgeInsets.fromLTRB(70, 15, 70, 15),
              //alignment: Alignment.bottomCenter,
              height: 45.0,
              child: RaisedButton(
                shape: LectureCardStyle.shape,
                color: LectureCardStyle.buttonColor,
                onPressed: () {
                  context.bloc<SubmitAssignmentBloc>().add(
                      SubmitAssignmentEvent(id: widget.id, file: widget.file));
                  setState(() {});
                },
                /* shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)), */
                child: Container(
                  //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: setUpButtonChild(),
                ),
              ),
            )));
  }

  Widget setUpButtonChild() {
    if (widget.state is SubmitAssignmentInitial) {
      return new Text(
        "Submit",
        style: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (widget.state is SubmitAssignmentUploading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else if (widget.state is SubmitAssignmentUploaded) {
      // BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
      return Icon(Icons.check, color: Colors.white);
    } else if (widget.state is SubmitAssignmentError) {
      return Icon(
        Icons.clear,
        color: Colors.white,
      );
    }
    return Container();
  }
}
