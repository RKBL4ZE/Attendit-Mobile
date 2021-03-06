import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'sem_event.dart';
part 'sem_state.dart';

@injectable
class SemBloc extends Bloc<SemEvent, SemState> {
  SemBloc() : super(SemTapped(1));

  @override
  Stream<SemState> mapEventToState(
    SemEvent event,
  ) async* {
    if (event is SelectSemEvent) {
      yield SemTapped(event.sem);
    }
  }
}
