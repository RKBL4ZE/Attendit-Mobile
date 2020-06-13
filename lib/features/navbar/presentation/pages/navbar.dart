import 'package:Attendit/features/home/presentation/pages/home_page.dart';
import 'package:Attendit/features/timetable/presentation/pages/timetable_page.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class NavBar extends StatefulWidget {
  static const routeName = '/navbar';
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Map<String, Object>> _pages = [
    {
      'page': MyHomePage(),
      'title': 'Dashboard',
    },
    {
      'page': TimeTablePage(),
      'title': 'Time Table',
    },
    {
      //'page': NewsFeed(),
      'title': 'News Feed',
    },
    {
      //'page': Chat_screen(),
      'title': 'More',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        brightness: Brightness.dark,
        title: Container(
            alignment: Alignment.center,

            // margin: new EdgeInsets.fromLTRB(0, 38, 0, 0),
            child: Text(_pages[_selectedPageIndex]['title'])),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(95, 197, 209, 1),
          Color.fromRGBO(152, 214, 217, 1)
        ]),
      ),
      // drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(168, 181, 198, 1),
        selectedItemColor: Color.fromRGBO(95, 197, 209, 1),

        currentIndex: _selectedPageIndex,

        //selectedIconTheme: IconThemeData(size: 20),
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            icon: Icon(Icons.table_chart),
            title: Text('Time Table'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            icon: Icon(Icons.new_releases),
            title: Text('News Feed'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            icon: Icon(Icons.more),
            title: Text('More'),
          ),
        ],
      ),
    );
  }
}
