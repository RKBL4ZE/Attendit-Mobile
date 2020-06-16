import 'package:Attendit/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

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
    final double sheight = MediaQuery.of(context).size.height;
    return Drawer(
        child: Container(
          color: Color.fromRGBO(247, 247, 247, 1),
          child: Column(
            children: <Widget>[
              Container(
                
                child: Container(
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(95, 197, 209, 1),
                        Color.fromRGBO(152, 214, 217, 1)
                      ],
                    ),
                  ),
                    accountName: Text(
                      "Terry Ross",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    accountEmail: Text(
                      "arslannmrv@gmail.com",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://img1.kpopmap.com/2016/11/twice-tzuyu-pretty-side-profile-kpop-girl-group-idols.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                child: ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  leading: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      );
  }
}



