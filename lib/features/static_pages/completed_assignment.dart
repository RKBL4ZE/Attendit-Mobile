import 'package:flutter/material.dart';

import 'assignment_completed_card.dart';

class CompletedAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text("Completed Assignment",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      // fontFamily: 'Rubik',

                      fontSize: 25,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(46, 96, 102, 1),
                      fontWeight: FontWeight.bold)),
            ),
            AssignmentCard(
              fullsubname: "Database Managment",
            ),
            AssignmentCard(
              fullsubname: "Cyber Ethics",
            ),
          ],
        ),
      ),
    );
  }
}
