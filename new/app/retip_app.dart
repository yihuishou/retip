import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/l10n/retip_l10n.dart';
import '../core/router/retip_router.dart';
import '../core/theme/retip_theme.dart';
import 'presentation/pages/home/cubit/home_cubit.dart';

class RetipApp extends StatelessWidget {
  final List<Object> repositories;
  final List<Bloc> blocs;

  const RetipApp({
    this.repositories = const [],
    this.blocs = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: MaterialApp.router(
        localizationsDelegates: RetipL10n.localizationsDelegates,
        highContrastDarkTheme: RetipTheme.contrastDark,
        supportedLocales: RetipL10n.supportedLocales,
        highContrastTheme: RetipTheme.contrastLight,
        routerConfig: RetipRouter.router,
        themeMode: ThemeMode.system,
        darkTheme: RetipTheme.dark,
        theme: RetipTheme.light,
      ),
    );
  }
}
