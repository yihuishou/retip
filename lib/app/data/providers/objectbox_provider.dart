import 'package:objectbox/objectbox.dart';

import '../../domain/entities/test_entity.dart';

class ObjectboxProvider {
  final Store _store;

  ObjectboxProvider(this._store);

  Box<Track> get tracksBox => _store.box<TrackObx>();

  Box<Album> get albumsBox => _store.box<AlbumObx>();

  Box<Artist> get artistsBox => _store.box<ArtistObx>();
}
