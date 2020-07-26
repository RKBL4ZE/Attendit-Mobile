import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/result/presentation/bloc/sem_bloc.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SemSelect extends StatelessWidget {
  final num totalSem;

  const SemSelect({this.totalSem});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: totalSem,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
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
            ..._getListings(totalSem),
          ],
          onTap: (index) {
            BlocProvider.of<SemBloc>(context).add(SelectSemEvent(index + 1));
          },
        ),
      ),
    );
  }
}

//List _listings = new List();
List<Widget> _getListings(int length) {
  // <<<<< Note this change for the return type
  List listings = new List<Widget>();
  for (int i = 1; i <= length; i++) {
    listings.add(
      Container(child: new Text("Sem $i")),
    );
  }
  return listings;
}
