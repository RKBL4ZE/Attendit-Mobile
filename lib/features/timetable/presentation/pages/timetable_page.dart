import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:Attendit/features/timetable/presentation/widgets/full_timetable.dart';
import 'package:Attendit/features/timetable/presentation/widgets/single_day_timetable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
    String currentDay = DateFormat('EEEE').format(DateTime.now()).toLowerCase();

    // BlocProvider.of<TimetableBloc>(context).add(GetTimeTableEvent());
    return (BlocBuilder<TimetableBloc, TimetableState>(
        bloc: BlocProvider.of<TimetableBloc>(context),
        builder: (context, state) {
          if (state is TimetableLoading) {
            return loaderWidget;
          }
          if (state is TimetableLoaded) {
            final group = state.group;

            final timetable =
                _currentDayTimetable(currentDay, group, 0); // to be change
            if (timetable == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('NO CLASSES TODAY')),
                  SizedBox(
                    height: 30,
                  ),
                  FullTimeTableButton(group)
                ],
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SingleDayTimeTableWidget(timetable),
                  FullTimeTableButton(group)
                ],
              ),
            );
          }
          if (state is TimetableError) {
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
  final List<GroupModel> group;

  const FullTimeTableButton(this.group);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      alignment: Alignment.bottomCenter,
      height: 50.0,
      child: RaisedButton(
        onPressed: () {
          pushNewScreen(context,
              screen: FullTimeTablePage(
                group: group,
              ));
          // Navigate to Full Timetable
        },
        /* shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)), */
        child: Ink(
          
          child: Container(
            //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "View Full Time Table",
              textAlign: TextAlign.center,
              
            ),
          ),
        ),
      ),
    );
  }
}

List<Timing> _currentDayTimetable(String day, List<Group> group, int index) {
  switch (day) {
    case "monday":
      {
        return group[index].timetable.monday;
      }
    case "tuesday":
      {
        return group[index].timetable.tuesday;
      }
    case "wednesday":
      {
        return group[index].timetable.wednesday;
      }
    case "thursday":
      {
        return group[index].timetable.thursday;
      }
    case "friday":
      {
        return group[index].timetable.friday;
      }
    case "saturday":
      {
        return group[index].timetable.saturday;
      }
      default:
      {
        return group[index].timetable.monday;
      }
      /* sunday kya kare nakuri chod de????? */
    // case "sunday":
    //   {
    //     return group[index].timetable.sunday;
    //   }
  }
}
