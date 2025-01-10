abstract class TrackEntity extends AbstractEntity {
  TrackEntity({required super.extra});

  int get id;
  String get title;
  String get artist;
  String get album;
  String get path;
}

abstract class AbstractEntity {
  String extra;

  AbstractEntity({required this.extra});
}
