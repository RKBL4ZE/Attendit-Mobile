import 'package:Attendit/features/result/presentation/externals/widget/marksbysub_card.dart';
import 'package:Attendit/features/result/presentation/externals/widget/semesterselector.dart';
import 'package:Attendit/features/result/presentation/externals/widget/studentnamecard.dart';
import 'package:Attendit/features/result/presentation/externals/widget/sub_bar.dart';

import 'package:flutter/material.dart';

//import '../screens/Create_Property_screen.dart';
//import '../dummy_data.dart';
//import '../widgets/AllProperty_widget.dart';

class ExternalPage extends StatelessWidget {
 // static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
      
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: SingleChildScrollView(
         
            child: Container(
         // margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: <Widget>[
              
              Container(
              margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text("Student External Report",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: 'Rubik',

                      fontSize: 31,
                      fontFamily: 'Rubik',
                      color: Color.fromRGBO(46, 96, 102, 1),
                      //fontWeight: FontWeight.bold
                      )),
            ),
              StudentNameCard(),
              TotalMarksBarWidget(),
              SemSelect(),
              SizedBox(height: 20,),
              MarksBySub(),MarksBySub(),MarksBySub(),
            ],
          ),
        )));
  }
}

