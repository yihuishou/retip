import 'package:on_audio_query/on_audio_query.dart';

import 'track_model.dart';

class OnAudioQueryProvider {
  final OnAudioQuery _onAudioQuery = OnAudioQuery();

  Future<List<TrackModel>> getAllTracks() async {
    // Query all songs from the device
    final songs = await _onAudioQuery.querySongs();
    // Convert all songs to TrackModel
    return songs.map((song) => TrackModel.fromOnAudioQuery(song)).toList();
  }
}
