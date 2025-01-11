import 'package:objectbox/objectbox.dart';

import 'track.dart';

@Entity()
class Album {
  @Id()
  int id;

  @Backlink('albumEntity')
  final tracks = ToMany<Track>();

  String title;
  int mediaId;

  Album({
    this.id = 0,
    required this.title,
    required this.mediaId,
  });
}
