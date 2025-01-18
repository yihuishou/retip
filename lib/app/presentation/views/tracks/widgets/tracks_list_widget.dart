import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:retip/app/data/providers/objectbox_provider.dart';
import 'package:retip/app/presentation/widgets/rp_icon_button.dart';
import 'package:retip/app/presentation/widgets/rp_list_tile.dart';
import 'package:retip/app/presentation/widgets/rp_text.dart';
import 'package:retip/core/utils/sizer.dart';

import '../../../../data/models/track_model.dart';

class TracksListWidget extends StatelessWidget {
  final List<Track> tracks;
  final void Function(int index)? onTap;

  const TracksListWidget({
    required this.tracks,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.normal,
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final track = tracks[index];

        return RpListTile(
          leading: SizedBox.square(
            dimension: Sizer.x5,
            child: track.artwork != null
                ? Image.file(File(track.artwork!))
                : const Icon(Icons.music_note),
            // child: ArtworkWidget(
            //   bytes: null,
            //   borderWidth: 1,
            // ),
          ),
          title: RpText(track.title),
          subtitle: RpText('${track.artist} • ${track.album}'),
          onTap: () {
            track.isFavorite = !track.isFavorite;
            final store = GetIt.I.get<Store>();
            final ob = ObjectboxProvider<Track>(store);
            ob.update(track);
            onTap?.call(index);
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(track.isFavorite ? Icons.favorite : Icons.favorite_outline),
              const RpIconButton(icon: Icons.more_vert),
            ],
          ),
        );
      },
    );
  }
}
