import 'package:objectbox/objectbox.dart';

import '../models/album.dart';
import '../models/track.dart';

class ObjectboxProvider {
  final Store _store;

  ObjectboxProvider(this._store);

  Box<Track> get tracksBox => _store.box<Track>();

  Box<Album> get albumsBox => _store.box<Album>();
}
