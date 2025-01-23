import 'dart:io';

import 'package:flutter/material.dart';

class ArtworkAtom extends StatelessWidget {
  final String? path;
  final double dimension;

  const ArtworkAtom.small({
    this.path,
    super.key,
  }) : dimension = 40;

  const ArtworkAtom.medium({
    this.path,
    super.key,
  }) : dimension = 80;

  const ArtworkAtom.big({
    this.path,
    super.key,
  }) : dimension = 160;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: Image.file(
        File(path ?? ''),
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.music_note);
        },
      ),
    );
  }
}
