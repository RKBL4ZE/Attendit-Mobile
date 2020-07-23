part of 'sem_bloc.dart';

abstract class SemEvent {
  const SemEvent();
}

class SelectSemEvent extends SemEvent {
  final num sem;

  SelectSemEvent(this.sem);
}
