import 'package:flutter/material.dart';

import 'assignment_pending_card.dart';

class PendingAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Text("Pending Assignment",
                textAlign: TextAlign.left,
                style: TextStyle(
                    // fontFamily: 'Rubik',

                    fontSize: 25,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(46, 96, 102, 1),
                    fontWeight: FontWeight.bold)),
          ),
          AssignmentCard(
            fullsubname: "Digital Electronics",
          ),
        ],
      ),
    );
  }
}
