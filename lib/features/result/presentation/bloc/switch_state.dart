part of 'switch_bloc.dart';

abstract class SwitchState {}

class SwitchTapped extends SwitchState {
  final bool isTapped;

  SwitchTapped(this.isTapped);
}
