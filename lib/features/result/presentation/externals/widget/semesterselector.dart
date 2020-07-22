
import 'package:Attendit/config/styles.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';



class SemSelect extends StatelessWidget {
  final List attendanceBar;
  //final attendence = DUMMY_subdetailsatten.toList();

SemSelect(
      {/*@required*/ this.attendanceBar,});




  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 3,
        child: Container(
          
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.grey[300],
            ),
            labelStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Text('Sem 1'),
              Text('Sem 2'),Text('Sem 3'),
            ],
            onTap: (index) {},
          ),
        ),
      );
  }



}



