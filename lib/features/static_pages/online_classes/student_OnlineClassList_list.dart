import 'package:Attendit/features/static_pages/online_classes/student_assignment_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OnlineClassList extends StatelessWidget {
  final String assignmnettitle;

  const OnlineClassList({Key key, this.assignmnettitle = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: new EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Text("Class List",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        // fontFamily: 'Rubik',

                        fontSize: 25,
                        fontFamily: 'Rubik',
                        color: Color.fromRGBO(46, 96, 102, 1),
                        fontWeight: FontWeight.bold)),
              ),
              ClassNameCard(
                classname: "Algorithm in C",
                time: "08:00-09:00",
                fullAssignmentName: "AI",
                topic: "Game Theory",
                fName: "Neetu Anand",
              ),
              ClassNameCard(
                classname: "Maths",
                time: "10:00-11:00",
                fullAssignmentName: "AI",
                topic: "Recursion",
                fName: "Ravindra Kajal",
              ),
              ClassNameCard(
                classname: "Data Management",
                time: "12:00-13:00",
                fullAssignmentName: "AI",
                topic: "Principles of Management",
                fName: "Vinita Tomar",
              ),
              ClassNameCard(
                classname: "Data Structure",
                time: "14:00-15:00",
                fullAssignmentName: "AI",
                topic: "Motion in 2D",
                fName: "Suraj Pal Chauhan",
              ),
              ClassNameCard(
                classname: "Cyber Ethics.",
                time: "15:00-15:30",
                fullAssignmentName: "AI",
                topic: "Internet Etiquette",
                fName: "Neetu Anand",
              ),
            ],
          ),
        ),
      ),
    )
        // floatingActionButton: MyFloatingActionButton(),
        ;
  }
}

class ClassNameCard extends StatelessWidget {
  final String classname;
  final String time;
  final String fullAssignmentName;
  final String topic;
  final String fName;

  const ClassNameCard(
      {Key key,
      this.classname,
      this.time,
      this.fullAssignmentName,
      this.topic,
      this.fName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(context,
            screen: StudentAssignmentDetailsPage(
              studentName: classname,
              fullAssignmentName: time,
              fName: fName,
              topic: topic,
            ));
      },
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
              // color: cardcolor,
              // elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                margin: new EdgeInsets.fromLTRB(20, 12, 15, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // margin: new EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: AutoSizeText(
                            classname,
                            maxLines: 1,
                            style: TextStyle(
                                // fontFamily: 'Rubik',
                                fontSize: 18,
                                fontFamily: 'Rubik',
                                color: Color.fromRGBO(46, 96, 102, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        // fontFamily: 'Rubik',
                        fontSize: 15,
                        fontFamily: 'Rubik',
                        color: Color.fromRGBO(95, 197, 209, 1),
                        // fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
