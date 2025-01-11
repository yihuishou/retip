import 'package:objectbox/objectbox.dart';

import '../../domain/entities/track_entity.dart';
import 'album.dart';

@Entity()
class Track implements TrackEntity {
  @Id()
  @override
  int id;

  final albumEntity = ToOne<Album>();

  Track({
    this.id = 0,
    required this.artistId,
    required this.title,
    required this.path,
  });

  @override
  int artistId;

  @override
  String path;

  @override
  String title;

  @override
  int get albumId => albumEntity.targetId;
}
