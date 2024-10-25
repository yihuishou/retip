import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:retip/app/views/home/pages/artist/artist_page.dart';
import 'package:retip/app/widgets/artwork_widget.dart';
import 'package:retip/core/l10n/retip_l10n.dart';

import 'abstract_entity.dart';
import 'album_entity.dart';

abstract class ArtistEntity extends AbstractEntity {
  final String name;
  final Uint8List? artwork;
  final List<AlbumEntity> albums;

  ArtistEntity({
    required this.name,
    required this.artwork,
    required this.albums,
  });

  @override
  String toString() {
    return name;
  }

  @override
  String toTypeString(BuildContext context) {
    return RetipL10n.of(context).artists;
  }

  @override
  ListTile toListTile(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: const Text(''),
      leading: artwork != null
          ? ArtworkWidget(
              bytes: artwork,
              style: ArtworkStyle.circle,
            )
          : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ArtistPage(artist: this);
            },
          ),
        );
      },
    );
  }
}
