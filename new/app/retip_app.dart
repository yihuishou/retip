import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/router/retip_router.dart';

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
    return MultiRepositoryProvider(
      providers: repositories.map((repository) {
        return RepositoryProvider(create: (_) => repository);
      }).toList(),
      child: MultiBlocProvider(
        providers: blocs.map((bloc) {
          return BlocProvider(create: (_) => bloc);
        }).toList(),
        child: MaterialApp.router(
          routerConfig: RetipRouter.router,
        ),
      ),
    );
  }
}
