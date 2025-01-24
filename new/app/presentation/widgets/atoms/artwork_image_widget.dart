import 'dart:io';

import 'package:flutter/material.dart';

class ArtworkImageWidget extends StatelessWidget {
  final String path;

  const ArtworkImageWidget(
    this.path, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Image.file(
        fit: BoxFit.cover,
        cacheWidth: 40 * 4,
        cacheHeight: 40 * 4,
        File(''),
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.music_note);
        },
      ),
    );
  }
}
