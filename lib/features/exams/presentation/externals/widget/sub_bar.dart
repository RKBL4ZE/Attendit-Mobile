import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class TotalMarksBarWidget extends StatelessWidget {
  final List attendanceBar;
  //final attendence = DUMMY_subdetailsatten.toList();

TotalMarksBarWidget(
      {/*@required*/ this.attendanceBar,});




  @override
  Widget build(BuildContext context) {
    final double radius=120;
    final double angle= 0; 
    final double footersize = 30; 
    final Color footercolor = Color.fromRGBO(95, 197, 209, 1);
    final double insidefont = 30;


    return InkWell(
        //  onTap: () => selectProperty(context),
        child: Container(
          
            margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularPercentIndicator(
                  footer: Text("SGPA",style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: footersize,
                              color: footercolor,
                                fontWeight: FontWeight.bold
                            ),),
                  startAngle: angle,
                    linearGradient: LinearGradient(colors: [Color.fromRGBO(95, 197, 209, 1),Colors.greenAccent]),
                    circularStrokeCap: CircularStrokeCap.round,
                   // arcType: ArcType.FULL,
                   // arcBackgroundColor: Colors.white,
                    animation: true,
                    backgroundColor: Colors.transparent,
                    animationDuration: 1000,
                    radius: radius,
                    lineWidth: 15.0,
                    percent: 0.6,
                    //footer: Text("ve"),
                    center: new Text("60%",style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: insidefont,
                              color: footercolor,
                                fontWeight: FontWeight.bold
                            ),),
                    //progressColor: Color.fromRGBO(95, 197, 209, 1),
                  ),
                  SizedBox(width: 10,),
                  CircularPercentIndicator(
                    startAngle: angle,
                    linearGradient: LinearGradient(colors: [Color.fromRGBO(95, 197, 209, 1),Colors.greenAccent]),
                    circularStrokeCap: CircularStrokeCap.round,
                   // arcType: ArcType.FULL,
                   // arcBackgroundColor: Colors.white,
                    animation: true,
                    backgroundColor: Colors.transparent,
                    animationDuration: 1000,
                    radius: radius,
                    lineWidth: 15.0,
                    percent: 1,
                    footer:  Text("CGPA",style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: footersize,
                              color: Color.fromRGBO(95, 197, 209, 1),
                                fontWeight: FontWeight.bold
                            ),),
                    center: new Text("60%",style: TextStyle(
                              // fontFamily: 'Rubik',
                              fontSize: insidefont,
                              color: Color.fromRGBO(95, 197, 209, 1),
                                fontWeight: FontWeight.bold
                            ),),
                    //progressColor: Color.fromRGBO(95, 197, 209, 1),
                  ),
                  
              ],
            )));
  }
}
