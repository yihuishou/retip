import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/l10n/retip_l10n.dart';
import '../core/router/retip_router.dart';
import '../core/theme/retip_theme.dart';
import 'presentation/pages/home/cubit/home_cubit.dart';
import 'presentation/views/search/cubit/search_cubit.dart';

class RetipApp extends StatelessWidget {
  const RetipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: MaterialApp.router(
        localizationsDelegates: RetipL10n.localizationsDelegates,
        supportedLocales: RetipL10n.supportedLocales,
        routerConfig: RetipRouter.router,
        darkTheme: RetipTheme.dark(),
        themeMode: ThemeMode.system,
        theme: RetipTheme.light(),
      ),
    );
  }
}
