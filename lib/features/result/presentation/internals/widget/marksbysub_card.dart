import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import '../screens/PropertyDetails_screen.dart';
//import '../models/AllProperty_model.dart';

final double radius = 70;
final double angle = 0;
final double insidefont = 20;
final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
final Color textColor = Color.fromRGBO(29, 53, 84, 0.9);
final int barpercent = 90;
final double containerheight = 105;

class MarksBySub extends StatefulWidget {
  @override
  _MarksBySubState createState() => _MarksBySubState();
}

class _MarksBySubState extends State<MarksBySub> {
  bool bar = true;
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

  @override
  Widget build(BuildContext context) {
    if (bar) {
      return InkWell(
          onTap: () => chanebar(),
          child: Container(
              height: containerheight,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Card(
                color: Color.fromRGBO(225, 239, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 5, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "BCA 302",
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 15,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "DWDM",
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: CircularPercentIndicator(
                        backgroundColor: Colors.white,
                        startAngle: angle,
                        linearGradient: LinearGradient(colors: [
                          Styles.colorPrimary,
                          Styles.colorSecondary
                        ]),
                        circularStrokeCap: CircularStrokeCap.round,
                        // arcType: ArcType.FULL,
                        // arcBackgroundColor: Colors.white,
                        animation: true,
                        //backgroundColor: Colors.transparent,
                        animationDuration: 1000,
                        radius: radius,
                        lineWidth: 7.0,
                        percent: (barpercent / 100).toDouble(),
                        //footer: Text("ve"),
                        center: new Text(
                          "$barpercent%",
                          style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: insidefont,
                              color: footercolor,
                              fontWeight: FontWeight.bold),
                        ),
                        //progressColor: Color.fromRGBO(95, 197, 209, 1),
                      ),
                    ),
                  ],
                ),
              )));
    } else {
      return InkWell(
          onTap: () => chanebar(),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(95, 197, 209, 1),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ]),
              height: containerheight,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Card(
                borderOnForeground: true,
                color: Color.fromRGBO(225, 239, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Data Warehouse And Data Mining",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Karla',
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  "Internal : 25/25",
                                  style: TextStyle(
                                    fontFamily: 'Karla',
                                    fontSize: 16,
                                    color: Color.fromRGBO(46, 96, 102, 1),
                                    //  fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              //   child: Text(
                              //     "External : 55/75",
                              //     style: TextStyle(
                              //       fontFamily: 'Karla',
                              //       fontSize: 16,
                              //       color: Color.fromRGBO(46, 96, 102, 1),
                              //       // fontWeight: FontWeight.bold
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            "Total : 80/100",
                            style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 16,
                                color: Color.fromRGBO(5, 160, 179, 1),
                                fontWeight: FontWeight.bold),
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
