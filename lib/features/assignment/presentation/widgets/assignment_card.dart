import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'assignment_file.dart';
import 'assignment_file_picker.dart';
import 'assignment_submit_button.dart';

final double radius = 70;
final double angle = 0;
final double insidefont = 20;
final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
final Color textColor = Color.fromRGBO(29, 53, 84, 0.9);
final int barpercent = 90;
//final double containerheight = 105;

class AssignmentCard extends StatefulWidget {
  final String subname;
  final String title;
  final String id;
  final String subjectCode;
  final String file;
  final String submitFile;
  final num marks;
  final String createdAt;
  final String dueDate;
  final String faculty;
  final num totalMarks;
  final String status;

  const AssignmentCard(
      {Key key,
      this.subname,
      this.title,
      this.id,
      this.subjectCode,
      this.file,
      this.submitFile,
      this.marks,
      this.createdAt,
      this.dueDate,
      this.faculty,
      this.totalMarks,
      this.status})
      : super(key: key);
  @override
  _AssignmentCardState createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  File userFile;
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

  void setUserFile(File _file) {
    setState(() {
      userFile = _file;
    });
    print(_file);
  }

  Widget convertTime(String utctime) {
    //   var format = DateFormat('yyyy-MM-dd').parse(utctime);

    //  // DateTime time = format.format(utctime);
    // // time.toLocal();
    var date = DateTime.parse(utctime);
    var dateFormatter = new DateFormat('yyyy MMMM dd');
    String formattedDate = dateFormatter.format(date);

    DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    DateTime open = dateFormat.parse(utctime);
    open = new DateTime(
        open.year, open.month, open.day - 3, open.hour, open.minute);
    DateTime close = dateFormat.parse(utctime);
    close =
        new DateTime(close.year, close.month, close.day, now.hour, now.minute);

    Color cardcolor = Colors.white;
    final currentTime = DateTime.now();

    if (currentTime.isBefore(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.blue;
    } else if (currentTime.isAfter(open) && currentTime.isBefore(close)) {
      cardcolor = Colors.yellow;
    } else if (currentTime.isAfter(open) && currentTime.isAfter(close)) {
      cardcolor = Colors.red;
    }

    return Text(
      "Due  $formattedDate",
      textAlign: TextAlign.right,
      style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 14,
          color: cardcolor,
          fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (bar == true) {
      return InkWell(
          onTap: () => chanebar(),
          child: Card(
            // color: Color.fromRGBO(225, 239, 240, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: <Widget>[
                  title: Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: AutoSizeText(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 19,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      )),
                  subtitle: Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: AutoSizeText(
                        " - ${widget.subname}",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      )),
                  trailing: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(
                      "View Details",
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // SizedBox(width: 1)
                )),
          ));
    } else if (bar == false) {
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
                      AutoSizeText(
                        widget.subname,
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
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          widget.title,
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
                          "Attachments",
                          style: TextStyle(
                              fontFamily: 'Karla',
                              fontSize: 17,
                              color: Color.fromRGBO(95, 197, 209, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AssignmentFile(
                        fileName: "${widget.title} file",
                        file: widget.file,
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      SizedBox(height: 6),

                      Container(
                          child: widget.status == "COMPLETED"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Text(
                                        "Your Work",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Karla',
                                            fontSize: 17,
                                            color:
                                                Color.fromRGBO(95, 197, 209, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    AssignmentFile(
                                      file: widget.submitFile,
                                    ),
                                    Text("Submitted"),
                                  ],
                                )
                              : Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        convertTime(widget.dueDate),
                                        // Text(
                                        //   "Due ${convertTime(widget.dueDate)}",
                                        // style: TextStyle(
                                        //     fontFamily: 'Karla',
                                        //     fontSize: 14,
                                        //     color: Colors.red,
                                        //     fontWeight: FontWeight.bold),
                                        // ),
                                        Text(
                                          "Max Marks: ${widget.totalMarks}",
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
                                    AssignmentFilePicker(setUserFile),
                                    userFile != null
                                        ? AssignmentSubmitButton(
                                            id: widget.id,
                                            file: userFile,
                                          )
                                        : Text("data"),
                                  ],
                                )),
                    ],
                  ),
                ),
              )));
    }
  }
}
