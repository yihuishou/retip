import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/molecules/media_tile_widget.dart';
import '../../widgets/molecules/search_bar_widget.dart';
import 'cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SearchBarWidget(
                  controller: state.controller,
                  focusNode: state.focusNode,
                ),
              ),
              state.isSearching
                  ? const LinearProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return const MediaTileWidget();
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
