import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';

import 'package:Attendit/features/timetable/presentation/widgets/timetable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TimeTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimetableBloc>(
      create: (_) => getIt(),
      child: TimeTableWidget(),
    );
  }
}

Widget buildContainer(Widget child, num length) {
  return Container(
    decoration: BoxDecoration(
        // color: Colors.white,
        // border: Border.all(color: Colors.grey),
        // borderRadius: BorderRadius.circular(10),
        ),
    margin: EdgeInsets.all(10),
    // padding: EdgeInsets.all(10),
    height: 140 * length.truncateToDouble(),
    width: double.infinity,
    child: child,
  );
}

String date = DateFormat('EEEE').format(DateTime.now()).toLowerCase();

class TimeTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TimetableBloc>(context).add(GetTimeTableEvent());
    return (SingleChildScrollView(
        child: Container(
      child: BlocBuilder<TimetableBloc, TimetableState>(
          bloc: BlocProvider.of<TimetableBloc>(context),
          builder: (context, state) {
            if (state is TimetableLoading) {
              return Center(
                child: Text('Loading'),
              );
            }
            if (state is TimetableLoaded) {
              final fulltimetable = state.timetable;
              //TODO: APPLY NULL CHECKING
              final timetable = state.timetable.toJson()[date];

              return SingleChildScrollView(
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text(timetable[0].time),

                      Container(
                        margin: new EdgeInsets.fromLTRB(0, 20, 0, 15),
                        child: Text("Today's Lectures",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // fontFamily: 'Rubik',

                                fontSize: 31,
                                fontFamily: 'Rubik',
                                color: Color.fromRGBO(46, 96, 102, 1),
                                fontWeight: FontWeight.bold)),
                      ),

                      buildContainer(
                          ListView.builder(
                            primary:
                                false, //physics: const NeverScrollableScrollPhysics()
                            itemBuilder: (ctx, index) => TimeTableCardWidget(
                              time: timetable[index].time,
                              facultyName: timetable[index].facultyName,
                              subjectName: timetable[index].subjectName,
                            ),
                            itemCount: timetable.length,
                          ),
                          timetable.length),

                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {

                            // Navigate to Full Timetable
                            BlocProvider.of<NavigatorBloc>(context).add(NavigateToFullTimetableEvent());

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(95, 197, 209, 1),
                                    Color.fromRGBO(152, 214, 217, 1)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "View Full Time Table",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //FullTimeTableWidget(timetable: fulltimetable),
                    ]),
              );
            }
            if (state is TimetableError) {
              print(state);
              return Center(
                child: Text(state.message),
              );
            }
            return Center(
              child: Text('Initial'),
            );
          }),
    )));
  }
}
