import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/result/presentation/bloc/sem_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../domain/entities/result.dart';

class PercentModel {
  final num percentage;
  final num creditPercentage;

  PercentModel(this.percentage, this.creditPercentage);
}

class TotalMarksBarWidget extends StatelessWidget {
  final ResultData data;

  final Map<num, PercentModel> scores = Map<num, PercentModel>();

  TotalMarksBarWidget(this.data) {
    data.results.forEach((element) {
      scores[element.semYear.num] =
          PercentModel(element.percentage, element.creditPercentage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double radius = 120;
    final double angle = 0;
    final double footersize = 20;

    final double insidefont = 30;

    return BlocBuilder<SemBloc, SemState>(
      builder: (context, state) {
        if (state is SemTapped) {
          final i = state.sem;
          return InkWell(
            //  onTap: () => selectProperty(context),
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircularPercentIndicator(
                    footer: Text(
                      "Percentage",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: footersize,
                          color: GraphStyle.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    startAngle: angle,
                    progressColor: GraphStyle.primary,
                    circularStrokeCap: CircularStrokeCap.round,
                    // arcType: ArcType.FULL,
                    // arcBackgroundColor: Colors.white,
                    animation: true,
                    backgroundColor: Colors.transparent,
                    animationDuration: 1000,
                    radius: radius,
                    lineWidth: 15.0,
                    percent: scores[i].percentage.toDouble() / 100,
                    //footer: Text("ve"),
                    center: new Text(
                      "${scores[i].percentage}%",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: insidefont,
                          color: GraphStyle.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    //progressColor: Color.fromRGBO(95, 197, 209, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircularPercentIndicator(
                    startAngle: angle,
                    progressColor: GraphStyle.primary,
                    circularStrokeCap: CircularStrokeCap.round,
                    // arcType: ArcType.FULL,
                    // arcBackgroundColor: Colors.white,
                    animation: true,
                    backgroundColor: Colors.transparent,
                    animationDuration: 1000,
                    radius: radius,
                    lineWidth: 15.0,
                    percent: scores[i].creditPercentage.toDouble() / 100,
                    footer: AutoSizeText(
                      "% with Credits",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: footersize,
                          color: GraphStyle.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    center: new Text(
                      "${scores[i].creditPercentage}%",
                      style: TextStyle(
                          // fontFamily: 'Rubik',
                          fontSize: insidefont,
                          color: GraphStyle.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    //progressColor: Color.fromRGBO(95, 197, 209, 1),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
