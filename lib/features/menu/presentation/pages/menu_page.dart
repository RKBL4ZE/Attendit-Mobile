import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/icons/icons_service.dart';
import 'package:Attendit/core/injection/injection.dart';

import 'package:Attendit/features/result/presentation/externals/pages/external.dart';

import 'package:Attendit/features/static_pages/online_classes/student_OnlineClassList_list.dart';
import 'package:Attendit/features/virtual_id_card/presentation/bloc/virtualidcard_bloc.dart';
import 'package:Attendit/features/virtual_id_card/presentation/pages/virtual_id.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    // final double sheight = MediaQuery.of(context).size.height;
    // final prop = Dummy_AllPropertys.toList();

    // return SingleChildScrollView(
    // 	  child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Container(
    //             height: 170,
    //             width: double.infinity,
    //             child: Expanded(child: Card(child: Center(child: Text("reju"))))),
    //       ),
    //       GridView.count(

    //         crossAxisCount: 2,
    //         shrinkWrap: true,
    //         primary: false,
    //         childAspectRatio: 1 / 0.55,
    //         padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
    //         mainAxisSpacing: 10,
    //         crossAxisSpacing: 10,
    //         children: <Widget>[
    //           menuContent(IconsService.onlineClasses, "Online Classes",
    //               OnlineClassList(), context),
    //           // menuContent(IconsService., "Internal Marks", InternalPage(), context),
    //           menuContent(IconsService.exteralMarks, "External Marks",
    //               ExternalPage(), context),
    //           menuContent(IconsService.assignment, "Assignment",
    //               Scaffold(body: Text("soon!!")), context),
    //           menuContent(IconsService.contactUs, "Contact Us",
    //               Scaffold(body: Text("soon!!")), context),
    //           menuContent(IconsService.aboutUs, "About Us",
    //               Scaffold(body: WelcomeScreen()), context),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BlocProvider<VirtualidcardBloc>(
                create: (_) => getIt(), child: VirtualID()),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            //   child: Container(
            //     constraints: BoxConstraints(minHeight: 300, maxHeight: 300),
            //     //height: 175,
            //     width: double.infinity,
            //     decoration: BoxDecoration(boxShadow: [CardStyle.boxShadow]),
            //     child: Card(child: Center(child: Text("reju"))),
            //   ),
            // ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        menuContent(IconsService.onlineClasses,
                            "Online Classes", OnlineClassList(), context),
                        SizedBox(
                          width: 10,
                        ),
                        menuContent(IconsService.exteralMarks, "External Marks",
                            ExternalPage(), context),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        menuContent(IconsService.assignment, "Assignment",
                            Scaffold(body: Text("soon!!")), context),
                        SizedBox(
                          width: 10,
                        ),
                        menuContent(IconsService.contactUs, "Contact Us",
                            Scaffold(body: Text("soon!!")), context),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      menuContent(IconsService.aboutUs, "About Us",
                          Scaffold(body: Text("soon!!")), context),
                    ],
                  ),
                ],
              ),
            ),
            // menuContent(IconsService., "Internal Marks", InternalPage(), context),
          ],
        ),
      ),
    );
  }
}

// Widget menuContent(var icon, String string, Widget widget, var context) {
//   return InkWell(
//     onTap: () {
//       pushNewScreen(context, screen: widget);
//     },
//     child: Container(
//       margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//       child: Row(
//         children: <Widget>[
//           Icon(
//             icon,
//             color: Color.fromRGBO(128, 139, 151, 1),
//             size: 20.0,
//           ),
//           SizedBox(
//             width: 25,
//           ),
//           Text(string,
//               style: TextStyle(
//                   fontSize: 15,
//                   fontFamily: 'Rubik',
//                   color: Color.fromRGBO(128, 139, 151, 1),
//                   fontWeight: FontWeight.bold)),
//         ],
//       ),
//     ),
//   );
// }

Widget menuContent(var icon, String string, Widget widget, var context) {
  return Expanded(
    child: InkWell(
      onTap: () {
        pushNewScreen(context, screen: widget);
      },
      child: Container(
        //height: 100,
        // width: 140,
        decoration: BoxDecoration(boxShadow: [CardStyle.boxShadow]),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                icon,
                SizedBox(
                  height: 10,
                ),
                Text(string,
                    style: TextStyle(
                      fontSize: 15,
                      //fontFamily: 'Rubik',
                      // color: ,
                      //fontWeight: FontWeight.bold
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
