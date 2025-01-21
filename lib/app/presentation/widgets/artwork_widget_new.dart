import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/utils/sizer.dart';

class ArtworkWidget extends StatelessWidget {
  final String? path;

  const ArtworkWidget(
    this.path, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizer.x0_5),
      child: Image.file(
        fit: BoxFit.cover,
        width: Sizer.x5,
        height: Sizer.x5,
        cacheHeight: 4 * Sizer.x5.toInt(),
        cacheWidth: 4 * Sizer.x5.toInt(),
        File(path ?? ''),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: frame == null ? 0 : 1,
            child: child,
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Theme.of(context).colorScheme.surfaceContainer,
            width: Sizer.x5,
            height: Sizer.x5,
            child: const Icon(Icons.music_note),
          );
        },
      ),
    );
  }
}
