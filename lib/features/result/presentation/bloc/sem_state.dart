part of 'sem_bloc.dart';

abstract class SemState {
  const SemState();
}

class SemTapped extends SemState {
  final num sem;

  SemTapped(this.sem);
}
