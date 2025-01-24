import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../atoms/artwork_image_widget.dart';
import '../atoms/content_padding_widget.dart';
import '../atoms/play_pause_icon_widget.dart';
import '../atoms/progress_bar_widget.dart';
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
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy < 0) {
          context.go('/player');
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProgressBarWidget(value: 0.5),
          Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArtworkImageWidget(path ?? ''),
                const ContentPaddingWidget(),
                const Expanded(
                  child: PlayingInfoColumnWidget(
                    artist: 'Long Artist Name Long Artist Name',
                    title: 'Long Title Name Long Title Name',
                  ),
                ),
                const ContentPaddingWidget(),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                const ContentPaddingWidget(),
                PlayPauseIconWidget(
                  onPressed: () {},
                  isPlaying: false,
                ),
                // const ContentPaddingWidget(),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
