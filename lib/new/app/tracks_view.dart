import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/library_bloc.dart';

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        if (state is LibraryIdleState) {
          return ListView.builder(
            itemCount: state.tracks.length,
            itemBuilder: (context, index) {
              final track = state.tracks[index];

              return ListTile(
                leading: const Icon(Icons.music_note),
                title: Text(track.title),
                subtitle: Text(track.artist ?? ''),
              );
            },
          );
        }

        return const Placeholder();
      },
    );
  }
}
