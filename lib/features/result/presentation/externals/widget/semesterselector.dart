import 'package:Attendit/config/styles.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class SemSelect extends StatelessWidget {
  final List attendanceBar;
  //final attendence = DUMMY_subdetailsatten.toList();

  SemSelect({
    /*@required*/ this.attendanceBar,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          isScrollable: true,
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: ResultCardStyle.selectedColor,
          ),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            ..._getListings(8),
          ],
          onTap: (index) {},
        ),
      ),
    );
  }
}

//List _listings = new List();
List<Widget> _getListings(int length) {
  // <<<<< Note this change for the return type
  List listings = new List<Widget>();
  int i = 0;
  for (i = 0; i < length; i++) {
    listings.add(
      Container(child: new Text("Sem ${i + 1}")),
    );
  }
  return listings;
}
