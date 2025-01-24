import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';
import '../../widgets/atoms/retip_icon_widget.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Center(
          child: RetipIconWidget(),
        ),
        title: Text(l10n.start),
      ),
    );
  }
}
