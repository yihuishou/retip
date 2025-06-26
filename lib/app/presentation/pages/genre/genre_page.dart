import 'package:flutter/material.dart';

import 'genre_view.dart';

class GenrePage extends StatelessWidget {
  final int genreId;

  const GenrePage({required this.genreId, super.key});

  @override
  Widget build(BuildContext context) {
    return const GenreView();
  }
}
