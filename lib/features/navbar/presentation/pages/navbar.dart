import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/home/presentation/bloc/home_bloc.dart';
import 'package:Attendit/features/home/presentation/pages/home_page.dart';
import 'package:Attendit/features/menu/presentation/pages/menu_page.dart';
import 'package:Attendit/features/navbar/presentation/pages/sidedrawer.dart';
import 'package:Attendit/features/newsfeed/presentation/pages/news_feed_page.dart';
import 'package:Attendit/features/timetable/presentation/pages/timetable_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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

  int pageIndex = 0;
  final List<Map<String, Object>> _pages = [
    {
      // 'page': MyHomePage(),
      'title': 'AttendIt',
    },
    {
      //'page': TimeTablePage(),
      'title': "Today's Lectures",
    },
    {
      // 'page': NewsFeedPage(),
      'title': 'News Feed',
    },
    {
      //'page': Chat_screen(),
      'title': ' ',
    },
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        //istranslucent is moved to NavBarDecoration
        icon: Icon(OMIcons.home),
        title: ("Home"),
        activeColor: NavbarStyle.active,
        inactiveColor: NavbarStyle.inactive,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(OMIcons.schedule),
        title: ("Time Table"),
        activeColor: NavbarStyle.active,
        inactiveColor: NavbarStyle.inactive,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(OMIcons.people),
        title: ("News Feed"),
        activeColor: NavbarStyle.active,
        inactiveColor: NavbarStyle.inactive,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(OMIcons.more),
        title: ("More"),
        activeColor: NavbarStyle.active,
        inactiveColor: NavbarStyle.inactive,
      ),
    ];
  }

  double elevation = 2;
  bool hideNav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: pageIndex == 0 || pageIndex == _pages.length - 1
            ? SvgPicture.asset(
                'assets/images/logo-black.svg',
                color: Colors.black,
                height: 50,
              )
            : Text(
                (_pages[pageIndex]['title']),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      /* appBar: GradientAppBar(
        elevation: 2,
        centerTitle: true,
        title: Container(
          //alignment: Alignment.center,
          // margin: new EdgeInsets.fromLTRB(0, 38, 0, 0),
          child: Text(
            (_pages[pageIndex]['title']),
            style: TextStyle(color: Colors.black),
          ),
        ),
       // gradient: Styles.colorGradientTheme,
      ), */
      body: MultiBlocProvider(
        providers: [BlocProvider<HomeBloc>(create: (_) => getIt())],
        child: PersistentTabView(
            stateManagement: true,
            controller: _controller,
            screens: _buildScreens(),
            items:
                _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
            confineInSafeArea: true,
            // backgroundColor: Colors.white,
            hideNavigationBarWhenKeyboardShows: true,
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears.
            handleAndroidBackButtonPress: true,
            // hideNavigationBar: hideNav,
            // /******  not working or screen push method is different********/
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 300),
            ),
            itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            onItemSelected: (index) {
              setState(() {
                if (index == 3) {
                  elevation = 0;
                } else {
                  elevation = 5;
                }
                pageIndex = index;
              }); // This is required to update the nav bar if Android back button is pressed
            },
            itemCount: 4,
            navBarStyle: NavBarStyle
                .style13 // Choose the nav bar style with this property
            ),
      ),
    );
  }
}
