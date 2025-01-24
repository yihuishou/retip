import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/cubit/home_cubit.dart';
import '../../app/presentation/pages/home/home_page.dart';
import '../../app/presentation/widgets/organisms/bottom_mini_player_widget.dart';
import '../../app/presentation/widgets/organisms/bottom_navigation_widget.dart';

mixin RetipRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();
  static final shellNavKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: shellNavKey,
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomSheet: const PlayerWidget(),
            bottomNavigationBar: BottomNavigationWidget(
              onTap: (value, name) {
                final bloc = context.read<HomeCubit?>();
                bloc?.goToPage(value, name);
              },
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
}
