import 'package:flutter/material.dart';

import 'app/retip_app.dart';
import 'core/theme/retip_theme.dart';

void main() {
  final theme = RetipTheme();

  final app = RetipApp(theme: theme);

  runApp(app);
}
