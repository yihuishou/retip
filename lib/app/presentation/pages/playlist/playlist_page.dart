import 'package:flutter/material.dart';

import 'playlist_view.dart';

class PlaylistPage extends StatelessWidget {
  final int playlistId;

  const PlaylistPage({required this.playlistId, super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaylistView();
  }
}
