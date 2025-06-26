import 'package:flutter/material.dart';

import 'album_view.dart';

class AlbumPage extends StatelessWidget {
  final int albumId;

  const AlbumPage({required this.albumId, super.key});

  @override
  Widget build(BuildContext context) {
    return const AlbumView();
  }
}
