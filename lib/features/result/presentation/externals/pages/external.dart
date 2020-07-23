import 'package:Attendit/features/result/presentation/bloc/result_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/sem_bloc.dart';
import 'package:Attendit/features/result/presentation/externals/widget/marksbysub_card.dart';
import 'package:Attendit/features/result/presentation/externals/widget/semesterselector.dart';
import 'package:Attendit/features/result/presentation/externals/widget/studentnamecard.dart';
import 'package:Attendit/features/result/presentation/externals/widget/sub_bar.dart';
import 'package:Attendit/features/result/presentation/externals/widget/subject_marks_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/injection/injection.dart';
import '../../../domain/entities/result.dart';

//import '../screens/Create_Property_screen.dart';
//import '../dummy_data.dart';
//import '../widgets/AllProperty_widget.dart';

class ExternalPage extends StatelessWidget {
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
        child: ExternalWidget(),
      ),
    );
  }
}

class ExternalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        if (state is ResultLoading)
          return Text('Loading');
        else if (state is ResultLoaded) {
          final data = state.resultData;
          int totalSem = 0;
          final Map<num, List<Subjects>> subjects = Map<num, List<Subjects>>();
          data.results.forEach((element) {
            if (element.exam.regularReappear == 'regular') {
              totalSem++;
              subjects[element.semYear.num] = element.subjects;
            }
            ;
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
