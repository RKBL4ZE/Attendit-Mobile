import 'package:Attendit/features/result/presentation/bloc/rank_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/result_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/sem_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/switch_bloc.dart';
import 'package:Attendit/features/result/presentation/externals/widget/semesterselector.dart';
import 'package:Attendit/features/result/presentation/externals/widget/studentnamecard.dart';
import 'package:Attendit/features/result/presentation/externals/widget/sub_bar.dart';
import 'package:Attendit/features/result/presentation/externals/widget/subject_marks_list.dart';
import 'package:Attendit/features/result/presentation/rank_list/pages/rank_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../../../config/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/injection/injection.dart';
import '../../../domain/entities/result.dart';

//import '../screens/Create_Property_screen.dart';
//import '../dummy_data.dart';
//import '../widgets/AllProperty_widget.dart';

class ExternalPage extends StatelessWidget {
  final String enrollment;

  const ExternalPage({this.enrollment});
  // static const routeName = '/InternalSCREEN';
  @override
  Widget build(BuildContext context) {
    // final prop = Dummy_AllPropertys.toList();

    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ResultBloc>(create: (_) => getIt()),
          BlocProvider<SemBloc>(create: (_) => getIt())
        ],
        child: ExternalPageWidget(
          enrollment: enrollment,
        ),
      ),
    );
  }
}

class ExternalPageWidget extends StatelessWidget {
  final String enrollment;

  const ExternalPageWidget({this.enrollment});
  @override
  Widget build(BuildContext context) {
    return ExternalWidget(
      enrollment: enrollment,
      bloc: BlocProvider.of<ResultBloc>(context),
    );
  }
}

class ExternalWidget extends StatelessWidget {
  final String enrollment;
  final ResultBloc bloc;

  ExternalWidget({
    this.enrollment,
    this.bloc,
  }) {
    bloc.add(GetResultEvent(enrollment: enrollment));
  }
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final semBloc = BlocProvider.of<SemBloc>(context);
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        if (state is ResultLoading)
          return loaderWidget;
        else if (state is ResultLoaded) {
          final data = state.resultData;
          int totalSem = 0;
          final Map<num, List<Subjects>> subjects = Map<num, List<Subjects>>();
          data.results.forEach((element) {
            if (element.exam.regularReappear == 'regular') {
              totalSem++;
              subjects[element.semYear.num] = element.subjects;
            }
          });
          return SingleChildScrollView(
            child: Container(
              padding: PrimaryStyle.padding,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "Student External Report",
                      textAlign: TextAlign.center,
                      style: ResultCardStyle.headingTextStyle,
                    ),
                  ),
                  StudentNameCard(
                      name: data.name,
                      enrollmentno: data.rollNumber,
                      course: 'BCA',
                      // sclass: "Bca 106",
                      // shift: "Morning",
                      cgpa: "4.99",
                      sgpa: "6.49"),
                  TotalMarksBarWidget(state.resultData),
                  SemSelect(totalSem: totalSem),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SemBloc, SemState>(
                    builder: (context, state) {
                      if (state is SemTapped) {
                        return SubjectMarksList(
                          subjects: subjects[state.sem],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 15, 70, 15),
                    //alignment: Alignment.bottomCenter,
                    height: 45.0,
                    child: RaisedButton(
                      shape: LectureCardStyle.shape,
                      color: LectureCardStyle.buttonColor,
                      onPressed: () {
                        pushNewScreen(context,
                            screen: MultiBlocProvider(
                              child: BlocBuilder<SemBloc, SemState>(
                                  bloc: semBloc,
                                  builder: (context, state) {
                                    final SemTapped currentState = state;
                                    return RankList(
                                      semester: currentState.sem,
                                      data: data,
                                      key: UniqueKey(),
                                    );
                                  }),
                              providers: [
                                BlocProvider<RankBloc>(
                                  create: (_) => getIt(),
                                ),
                                BlocProvider<SwitchBloc>(
                                  create: (_) => getIt(),
                                ),
                              ],
                            ));
                      },
                      /* shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)), */
                      child: Container(
                        //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "View Ranks",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else
          return Container();
      },
    );
  }
}
