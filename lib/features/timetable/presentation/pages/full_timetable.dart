import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/presentation/bloc/bloc/timetable_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullTimeTablePage extends StatelessWidget {
  static const routeName = '/fulltimetable';

  @override
  Widget build(BuildContext context) {
    return FullTimetableWdiget();
  }
}

class FullTimetableWdiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TimetableBloc>(context),
      builder: (context, state) {
        if (state is TimetableLoading) {
          return Text('Loading');
        }
        if (state is TimetableError) {
          return Text('Error');
        }
        if (state is TimetableLoaded) {
          return Text(state.timetable.friday[0].subjectName);
        }
      }
    );
  }

}
