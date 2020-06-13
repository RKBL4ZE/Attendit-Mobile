import 'package:flutter/material.dart';

class TimeTableCardWidget extends StatelessWidget {
  final String time;
  final String subjectName;
  final String facultyName;

  const TimeTableCardWidget(
      {@required this.time,
      @required this.subjectName,
      @required this.facultyName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //  onTap: () => selectCategory(context),
      //  splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(70),
                              blurRadius: 6.0,
                              spreadRadius: 3.0,
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                            ),
                          ]),

           // height: 100,
            width: double.infinity,
            margin: new EdgeInsets.fromLTRB(0, 5, 0, 10),
           //padding: const EdgeInsets.all(15),
          child: Card(
           // elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                margin: new EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                  // fontFamily: 'Rubik',
                  fontSize: 16,
                  color: Color.fromRGBO(46, 96, 102, 1),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: new EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(subjectName,
                style: TextStyle(
                    // fontFamily: 'Rubik',
                    fontSize: 31,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(46, 96, 102, 1),
                    fontWeight: FontWeight.bold),),
            ),
            Text("- ${facultyName}",
              style: TextStyle(
                  // fontFamily: 'Rubik',
                  fontSize: 16,
                  color: Color.fromRGBO(46, 96, 102, 1),
                  ),),
          ],
        ),
      ))),
    );
  }
}
