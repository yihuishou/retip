import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';

import 'bloc/library_bloc.dart';
import 'library_repository.dart';
import 'objectbox_provider.dart';
import 'on_audio_query_provider.dart';
import 'track_model.dart';
import 'tracks_view.dart';

class RetipApp extends StatelessWidget {
  const RetipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LibraryRepository(
            onAudioQueryProvider: OnAudioQueryProvider(),
            objectboxProvider: ObjectboxProvider(
              GetIt.I<Store>().box<TrackModel>(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => LibraryBloc(
              libraryRepository: context.read<LibraryRepository>(),
            ),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(body: TracksView()),
        ),
      ),
    );
  }
}
