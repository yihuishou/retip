import 'package:flutter/material.dart';

import '../atoms/artwork_image_widget.dart';
import '../atoms/content_padding_widget.dart';
import '../atoms/play_pause_icon_widget.dart';
import '../molecules/playing_info_column_widget.dart';

class PlayerWidget extends StatelessWidget {
  final String? artist;
  final String? title;
  final String? path;

  const PlayerWidget({
    this.artist,
    this.title,
    this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArtworkImageWidget(path ?? ''),
          const ContentPaddingWidget(),
          Expanded(
            child: PlayingInfoColumnWidget(
              artist: artist,
              title: title,
            ),
          ),
          const ContentPaddingWidget(),
          const PlayPauseIconWidget(),
        ],
      ),
    );
  }
}
