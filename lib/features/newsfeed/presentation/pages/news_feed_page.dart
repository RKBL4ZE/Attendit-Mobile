import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:Attendit/features/newsfeed/presentation/bloc/newsfeed_bloc.dart';
import 'package:Attendit/features/newsfeed/presentation/widgets/news_feed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeedPage extends StatelessWidget {
  NewsFeedPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsfeedBloc>(
      create: (_) => getIt(),
      child: NewsFeedWidget(),
    );
  }
}

Widget buildNewsFeed(List<NewsFeed> newsFeed) {
  return ListView.builder(
    primary: false, //physics: const NeverScrollableScrollPhysics()
    itemBuilder: (ctx, index) => NewsFeedCard(newsFeed: newsFeed[index]),

    itemCount: newsFeed.length,
  );
}

class NewsFeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsfeedBloc>(context).add(GetNewsfeedEvent());
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: BlocBuilder<NewsfeedBloc, NewsfeedState>(
          cubit: BlocProvider.of<NewsfeedBloc>(context),
          builder: (context, state) {
            if (state is NewsfeedLoading) {
              return loaderWidget;
            } else if (state is NewsfeedLoaded) {
              // final double sheight = MediaQuery.of(context).size.height;
              return Container(
                  child: Scaffold(
                body: buildNewsFeed(state.newsfeed),
                // floatingActionButton: MyFloatingActionButton(sheight: sheight),
              ));
            } else if (state is NewsfeedError) {
              return Center(
                child: Text(state.message),
              );
            } else
              return Container();
          }),
    );
  }
}
