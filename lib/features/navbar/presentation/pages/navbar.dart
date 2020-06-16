import 'package:Attendit/features/home/presentation/pages/home_page.dart';
import 'package:Attendit/features/menu/presentation/pages/menu_page.dart';
import 'package:Attendit/features/navbar/presentation/pages/sidedrawer.dart';
import 'package:Attendit/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:Attendit/features/timetable/presentation/pages/timetable_page.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:persistent_bottom_nav_bar/models/persisten-bottom-nav-item.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-bottom-nav-bar-styles.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class NavBar extends StatefulWidget {
  static const routeName = '/navbar';
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MyHomePage(),
      TimeTablePage(),
      NewsFeedPage(),
      MenuPage(),
    ];
  }
int pageIndex=0;
 final List<Map<String, Object>> _pages = [
    {
     // 'page': MyHomePage(),
      'title': 'Dashboard',
    },
    {
      //'page': TimeTablePage(),
      'title': 'Time Table',
    },
    {
     // 'page': NewsFeedPage(),
      'title': 'News Feed',
    },
    {
      //'page': Chat_screen(),
      'title': 'More',
    },
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.table_chart),
        title: ("Time Table"),
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.new_releases),
        title: ("News Feed"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.more),
        title: ("More"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(_pages[pageIndex]['title']),
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(95, 197, 209, 1),
                      Color.fromRGBO(152, 214, 217, 1)
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: PersistentTabView(
              controller: _controller,
              screens: _buildScreens(),
              items:
                  _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
              confineInSafeArea: true,
              backgroundColor: Colors.white,
              handleAndroidBackButtonPress: true,
              onItemSelected: (index) {
                setState(
                    () {
                      pageIndex= index;
                    }); // This is required to update the nav bar if Android back button is pressed
              },
              itemCount: 4,
              navBarStyle: NavBarStyle
                  .style6 // Choose the nav bar style with this property
              ),
        ),
      ),
    );
  }
}
