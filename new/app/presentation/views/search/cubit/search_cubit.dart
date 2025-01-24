import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(TextEditingController(), FocusNode()));

  Future<void> search(String query) async {
    emit(SearchState(state.controller, state.focusNode, true));
    await Future.delayed(const Duration(seconds: 2));
    emit(SearchState(state.controller, state.focusNode, false));
  }

  void clear() {
    state.controller.clear();
    emit(SearchState(state.controller, state.focusNode));
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    state.focusNode.dispose();
    return super.close();
  }
}
