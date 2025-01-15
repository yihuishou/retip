import 'package:objectbox/objectbox.dart';

/// === ARTIST ===
abstract class Artist {
  // Keys
  final int id;
  final List<Album> albums;
  // Fields
  final String name;

  Artist({
    required this.id,
    required this.albums,
    required this.name,
  });
}

@Entity()
class ArtistObx implements Artist {
  @Id()
  @override
  int id;

  @Backlink('artistEntity')
  final albumEntities = ToMany<AlbumObx>();

  @Transient()
  @override
  List<Album> get albums => albumEntities.toList();
  set albums(List<Album> value) {
    albumEntities.clear();
    albumEntities.addAll(value as List<AlbumObx>);
  }

  @override
  String name;

  ArtistObx({
    this.id = 0,
    required this.name,
  });
}

/// === ALBUM ===
abstract class Album {
  // Keys
  final int id;
  final Artist? artist;
  final List<Track> tracks;
  // Fields
  final String title;

  Album({
    required this.id,
    required this.artist,
    required this.tracks,
    required this.title,
  });
}

@Entity()
class AlbumObx implements Album {
  @Id()
  @override
  int id;

  final artistEntity = ToOne<ArtistObx>();

  @Transient()
  @override
  Artist? get artist => artistEntity.target;

  @Backlink('albumEntity')
  final trackEntities = ToMany<TrackObx>();

  @Transient()
  @override
  List<Track> get tracks => trackEntities.toList();
  set tracks(List<Track> value) {
    trackEntities.clear();
    trackEntities.addAll(value as List<TrackObx>);
  }

  @override
  String title;

  AlbumObx({
    this.id = 0,
    required this.title,
  });
}

/// === TRACK ===
abstract class Track {
  // Keys
  final int id;
  final Album? album;
  // Fields
  final String title;
  final String location;
  final int duration;
  final int size;

  const Track({
    required this.id,
    required this.album,
    required this.title,
    required this.location,
    required this.duration,
    required this.size,
  });
}

@Entity()
class TrackObx implements Track {
  @Id()
  @override
  int id;

  final albumEntity = ToOne<AlbumObx>();

  @Transient()
  @override
  Album? get album => albumEntity.target;

  @override
  String title;

  @override
  String location;

  @override
  int duration;

  @override
  int size;

  TrackObx({
    this.id = 0,
    required this.title,
    required this.location,
    required this.duration,
    required this.size,
  });
}
