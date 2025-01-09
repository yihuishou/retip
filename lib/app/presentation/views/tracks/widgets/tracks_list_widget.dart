import 'package:flutter/material.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';
import 'package:retip/app/presentation/widgets/artwork_widget.dart';
import 'package:retip/app/presentation/widgets/rp_icon_button.dart';
import 'package:retip/app/presentation/widgets/rp_list_tile.dart';
import 'package:retip/app/presentation/widgets/rp_text.dart';
import 'package:retip/core/utils/sizer.dart';

class TracksListWidget extends StatelessWidget {
  final List<TrackEntityBack> tracks;
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
            child: ArtworkWidget(
              bytes: track.artwork,
              borderWidth: 1,
            ),
          ),
          title: RpText(track.title),
          subtitle: RpText(track.artist),
          onTap: () => onTap?.call(index),
          trailing: const RpIconButton(icon: Icons.more_vert),
        );
      },
    );
  }
}
