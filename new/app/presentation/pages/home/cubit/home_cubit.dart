import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit([PageController? controller])
      : super(HomeState(controller ?? PageController(), 'Home'));

  void goToPage(int value, String name) {
    state.controller.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    emit(HomeState(state.controller, name));
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    return super.close();
  }
}
