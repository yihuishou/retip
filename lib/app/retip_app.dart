import 'package:flutter/material.dart';
import 'package:retip/core/logger/retip_logger.dart';

import '../core/router/retip_router.dart';
import '../core/theme/retip_theme.dart';

class RetipApp extends StatelessWidget {
  final RetipLogger logger;
  final RetipRouter router;
  final RetipTheme theme;

  const RetipApp({
    required this.logger,
    required this.router,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return logger.wrapper(
      child: MaterialApp.router(
        themeMode: ThemeMode.system,
        darkTheme: theme.dark,
        routerConfig: router,
        theme: theme.light,
      ),
    );
  }
}
