import '../entities/playlist_entity.dart';

abstract class PlaylistRepository {
  Future<int> create(PlaylistEntity playlist);

  Future<PlaylistEntity?> read(int playlistId);

  Future<List<PlaylistEntity>> readAll();

  Future<void> update(PlaylistEntity playlist);

  Future<void> delete(int playlistId);
}
