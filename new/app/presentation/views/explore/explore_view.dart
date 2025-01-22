import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return Center(
      child: Text(l10n.explore),
    );
  }
}
