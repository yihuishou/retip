import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return Center(
      child: Text(l10n.profile),
    );
  }
}
