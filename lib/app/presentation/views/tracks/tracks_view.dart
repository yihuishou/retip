import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';
import 'package:retip/app/presentation/widgets/rp_icon_button.dart';

// import 'bloc/tracks_bloc.dart';
import '../../../../core/utils/sizer.dart';
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
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizer.x0_5),
                  child: Image.file(
                    fit: BoxFit.cover,
                    width: Sizer.x5,
                    height: Sizer.x5,
                    cacheHeight: 4 * Sizer.x5.toInt(),
                    cacheWidth: 4 * Sizer.x5.toInt(),
                    File(track.artwork!),
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }

                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: frame == null ? 0 : 1,
                        child: child,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.music_note);
                    },
                  ),
                ),
                title: RpText(track.title),
                subtitle: RpText(track.artist ?? ''),
                trailing: RpIconButton(
                  icon: Icons.more_vert,
                  onPressed: () {},
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
