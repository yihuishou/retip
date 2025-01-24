part of 'home_cubit.dart';

@immutable
class HomeState {
  final PageController controller;
  final String name;
  final int index;

  const HomeState(this.controller, this.name, [this.index = 0]);
}
