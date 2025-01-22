import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  void focus() {
    state.focus.unfocus();
    state.focus.requestFocus();
  }
}
