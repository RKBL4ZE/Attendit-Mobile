
import 'package:flutter/material.dart';


class StudentNameCard extends StatelessWidget {
  final String name;
  final String enrollmentno;
  final String course;
  final String sclass;
  final String shift;

  const StudentNameCard(
      {Key key,
      this.name="Chrissy Costanza",
      this.enrollmentno = "0122070319",
      this.course = "Bca",
      this.sclass = "Bca 106",
      this.shift = "Morning"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final num flex1 = 5;
final num flex2 = 5;
final double fontsize = 16;
final double spacing = 10;


    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withAlpha(25),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  ),
                ]),
          width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            //  elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(spacing),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: flex1,
                                                        child: Text(
                                "Name",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(flex: flex2,
                                                        child: Text(
                                ":   ${name}",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(spacing),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: flex1,
                                                        child: Text(
                                "Enrollment Number",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                   fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(flex: flex2,
                                                        child: Text(
                                ":   ${enrollmentno}",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            
                            
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(spacing),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: flex1,
                                                        child: Text(
                                "Course",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(flex: flex2,
                                                        child: Text(
                                ":   ${course}",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(spacing),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: flex1,
                                                        child: Text(
                                "Class",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                   fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(flex: flex2,
                                                        child: Text(
                                ":   ${sclass}",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            
                            
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(spacing),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: flex1,
                                                        child: Text(
                                "Shift",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Expanded(flex: flex2,
                                                        child: Text(
                                ":   ${shift}",
                                style: TextStyle(
                                  // fontFamily: 'Karla',
                                  fontSize: fontsize,
                                  color: Color.fromRGBO(46, 96, 102, 1),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      
                      
                    ]),
              ),
            )));
  }
}
