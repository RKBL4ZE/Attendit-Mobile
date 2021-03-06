import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:Attendit/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:Attendit/features/profile/presentation/pages/profile.dart';
import 'package:Attendit/features/static_pages/pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SideDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    //  final double sheight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.blueGrey[400]),
              child: Container(
                  // child: UserAccountsDrawerHeader(
                  //   /*  decoration: BoxDecoration(color: Colors.blue), */
                  //   accountName: Text(
                  //     "Terry Ross",
                  //     style: TextStyle(fontSize: 15.0),
                  //   ),
                  //   accountEmail: Text(
                  //     "arslannmrv@gmail.com",
                  //     style: TextStyle(fontSize: 15.0),
                  //   ),
                  //   currentAccountPicture: Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: NetworkImage(
                  //             "https://img1.kpopmap.com/2016/11/twice-tzuyu-pretty-side-profile-kpop-girl-group-idols.jpg"),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ),
            ),
            new Container(
              child: ListTile(
                onTap: () {
                  pushNewScreen(context,
                      screen: BlocProvider<ProfileBloc>(
                          create: (_) => getIt(), child: Profile()));
                },
                title: Text(
                  "Profile",
                  style:
                      TextStyle(fontSize: 18.0, color: Styles.headingfontcolor),
                ),
                leading: Icon(
                  Icons.person,
                  color: Styles.headingfontcolor,
                ),
              ),
            ),
            new Container(
              child: ListTile(
                onTap: () {
                  pushNewScreen(context, screen: Pending());
                },
                title: Text(
                  "Note's",
                  style:
                      TextStyle(fontSize: 18.0, color: Styles.headingfontcolor),
                ),
                leading: Icon(
                  Icons.speaker_notes,
                  color: Styles.headingfontcolor,
                ),
              ),
            ),
            new Container(
              child: ListTile(
                onTap: () {
                  pushNewScreen(context, screen: Pending());
                },
                title: Text(
                  "Question Papers",
                  style:
                      TextStyle(fontSize: 18.0, color: Styles.headingfontcolor),
                ),
                leading: Icon(
                  Icons.question_answer,
                  color: Styles.headingfontcolor,
                ),
              ),
            ),
            // Container(
            //   child: ListTile(
            //     title: Text(
            //       "Settings",
            //       style:
            //           TextStyle(fontSize: 18.0, color: Styles.headingfontcolor),
            //     ),
            //     leading: Icon(
            //       Icons.settings,
            //       color: Styles.headingfontcolor,
            //     ),
            //   ),
            // ),
            // Styles.divider,
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  //  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                      BlocProvider.of<NavigatorBloc>(context)
                          .add(NavigatetoLoginEvent());
                    },
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 20.0, color: Styles.headingfontcolor),
                    ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Styles.headingfontcolor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
