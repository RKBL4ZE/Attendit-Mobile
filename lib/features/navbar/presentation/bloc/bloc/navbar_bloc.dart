import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  @override
  NavbarState get initialState => NavbarInitial();

  @override
  Stream<NavbarState> mapEventToState(
    NavbarEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
