import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/cases/playlist/read_playlist.dart';
import 'package:retip/app/domain/entities/playlist_entity_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin GetAllPlaylists {
  static Future<List<PlaylistEntityBack>> call() async {
    final prefs = GetIt.I.get<SharedPreferences>();
    final keys = prefs.getKeys().where((key) => key.startsWith('pl_'));

    List<PlaylistEntityBack> playlists = [];

    for (final key in keys) {
      final playlist = await ReadPlaylist.call(key);
      if (playlist != null) {
        playlists.add(playlist);
      }
    }

    return playlists;
  }
}
