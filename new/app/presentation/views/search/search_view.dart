import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return Center(
      child: Text(l10n.search),
    );
  }
}
