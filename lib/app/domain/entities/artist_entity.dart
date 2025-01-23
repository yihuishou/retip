import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:retip/app/presentation/widgets/rp_list_tile.dart';

import 'abstract_entity.dart';
import 'album_entity.dart';

abstract class ArtistEntity extends AbstractEntity {
  final String name;
  final Uint8List? artwork;
  final List<AlbumEntity> albums;

  ArtistEntity({
    required super.id,
    required this.name,
    required this.artwork,
    required this.albums,
  });

  @override
  String toString() {
    return name;
  }

  @override
  RpListTile toListTile(BuildContext context, [String? query]) {
    // TODO: implement toListTile
    throw UnimplementedError();
  }

  @override
  String toTypeString(BuildContext context) {
    // TODO: implement toTypeString
    throw UnimplementedError();
  }
}
