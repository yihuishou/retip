import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/home_page.dart';

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
            bottomSheet: Container(
              color: Colors.green,
              height: 50,
            ),
            bottomNavigationBar: Container(
              color: Colors.blue,
              height: 50,
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
