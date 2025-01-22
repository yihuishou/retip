import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/home/home_page.dart';

mixin RetipRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
