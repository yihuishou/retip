import 'package:flutter/material.dart';

import 'track_view.dart';

class TrackPage extends StatelessWidget {
  final int trackId;

  const TrackPage({required this.trackId, super.key});

  @override
  Widget build(BuildContext context) {
    return const TrackView();
  }
}
