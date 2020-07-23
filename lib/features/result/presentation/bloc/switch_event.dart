part of 'switch_bloc.dart';

abstract class SwitchEvent {}


class TapSwitchEvent extends SwitchEvent {
  final bool isTapped;

  TapSwitchEvent(this.isTapped);
}
