part of 'search_cubit.dart';

@immutable
class SearchState {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isSearching;

  const SearchState(this.controller, this.focusNode,
      [this.isSearching = false]);
}
