import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';
import 'package:retip/app/presentation/widgets/more/more_icon.dart';

import '../../widgets/artwork_widget_new.dart';
import '../../widgets/rp_list_tile.dart';
import '../../widgets/rp_text.dart';
import 'widgets/tracks_empty_widget.dart';

class TracksView extends StatelessWidget {
  const TracksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<TracksBloc>();

    return StreamBuilder(
      stream: context.read<LibraryRepository>().tracksStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.requireData.length,
            itemBuilder: (context, index) {
              final track = snapshot.requireData[index];

              return RpListTile(
                leading: ArtworkWidget(track.artwork),
                title: RpText(track.title),
                subtitle: track.artist != null ? RpText(track.artist!) : null,
                trailing: MoreIcon.vertical(
                  title: track.title,
                ),
                onTap: () {},
              );
            },
          );
        }

        return const TracksEmptyWidget();
      },
    );

    // return BlocBuilder<TracksBloc, TracksState>(
    //   builder: (context, state) {
    //     if (state.tracks.isNotEmpty) {
    //       return RefreshIndicator(
    //         onRefresh: () async {
    //           final stream = bloc.stream.first;
    //           bloc.add(FetchTracksEvent());

    //           await stream;
    //         },
    //         child: TracksListWidget(
    //           onTap: (index) => bloc.add(PlayTracksEvent(index: index)),
    //           tracks: state.tracks,
    //         ),
    //       );
    //     }

    //     return const TracksEmptyWidget();
    //   },
    // );
  }
}
