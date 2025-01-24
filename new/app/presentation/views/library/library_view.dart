import 'package:flutter/material.dart';

import '../../widgets/molecules/media_tile_widget.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return const MediaTileWidget();
        },
      ),
    );
  }
}
