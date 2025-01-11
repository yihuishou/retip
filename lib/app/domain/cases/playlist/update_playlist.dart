import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/playlist_entity_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UpdatePlaylist {
  static Future<bool> call(PlaylistEntityBack playlist) async {
    final prefs = GetIt.I.get<SharedPreferences>();

    final key = 'pl_${playlist.id}';

    return await prefs.setStringList(
      key,
      [
        playlist.name,
        ...playlist.tracks.map((track) => track.id.toString()),
      ],
    );
  }
}
