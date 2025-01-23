import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:on_audio_query/on_audio_query.dart' as on_audio_query;
import 'package:retip/app/data/models/album_model.dart';
import 'package:retip/app/domain/entities/album_entity.dart';
import 'package:retip/app/domain/entities/artist_entity.dart';
import 'package:retip/app/presentation/widgets/rp_list_tile.dart';

import '../../../core/l10n/retip_l10n.dart';
import '../../../core/utils/sizer.dart';
import '../../../core/utils/utils.dart';
import '../../presentation/pages/artist/artist_page.dart';
import '../../presentation/widgets/artwork_widget.dart';

@Entity()
class ArtistModel implements ArtistEntity {
  @override
  @Id()
  int id;

  @override
  String name;

  @override
  @Transient()
  List<AlbumEntity> get albums => [];
  // final albumsDb = ToMany<AlbumModel>(); // TODO add relation

  @override
  Uint8List? artwork;

  ArtistModel({
    this.id = 0,
    required this.name,
    this.artwork,
  });

  factory ArtistModel.fromArtistModel(
    on_audio_query.ArtistModel data,
    Uint8List? artwork,
    List<AlbumModel> albums,
  ) {
    try {
      final artist = ArtistModel(
        id: data.id,
        name: data.artist,
        artwork: artwork,
      );
      // artist.albumsDb.addAll(albums);
      return artist;
    } catch (e) {
      throw ArgumentError();
    }
  }

  @override
  String toTypeString(BuildContext context) {
    return RetipL10n.of(context).artists;
  }

  @override
  RpListTile toListTile(BuildContext context, [String? query]) {
    final theme = Theme.of(context);

    int tracksLength = 0;

    for (final album in albums) {
      tracksLength += album.tracks.length;
    }

    return RpListTile(
      leading: Container(
        width: Sizer.x5,
        height: Sizer.x5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizer.max),
          color: theme.colorScheme.surfaceBright,
        ),
        child: ArtworkWidget(
          style: ArtworkStyle.circle,
          bytes: artwork,
          borderWidth: 0,
        ),
      ),
      title: RetipUtils.getQueryText(context, name, query ?? ''),
      subtitle: Text(
          '${RetipL10n.of(context).albumsCount(albums.length)} - ${RetipL10n.of(context).tracksCount(tracksLength)}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ArtistPage(
                artist: this,
              );
            },
          ),
        );
      },
    );
  }
}
