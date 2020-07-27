import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/result/presentation/externals/pages/external.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SerachBar extends StatefulWidget {
  final searchController = TextEditingController();
  @override
  _SerachBarState createState() => _SerachBarState();
}

class _SerachBarState extends State<SerachBar> {
  bool bar = false;
  void chanebar() {
    // operations to be performed
    // end of operations to be performed
    setState(() {
      if (bar == false) {
        bar = true;
      } else if (bar == true) {
        bar = false;
      }
    });
  }

  String enrollment = "empty";
  @override
  Widget build(BuildContext context) {
    if (bar) {
      return Container(
          // width: 320,
          //height: 20,
          padding: EdgeInsets.all(10.0),
          child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              if (enrollment.length == 11) {
                pushNewScreen(context,
                    screen: ExternalPage(enrollment: enrollment));
              } else
                print("not valid");
            },
            maxLength: 11,
            onChanged: (value) {
              if (value.length == 11) {
                enrollment = value;
              } else if (value.length != 11) {
                enrollment = "empty";
              }
              setState(() {});
            },
            //autocorrect: true,
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(maxWidth: 100),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      enrollment = "empty";
                      chanebar();
                      // do something
                    },
                  ),
                  enrollment.length == 11
                      ? IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            if (enrollment.length == 11) {
                              pushNewScreen(context,
                                  screen: ExternalPage(enrollment: enrollment));
                            } else
                              print("not valid");
                            // do something
                          },
                        )
                      : Container(),
                ],
              ),
              hintText: 'Enter Enrollment No. Here...',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blueGrey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blueGrey),
              ),
            ),
          ));
    } else
      return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Table(columnWidths: {
            0: FlexColumnWidth(8),
            1: FlexColumnWidth(1),
          }, children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: AutoSizeText(
                  "Student External Report",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: ResultCardStyle.headingTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  chanebar();
                  // do something
                },
              ),
            ])
          ]));
  }
}
