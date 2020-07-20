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
              child: RaisedButton(
                onPressed: () {
                  context
                      .bloc<SubmitAssignmentBloc>()
                      .add(SubmitAssignmentEvent(
                        id: widget.id,
                        file: widget.file,
                      ));
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Styles.colorshadow,
                          blurRadius: 9.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                      gradient: Styles.colorGradientTheme,
                      borderRadius: BorderRadius.circular(10.0)),
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: setUpButtonChild(),
                ),
              ),
            ));
  }

  Widget setUpButtonChild() {
    if (widget.state is SubmitAssignmentInitial) {
      return new Text(
        "Submit",
        style: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (widget.state is SubmitAssignmentUploading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
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
  }
}
