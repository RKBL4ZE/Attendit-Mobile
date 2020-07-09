import 'package:flutter/material.dart';

import 'student_assignmnet_details_card.dart';

class StudentAssignmentDetailsPage extends StatelessWidget {
  final String fullAssignmentName;
  final String studentName;
  final String topic;
  final String fName;

  const StudentAssignmentDetailsPage(
      {Key key, this.studentName, this.fullAssignmentName,this.topic,this.fName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Text(studentName,
                textAlign: TextAlign.left,
                style: TextStyle(
                    // fontFamily: 'Rubik',

                    fontSize: 25,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(46, 96, 102, 1),
                    fontWeight: FontWeight.bold)),
          ),
          StudentAssignmentDetails(
            fullAssignmentName: fullAssignmentName,
            studentName: studentName,
            topic: topic,
            fName: fName,
          ),
        ],
      ),
    );
  }
}
