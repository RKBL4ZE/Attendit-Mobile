import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:Attendit/features/result/presentation/bloc/rank_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/switch_bloc.dart';
import 'package:Attendit/features/result/presentation/rank_list/widget/rank_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankList extends StatelessWidget {
  final ResultData data;

  const RankList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RankListPage(BlocProvider.of<RankBloc>(context), data);
  }
}

class RankListPage extends StatelessWidget {
  final RankBloc bloc;
  final ResultData data;

  RankListPage(this.bloc, this.data) {
    bloc.add(GetRankListEvent(
        takenFrom: data.results[0].fileId,
        batch: data.batch,
        institutionCode: data.institution.code,
        limit: 50,
        offset: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, switchState) {
          if (switchState is SwitchTapped) {
            return BlocListener<RankBloc, RankState>(
              listener: (context, state) {
                if (state is RankListError) {
                  print(state.message);
                }
              },
              child: BlocBuilder<RankBloc, RankState>(
                builder: (context, state) {
                  if (state is RankListLoading) {
                    return loaderWidget;
                  } else if (state is RankListLoaded) {
                    final ranks =
                        switchState.isTapped ? state.uRankList : state.rankList;
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Switch(
                                  value: switchState.isTapped,
                                  onChanged: (value) {
                                    BlocProvider.of<SwitchBloc>(context)
                                        .add(TapSwitchEvent(value));
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                )
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: double.infinity),
                            child: ListView.builder(
                              itemCount: ranks.length,
                              itemBuilder: (context, index) {
                                return RankListCard(
                                  clgName: ranks[index].institution.name,
                                  studentName: ranks[index].name,
                                  rank: switchState.isTapped
                                      ? ranks[index].universityRank
                                      : ranks[index].collegeRank,
                                  percentage: ranks[index].marks.toString(),
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
