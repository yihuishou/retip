abstract class TrackEntity {
  // Ids
  int id;
  int get albumId;
  int artistId;

  // Fields
  String title;
  String path;

  TrackEntity({
    required this.id,
    required this.artistId,
    required this.title,
    required this.path,
  });
}
