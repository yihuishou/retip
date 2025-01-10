import 'package:objectbox/objectbox.dart';

import '../../domain/entities/track_entity.dart';

@Entity()
class Track implements TrackEntity {
  @Id()
  @override
  int id;

  final String _title;
  final String _artist;
  final String _album;
  final String _path;

  Track({
    this.id = 0,
    required String title,
    required String artist,
    required String album,
    required String path,
    required this.extra,
  })  : _title = title,
        _artist = artist,
        _album = album,
        _path = path;

  @override
  String get album => _album;

  @override
  String get artist => _artist;

  @override
  String get title => _title;

  @override
  String get path => _path;

  @override
  String extra;
}
