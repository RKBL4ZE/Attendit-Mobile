import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  BottomNavigationState([List props = const []]);
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : super([currentIndex]);

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';

  @override
  List<Object> get props => [currentIndex];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';

  @override
  List<Object> get props => [];
}

class FirstPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'FirstPageLoaded';

  @override
  List<Object> get props => [];
}

class SecondPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'SecondPageLoaded';

  @override
  List<Object> get props => [];
}
