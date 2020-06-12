import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('LOL'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is DetailsLoading) {
            return Center(
              child: Text('Loading'),
            );
          }
          if (state is DetailsLoaded) {
            print(state);
            return Center(
              child: Text(state.studentDetails.name),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.bloc<HomeBloc>().add(GetDetailsEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
