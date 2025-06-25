import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/home_page.dart';

class RetipRouter extends GoRouter {
  final List<NavigatorObserver>? observers;

  RetipRouter({this.observers})
    : super.routingConfig(
        observers: observers,
        initialLocation: '/',
        routingConfig: ValueNotifier(
          RoutingConfig(
            routes: [
              GoRoute(path: '/', builder: (context, state) => HomePage()),
            ],
          ),
        ),
      );
}
