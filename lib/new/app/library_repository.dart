import 'objectbox_provider.dart';
import 'on_audio_query_provider.dart';
import 'track_model.dart';

class LibraryRepository {
  final ObjectboxProvider<TrackModel> _objectboxProvider;
  final OnAudioQueryProvider _onAudioQueryProvider;

  LibraryRepository({
    required ObjectboxProvider<TrackModel> objectboxProvider,
    required OnAudioQueryProvider onAudioQueryProvider,
  })  : _onAudioQueryProvider = onAudioQueryProvider,
        _objectboxProvider = objectboxProvider;

  Future<int> scan() async {
    final tracks = await _onAudioQueryProvider.getAllTracks();
    final entities = await _objectboxProvider.getAll();

    final newTracks = <TrackModel>[];
    for (final track in tracks) {
      try {
        final entity = entities.firstWhere((entity) {
          return entity.location == track.location;
        });
        entity.refresh(track);
        _objectboxProvider.update(entity);
      } catch (e) {
        newTracks.add(track);
      }
    }

    final newEntities = await _objectboxProvider.insertMany(newTracks);
    return newEntities.length;
  }
}
