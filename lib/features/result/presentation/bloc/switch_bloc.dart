import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

@injectable
class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchTapped(false));

  @override
  Stream<SwitchState> mapEventToState(
    SwitchEvent event,
  ) async* {
    if (event is TapSwitchEvent) {
      yield SwitchTapped(event.isTapped);
    }
  }
}
