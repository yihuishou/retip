import 'dart:typed_data';

import 'package:retip/app/data/models/album_model.dart';
import 'package:retip/app/data/models/artist_model.dart';
import 'package:retip/app/data/models/track_model.dart';
import 'package:retip/app/data/providers/on_audio_query_provider.dart';
import 'package:retip/app/data/providers/shared_preferences_provider.dart';
import 'package:retip/app/domain/entities/album_entity.dart';
import 'package:retip/app/domain/entities/artist_entity.dart';
import 'package:retip/app/domain/entities/track_entity.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';
import 'package:retip/objectbox.g.dart';

import '../providers/objectbox_provider.dart';

class LibraryRepositoryImplementation implements LibraryRepository {
  final OnAudioQueryProvider onAudioQueryProvider;
  final SharedPreferencesProvider sharedPreferencesProvider;
  final ObjectboxProvider objectboxProvider;

  LibraryRepositoryImplementation({
    required this.onAudioQueryProvider,
    required this.sharedPreferencesProvider,
    required this.objectboxProvider,
  });

  @override
  Future<List<AlbumEntity>> getAllAlbums() async {
    final result = <AlbumEntity>[];

    final albums = await onAudioQueryProvider.getAllAlbums();
    final tracks = await onAudioQueryProvider.getAllSongs();

    for (final album in albums) {
      Uint8List? albumArtwork =
          sharedPreferencesProvider.getAlbumArtwork(album.id);

      if (albumArtwork == null) {
        albumArtwork = await onAudioQueryProvider.getAlbumArtwork(album.id);

        if (albumArtwork != null) {
          sharedPreferencesProvider.setAlbumArtwork(album.id, albumArtwork);
        }
      }

      final albumTracks = tracks
          .where((e) => e.album == album.album)
          .map((e) => TrackModel.fromSongModel(e, albumArtwork))
          .toList();

      if (result.map((e) => e.title).contains(album.album)) {
        final duplicatedAlbum = result.firstWhere(
          (e) => e.title == album.album,
        );

        if (duplicatedAlbum.tracks.length == albumTracks.length) {
          // Duplciated album skipping
          continue;
        }
      }

      result.add(AlbumModel.fromAlbumModel(
        album,
        albumArtwork,
        albumTracks,
      ));
    }

    return result;
  }

  @override
  Future<List<ArtistEntity>> getAllArtists() async {
    final result = <ArtistEntity>[];

    // Fetch all raw data
    final artists = await onAudioQueryProvider.getAllArtists();
    final albums = await onAudioQueryProvider.getAllAlbums();
    final tracks = await onAudioQueryProvider.getAllSongs();

    for (final artist in artists) {
      final artistAlbums =
          albums.where((album) => album.artist == artist.artist);
      Uint8List? artistArtwork =
          sharedPreferencesProvider.getArtistArtwork(artist.id);

      if (artistArtwork == null) {
        artistArtwork = await onAudioQueryProvider.getArtistArtwork(artist.id);

        if (artistArtwork != null) {
          sharedPreferencesProvider.setArtistArtwork(artist.id, artistArtwork);
        }
      }
      final albumsToAdd = <AlbumModel>[];

      for (final artistAlbum in artistAlbums) {
        final albumTracks =
            tracks.where((track) => track.album == artistAlbum.album);
        Uint8List? albumArtwork =
            sharedPreferencesProvider.getAlbumArtwork(artistAlbum.id);

        if (albumArtwork == null) {
          albumArtwork =
              await onAudioQueryProvider.getAlbumArtwork(artistAlbum.id);

          if (albumArtwork != null) {
            sharedPreferencesProvider.setAlbumArtwork(
                artistAlbum.id, albumArtwork);
          }
        }
        final tracksToAdd = <TrackModel>[];

        for (final albumTrack in albumTracks) {
          tracksToAdd.add(TrackModel.fromSongModel(albumTrack, albumArtwork));
        }

        if (albumsToAdd.map((e) => e.title).contains(artistAlbum.album)) {
          final duplicatedAlbum = albumsToAdd.firstWhere(
            (e) => e.title == artistAlbum.album,
          );

          if (duplicatedAlbum.tracks.length == tracksToAdd.length) {
            // Duplciated album skipping
            continue;
          }
        }

        albumsToAdd.add(AlbumModel.fromAlbumModel(
          artistAlbum,
          albumArtwork,
          tracksToAdd,
        ));
      }

      result.add(ArtistModel.fromArtistModel(
        artist,
        artistArtwork,
        albumsToAdd,
      ));
    }

    return result;
  }

  @override
  Future<List<TrackEntityBack>> getAllTracks() async {
    final data = await onAudioQueryProvider.getAllSongs();

    final artworks = <int, Uint8List>{};
    final tracks = <TrackModel>[];

    for (final track in data) {
      final albumId = track.albumId;
      Uint8List? artwork;

      if (albumId != null) {
        if (artworks.containsKey(albumId)) {
          artwork = artworks[albumId];
        } else {
          artwork = sharedPreferencesProvider.getAlbumArtwork(albumId);

          if (artwork == null) {
            artwork = await onAudioQueryProvider.getSongArtwork(track.id);

            if (artwork != null) {
              sharedPreferencesProvider.setAlbumArtwork(albumId, artwork);
            }
          }

          if (artwork != null) {
            artworks.addAll({albumId: artwork});
          }
        }
      }

      tracks.add(TrackModel.fromSongModel(track, artwork));

      if (track.uri != null) {
        final box = objectboxProvider.store.box<TrackEntity>();

        final entity = await box.query(TrackEntity_.path.equals(track.uri!)).build().findFirstAsync();

        if (entity == null) {
          box.put(
            TrackEntity(
              title: track.title,
              artist: track.artist!,
              album: track.album!,
              path: track.uri!,
            ),
          );
        }
      }
    }

    return tracks;
  }

  @override
  Future<AlbumEntity> getAlbum(int id) async {
    final albums = await getAllAlbums();

    return albums.firstWhere((album) => album.id == id);
  }

  @override
  Future<ArtistEntity> getArtist(int id) async {
    final artists = await getAllArtists();
    return artists.firstWhere((artist) => artist.id == id);
  }

  @override
  Future<TrackEntityBack> getTrack(int id) {
    // TODO: implement getTrack
    throw UnimplementedError();
  }
}
