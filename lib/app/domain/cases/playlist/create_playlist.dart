import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin CreatePlaylist {
  static Future<bool> call(String name, [TrackEntityBack? track]) async {
    final prefs = GetIt.I.get<SharedPreferences>();

    final key = 'pl_${DateTime.now().millisecondsSinceEpoch}';

    if (prefs.containsKey(key)) {
      return false;
    }

    return await prefs.setStringList(key, [
      name,
      if (track != null) track.id.toString(),
    ]);
  }
}
