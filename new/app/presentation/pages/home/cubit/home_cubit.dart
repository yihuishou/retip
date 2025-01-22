import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void changeIndex(int index, {bool batterySaver = false}) {
    if (batterySaver) {
      state.controller.jumpToPage(index);
    } else {
      state.controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    }
    emit(state.copyWith(index: index));
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    return super.close();
  }
}
