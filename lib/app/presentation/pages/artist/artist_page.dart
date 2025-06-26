import 'package:flutter/material.dart';

import 'artist_view.dart';

class ArtistPage extends StatelessWidget {
  final int artistId;

  const ArtistPage({required this.artistId, super.key});

  @override
  Widget build(BuildContext context) {
    return const ArtistView();
  }
}
