part of 'home_cubit.dart';

@immutable
class HomeState {
  final PageController controller;
  final int index;

  HomeState({
    this.index = 0,
  }) : controller = PageController(initialPage: index);

  HomeState copyWith({
    int? index,
  }) {
    return HomeState(
      index: index ?? this.index,
    );
  }
}
