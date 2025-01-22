import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/home_page.dart';
import '../../app/presentation/widgets/navigation_widget.dart';

mixin RetipRouter {
  static final rootNavKey = GlobalKey<NavigatorState>();
  static final shellNavKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: shellNavKey,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
        ],
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const NavigationWidget(),
          );
        },
      ),
    ],
  );
}
