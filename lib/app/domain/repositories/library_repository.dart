import 'package:retip/app/domain/entities/album_entity.dart';
import 'package:retip/app/domain/entities/artist_entity.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';

abstract class LibraryRepository {
  Future<List<TrackEntityBack>> getAllTracks();

  Future<List<AlbumEntity>> getAllAlbums();

  Future<List<ArtistEntity>> getAllArtists();

  Future<TrackEntityBack> getTrack(int id);

  Future<AlbumEntity> getAlbum(int id);

  Future<ArtistEntity> getArtist(int id);
}
