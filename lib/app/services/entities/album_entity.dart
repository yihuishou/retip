import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:retip/app/views/home/pages/album/album_page.dart';
import 'package:retip/app/widgets/artwork_widget.dart';

import 'abstract_entity.dart';
import 'track_entity.dart';

abstract class AlbumEntity extends AbstractEntity {
  final String title;
  final String artist;
  final Uint8List? artwork;

  final List<TrackEntity> tracks;

  AlbumEntity({
    required this.title,
    required this.artist,
    required this.artwork,
    required this.tracks,
  });

  @override
  String toString() {
    return title;
  }

  @override
  ListTile toListTile(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(artist),
      leading: artwork != null ? ArtworkWidget(bytes: artwork) : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AlbumPage(album: this);
            },
          ),
        );
      },
    );
  }
}
