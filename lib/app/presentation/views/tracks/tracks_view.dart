import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retip/core/l10n/retip_l10n.dart';

import 'bloc/tracks_bloc.dart';
import 'widgets/buttons/sort_tracks_button.dart';
import 'widgets/tracks_empty_widget.dart';
import 'widgets/tracks_list_widget.dart';

class TracksView extends StatelessWidget {
  const TracksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);
    final bloc = context.read<TracksBloc>();

    return BlocBuilder<TracksBloc, TracksState>(
      builder: (context, state) {
        if (state.tracks.isNotEmpty) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${l10n.tracks} (${state.tracks.length})'),
                  const SortTracksButton(),
                ],
              ),
              Expanded(
                child: TracksListWidget(
                  onTap: (index) {
                    bloc.add(PlayTracksEvent(index: index));
                  },
                  tracks: state.tracks,
                ),
              ),
            ],
          );
        }

        return const TracksEmptyWidget();
      },
    );
  }
}
