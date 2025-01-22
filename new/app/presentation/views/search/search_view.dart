import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/l10n/retip_l10n.dart';
import 'cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: SearchBar(
              controller: state.controller,
              focusNode: state.focus,
            ),
          ),
          body: Center(
            child: Text(l10n.search),
          ),
        );
      },
    );
  }
}
