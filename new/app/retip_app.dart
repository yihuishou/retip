import 'package:flutter/material.dart';

import '../core/l10n/retip_l10n.dart';
import '../core/router/retip_router.dart';
import '../core/theme/retip_theme.dart';

class RetipApp extends StatelessWidget {
  const RetipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: RetipL10n.localizationsDelegates,
      supportedLocales: RetipL10n.supportedLocales,
      routerConfig: RetipRouter.router,
      darkTheme: RetipTheme.dark(),
      themeMode: ThemeMode.system,
      theme: RetipTheme.light(),
    );
  }
}
