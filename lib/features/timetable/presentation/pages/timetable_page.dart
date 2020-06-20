import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:Attendit/features/timetable/presentation/widgets/full_timetable.dart';
import 'package:Attendit/features/timetable/presentation/widgets/single_day_timetable.dart';
import 'package:Attendit/loaders/color_loader_3.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

class TimeTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimetableBloc>(
      create: (_) => getIt(),
      child: TimeTableWidget(),
    );
  }
}



class TimeTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    String date = DateFormat('EEEE').format(DateTime.now()).toLowerCase();

    BlocProvider.of<TimetableBloc>(context).add(GetTimeTableEvent());
    return (BlocBuilder<TimetableBloc, TimetableState>(
        bloc: BlocProvider.of<TimetableBloc>(context),
        builder: (context, state) {
          if (state is TimetableLoading) {
            // return Center(
            //   child: Text('Loading'),
            // );
            return Center(child: ColorLoader3());
          }
          if (state is TimetableLoaded) {
            final fulltimetable = state.timetable;

            final timetable = fulltimetable.toJson()[date];
            if (timetable == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('NO CLASSES TODAY')),
                  SizedBox(
                    height: 30,
                  ),
                  FullTimeTableButton(fulltimetable)
                ],
              );
            }
            return SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  SingleDayTimeTableWidget(timetable),
                  FullTimeTableButton(fulltimetable)
                ],
              ),
            );
          }
          if (state is TimetableError) {
            print(state);
            return Center(
              child: Text(state.message),
            );
          } else {
            return Text('Initial State');
          }
        }));
  }
}

class FullTimeTableButton extends StatelessWidget {
  final TimeTableModel fulltimetable;

  const FullTimeTableButton(this.fulltimetable);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      alignment: Alignment.bottomCenter,
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
           pushNewScreen(context, screen: FullTimeTablePage(fulltimetable: fulltimetable,));
          // Navigate to Full Timetable
          
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: Styles.colorGradientTheme,
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "View Full Time Table",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
