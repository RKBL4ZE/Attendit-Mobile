import 'package:flutter/material.dart';

final double radius = 70;
final double angle = 0;
final double insidefont = 20;
final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
final Color textColor = Color.fromRGBO(29, 53, 84, 0.9);
final int barpercent = 90;
//final double containerheight = 105;

class StudentAssignmentDetails extends StatefulWidget {
  final String fullAssignmentName;
  final String studentName;
  final String topic;
  final String fName;

  const StudentAssignmentDetails(
      {Key key,
      this.fullAssignmentName,
      this.studentName,
      this.topic,
      this.fName})
      : super(key: key);
  @override
  _StudentAssignmentDetailsState createState() =>
      _StudentAssignmentDetailsState();
}

class _StudentAssignmentDetailsState extends State<StudentAssignmentDetails> {
  bool bar = true;
  bool addattachment = false;
  void chanebar() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (bar == false) {
        bar = true;
      } else if (bar == true) {
        bar = false;
      }
    });
  }

  void chaneattachments() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (addattachment == false) {
        addattachment = true;
      } else if (addattachment == true) {
        addattachment = false;
      }
    });
  }

  Widget menuContent(var icon, String string, Widget widget, var context) {
    return InkWell(
      onTap: () {
        //  pushNewScreen(context, screen: widget);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.red,
              //color: Color.fromRGBO(128, 139, 151, 1),
              size: 20.0,
            ),
            SizedBox(
              width: 15,
            ),
            Text(string,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Rubik',
                    color: Color.fromRGBO(128, 139, 151, 1),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => chanebar(),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(60),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  ),
                ]),
            //height: containerheight,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Card(
              borderOnForeground: true,
              //color: Color.fromRGBO(225, 239, 240, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.fullAssignmentName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Karla',
                          fontSize: 19,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Tap on the open link button and join meeting.!",
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 16,
                              color: Color.fromRGBO(46, 96, 102, 1),
                              //  fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Topic's",
                            style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 17,
                                color: Color.fromRGBO(95, 197, 209, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            " * ${widget.topic}",
                            style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 20,
                                color: Color.fromRGBO(46, 96, 102, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "     - ${widget.fName}",
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 17,
                              color: Color.fromRGBO(46, 96, 102, 1),
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Container(
                          child: addattachment
                              ? Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Due 01 Jun,10:00 AM",
                                          style: TextStyle(
                                              fontFamily: 'Karla',
                                              fontSize: 14,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Max Marks: 25",
                                          style: TextStyle(
                                              fontFamily: 'Karla',
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  95, 197, 209, 1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 14, 0, 14),
                                        alignment: Alignment.bottomCenter,
                                        height: 40.0,
                                        child: OutlineButton(
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      10.0)),

                                          // textColor: Colors.blue,
                                          child: SizedBox.expand(
                                            child: Center(
                                              child: Text('Add Attachments',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        95, 197, 209, 1),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  95, 197, 209, 1),
                                              style: BorderStyle.solid,
                                              width: 1.5),

                                          onPressed: () {
                                            chaneattachments();
                                          },
                                        )),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      alignment: Alignment.bottomCenter,
                                      height: 40.0,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      95, 197, 209, 1),
                                                  Color.fromRGBO(
                                                      152, 214, 217, 1)
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 300.0,
                                                minHeight: 50.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Mark As Done ! ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Text(
                                        "",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Karla',
                                            fontSize: 17,
                                            color:
                                                Color.fromRGBO(95, 197, 209, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            alignment: Alignment.bottomCenter,
                                            height: 40.0,
                                            child: RaisedButton(
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0)),
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            95, 197, 209, 1),
                                                        Color.fromRGBO(
                                                            152, 214, 217, 1)
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 300.0,
                                                      minHeight: 50.0),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Open Link",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    )
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
