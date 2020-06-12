import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/home/presentation/bloc/home_bloc.dart';
import 'package:Attendit/features/home/presentation/widgets/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => getIt(),
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final _bloc = BlocProvider.of<HomeBloc>(context);
    _bloc.add(GetDetailsEvent());
    return SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: BlocBuilder<HomeBloc, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is DetailsLoading) {
            return Center(
              child: Text('Loading'),
            );
          }
          if (state is DetailsLoaded) {
            final student = state.studentDetails;
            print(state);
            return Column(
            children: <Widget>[
              StudentProfileWidget(
                enrollmentno: state.studentDetails.enrollment,
                othrdetail: "${student.semesterName} Section-${student.section}",
                studentimg:
                    student.profilePicture,
                studentname: student.name,
              ),
              
            ],
          );
          }
          if (state is DetailsError) {
            print(state);
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text('Initial'),
          );
        },
      ),
      
          ) );
  }
}
