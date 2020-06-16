import 'package:Attendit/features/exams/presentation/externals/widget/marksbysub_card.dart';
import 'package:Attendit/features/exams/presentation/internals/widget/semesterselector.dart';

import 'package:Attendit/features/exams/presentation/internals/widget/studentnamecard.dart';
import 'package:Attendit/features/exams/presentation/internals/widget/sub_bar.dart';

import 'package:flutter/material.dart';

//import '../screens/Create_Property_screen.dart';
//import '../dummy_data.dart';
//import '../widgets/AllProperty_widget.dart';

class InternalPage extends StatelessWidget {
  static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
      
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: SingleChildScrollView(
         
            child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: <Widget>[
              Container(
              margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text("Student Internal Report",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: 'Rubik',

                      fontSize: 31,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(46, 96, 102, 1),
                      //fontWeight: FontWeight.bold
                      )),
            ),
              SizedBox(height: 20,),
              SemSelect(),
              StudentNameCard(),
              TotalMarksBarWidget(),
              MarksBySub(),MarksBySub(),MarksBySub(),
            ],
          ),
        )));
  }
}

