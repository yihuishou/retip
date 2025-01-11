import 'package:retip/app/domain/entities/album_entity_back.dart';
import 'package:retip/app/domain/entities/artist_entity_back.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';

abstract class LibraryRepository {
  Future<List<TrackEntityBack>> getAllTracks();

  Future<List<AlbumEntityBack>> getAllAlbums();

  Future<List<ArtistEntityBack>> getAllArtists();

  Future<TrackEntityBack> getTrack(int id);

  Future<AlbumEntityBack> getAlbum(int id);

  Future<ArtistEntityBack> getArtist(int id);

  Future<void> scan();
}
