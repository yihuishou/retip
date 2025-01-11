import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/cases/get_all_tracks.dart';
import 'package:retip/app/domain/entities/playlist_entity_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin ReadPlaylist {
  static Future<PlaylistEntityBack?> call(String key) async {
    final prefs = GetIt.I.get<SharedPreferences>();

    final trackIds = prefs.getStringList(key);
    if (trackIds == null) {
      return null;
    }
    final allTracks = await GetAllTracks.call();

    final tracks = allTracks
        .where((track) => trackIds.contains(track.id.toString()))
        .toList();

    return PlaylistEntityBack(
      id: int.parse(key.split('_')[1]),
      name: trackIds.first,
      tracks: tracks,
    );
  }
}
