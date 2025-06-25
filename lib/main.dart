import 'package:flutter/material.dart';

import 'app/retip_app.dart';
import 'core/logger/retip_logger.dart';
import 'core/router/retip_router.dart';
import 'core/theme/retip_theme.dart';
import 'core/utils/run_mode.dart';

void main() {
  final logger = RetipLogger();
  final router = RetipRouter(observers: [logger.navigatorObserver]);
  final theme = RetipTheme();

  final app = RetipApp(logger: logger, router: router, theme: theme);

  logger.info('App started in ${RunMode.name} mode');
  runApp(app);
}
