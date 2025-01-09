import 'package:objectbox/objectbox.dart';

@Entity()
class TrackEntity {
  @Id()
  int id;

  String title;
  String artist;
  String album;

  String path;

  TrackEntity({
    this.id = 0,
    required this.title,
    required this.artist,
    required this.album,
    required this.path,
  });
}
