import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:Attendit/features/timetable/presentation/widgets/full_timetable.dart';
import 'package:Attendit/features/timetable/presentation/widgets/single_day_timetable.dart';

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

String date = DateFormat('EEEE').format(DateTime.now()).toLowerCase();

class TimeTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TimetableBloc>(context).add(GetTimeTableEvent());
    return (BlocBuilder<TimetableBloc, TimetableState>(
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
            final timetable = fulltimetable.toJson()[date];
            return SingleDayTimeTableWidget(timetable, fulltimetable);
          }
          if (state is FullTimetableLoaded) {
            final fulltimetable = state.full;
            return FullTimeTableWidget(fulltimetable);
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
        }));
  }
}
