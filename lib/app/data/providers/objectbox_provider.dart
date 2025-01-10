import 'package:objectbox/objectbox.dart';

import '../models/track.dart';

class ObjectboxProvider {
  final Store _store;

  ObjectboxProvider(this._store);

  Box<Track> get trackBox => _store.box<Track>();
}
