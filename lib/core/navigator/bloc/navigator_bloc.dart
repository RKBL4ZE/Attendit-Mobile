import 'dart:async';

import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'navigator_event.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;
  NavigatorBloc({this.navigatorKey});

  @override
  dynamic get initialState => 0;

  @override
  Stream<NavigatorState> mapEventToState(
    NavigatorEvent event,
  ) async* {
    if (event is NavigatorActionPop) {
      navigatorKey.currentState.pop();
    } else if (event is NavigateToHomeEvent) {
      navigatorKey.currentState.pushReplacementNamed('/navbar');
    } else if (event is NavigateToFullTimetableEvent) {
      navigatorKey.currentState
          .pushNamed('/fulltimetable', arguments: event.full);
    } else if (event is NavigatetoLoginEvent) {
		navigatorKey.currentState.pushReplacementNamed('/');
	}
  }
}
