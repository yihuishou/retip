import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retip/core/utils/debouncer.dart';

import '../../../../core/l10n/retip_l10n.dart';
import '../../views/search/cubit/search_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const SearchBarWidget({
    this.controller,
    this.focusNode,
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return SearchBar(
      hintText: l10n.searchForMusic,
      controller: widget.controller,
      focusNode: widget.focusNode,
      leading: const IconButton(onPressed: null, icon: Icon(Icons.search)),
      onTapOutside: (event) {
        widget.focusNode?.unfocus();
      },
      onChanged: (value) {
        final cubit = context.read<SearchCubit>();
        setState(() {});

        Debouncer(const Duration(milliseconds: 500)).run(() {
          cubit.search(value);
        });
      },
      trailing: widget.controller?.text.isNotEmpty == true
          ? [
              IconButton(
                onPressed: () {
                  widget.controller?.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.close),
              ),
            ]
          : [
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.mic),
              )
            ],
    );
  }
}
