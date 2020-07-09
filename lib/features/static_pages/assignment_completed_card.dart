import 'package:Attendit/config/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

final double radius = 70;
final double angle = 0;
final double insidefont = 20;
final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
final Color textColor = Color.fromRGBO(29, 53, 84, 0.9);
final int barpercent = 90;
//final double containerheight = 105;

class AssignmentCard extends StatefulWidget {
  final String fullsubname;

  const AssignmentCard({Key key, this.fullsubname}) : super(key: key);
  @override
  _AssignmentCardState createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
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

  @override
  Widget build(BuildContext context) {
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

    if (bar == true) {
      return InkWell(
          onTap: () => chanebar(),
          child: Container(
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Card(
                // color: Color.fromRGBO(225, 239, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                        child: AutoSizeText(
                          widget.fullsubname,
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 19,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
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
                  ],
                ),
              )));
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
                      Text(
                        widget.fullsubname,
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
                              "Check out Attached pdf and submit your assignment",
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
                          menuContent(Icons.picture_as_pdf, "Assignment.pdf",
                              Text(""), context),
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                                    BorderRadius.circular(
                                                        10.0)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        child: Text(
                                          "Your Work",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Karla',
                                              fontSize: 17,
                                              color: Color.fromRGBO(
                                                  95, 197, 209, 1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      menuContent(
                                          Icons.picture_as_pdf,
                                          "AssignmentWork.pdf",
                                          Text(""),
                                          context),
                                      SizedBox(height: 6),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Submited",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 10, 0, 25),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withAlpha(70),
                                                blurRadius: 6.0,
                                                spreadRadius: 4.0,
                                                offset: Offset(
                                                  0.0,
                                                  3.0,
                                                ),
                                              ),
                                            ]),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          //  elevation: 5.0,
                                          shadowColor:
                                              Color.fromRGBO(152, 214, 217, 1),
                                          child: TextField(
                                            // controller: username,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.send),
                                              prefixIcon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    7, 7, 10, 7),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withAlpha(70),
                                                      blurRadius: 6.0,
                                                      spreadRadius: 4.0,
                                                      offset: Offset(
                                                        0.0,
                                                        3.0,
                                                      ),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                  border: Border.all(
                                                    color: Colors.white70,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100),
                                                  ),
                                                  child: Image.network(
                                                    "https://pbs.twimg.com/media/D92KtbDWkAA_0j6.jpg",
                                                    height: 30,
                                                    width: 30,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),

                                              border: InputBorder.none,

                                              //  contentPadding: EdgeInsets.all(8),

                                              //Add th Hint text here.

                                              hintText: "Type here...",

                                              hintStyle: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      168, 181, 198, 1)),
                                            ),
                                          ),
                                        ),
                                      ),
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
}
