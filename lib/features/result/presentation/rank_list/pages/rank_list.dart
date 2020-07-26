import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/result/domain/entities/result.dart';
import 'package:Attendit/features/result/presentation/bloc/rank_bloc.dart';
import 'package:Attendit/features/result/presentation/bloc/switch_bloc.dart';
import 'package:Attendit/features/result/presentation/rank_list/widget/rank_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankList extends StatelessWidget {
  final int semester;
  final ResultData data;

  const RankList({Key key, this.data, this.semester}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RankListPage(BlocProvider.of<RankBloc>(context), data, semester);
  }
}

class RankListPage extends StatefulWidget {
  final int semester;
  final RankBloc bloc;
  final ResultData data;

  RankListPage(this.bloc, this.data, this.semester);

  @override
  _RankListPageState createState() => _RankListPageState(bloc, data, semester);
}

class _RankListPageState extends State<RankListPage> {
  final int semester;
  final RankBloc bloc;
  final ResultData data;
  final _scrollController = ScrollController();
  final _scrollThreshold = 400.0;

  _RankListPageState(this.bloc, this.data, this.semester) {
    _scrollController.addListener(_onScroll);
    bloc.add(GetRankListEvent(
      takenFrom: data.results[semester - 1].fileId,
      batch: data.batch,
      institutionCode: data.institution.code,
    ));
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
                      controller: _scrollController,
                      physics: ScrollPhysics(),
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
                              itemCount: ranks.length + 1,
                              itemBuilder: (context, index) {
                                if (index == ranks.length) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CupertinoActivityIndicator(
                                          radius: 15, animating: true),
                                    ),
                                  );
                                }
                                return RankListCard(
                                  rollNumber: ranks[index].rollNumber,
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
                              //   primary: false,
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      print('Scroll Detected');
      bloc.add(GetRankListEvent(
        takenFrom: data.results[0].fileId,
        batch: data.batch,
        institutionCode: data.institution.code,
      ));
    }
  }
}
