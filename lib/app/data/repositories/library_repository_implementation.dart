import 'dart:typed_data';

import 'package:retip/app/data/models/album_model.dart';
import 'package:retip/app/data/models/artist_model.dart';
import 'package:retip/app/data/models/track_model.dart';
import 'package:retip/app/data/providers/on_audio_query_provider.dart';
import 'package:retip/app/data/providers/shared_preferences_provider.dart';
import 'package:retip/app/domain/entities/album_entity_back.dart';
import 'package:retip/app/domain/entities/artist_entity_back.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';

import '../../domain/entities/test_entity.dart';
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
  Future<List<AlbumEntityBack>> getAllAlbums() async {
    final result = <AlbumEntityBack>[];

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
  Future<List<ArtistEntityBack>> getAllArtists() async {
    final result = <ArtistEntityBack>[];

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

      // TODO remove this
      // if (track.uri != null) {
      //   final box = objectboxProvider.trackBox;

      //   final entity = await box
      //       .query(Track_.path.equals(track.uri!))
      //       .build()
      //       .findFirstAsync();

      //   if (entity == null) {
      //     box.put(
      //       Track(
      //         albumId: track.albumId ?? 0,
      //         artistId: track.artistId ?? 0,
      //         title: track.title,
      //         path: track.uri!,
      //       ),
      //     );
      //   }
      // }
    }

    return tracks;
  }

  @override
  Future<AlbumEntityBack> getAlbum(int id) async {
    final albums = await getAllAlbums();

    return albums.firstWhere((album) => album.id == id);
  }

  @override
  Future<ArtistEntityBack> getArtist(int id) async {
    final artists = await getAllArtists();
    return artists.firstWhere((artist) => artist.id == id);
  }

  @override
  Future<TrackEntityBack> getTrack(int id) {
    // TODO: implement getTrack
    throw UnimplementedError();
  }

  @override
  Future<void> scan() async {
    final tracksBox = objectboxProvider.tracksBox;
    final albumsBox = objectboxProvider.albumsBox;
    final artistsBox = objectboxProvider.artistsBox;

    // Clear all data
    tracksBox.removeAll();
    albumsBox.removeAll();
    artistsBox.removeAll();

    final artists = await onAudioQueryProvider.getAllArtists();

    for (final artist in artists) {
      final artistEntity = ArtistObx(
        name: artist.artist,
      );

      final albums = await onAudioQueryProvider.getArtistAlbums(artist.id);
      final albumEntities = <AlbumObx>[];
      for (final album in albums) {
        final albumEntity = AlbumObx(
          title: album.album,
        );

        final tracks = await onAudioQueryProvider.getAlbumSongs(album.id);
        final trackEntities = <TrackObx>[];
        for (final track in tracks) {
          final trackEntity = TrackObx(
            title: track.title,
            location: track.uri!,
            duration: track.duration!,
            size: track.size,
          );

          trackEntities.add(trackEntity);
        }
        albumEntity.tracks = trackEntities;
        albumEntities.add(albumEntity);
      }
      artistEntity.albums = albumEntities;
      artistsBox.put(artistEntity);
    }
  }
}
