import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/home_page.dart';
import '../../app/presentation/pages/library/library_page.dart';
import '../../app/presentation/pages/search/search_page.dart';
import '../../app/presentation/widgets/bottom_navigation_widget.dart';

class RetipRouter extends GoRouter {
  final List<NavigatorObserver>? observers;

  RetipRouter({this.observers})
    : super.routingConfig(
        observers: observers,
        initialLocation: '/',
        routingConfig: ValueNotifier(
          RoutingConfig(
            routes: [
              ShellRoute(
                builder: (context, state, child) {
                  return Scaffold(
                    body: child,
                    bottomNavigationBar: BottomNavigationWidget(),
                  );
                },
                routes: [
                  GoRoute(path: '/', builder: (context, state) => HomePage()),
                  GoRoute(
                    path: '/library',
                    builder: (context, state) => LibraryPage(),
                  ),
                  GoRoute(
                    path: '/search',
                    builder: (context, state) => SearchPage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
