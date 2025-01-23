import 'package:objectbox/objectbox.dart';
import 'package:on_audio_query/on_audio_query.dart' as on_audio_query;

@Entity()
class TrackModel {
  @Id()
  int id;
  int? albumId;
  int? artistId;

  String title;
  String? album;
  String? artist;

  @Unique()
  final String location;

  TrackModel({
    this.id = 0,
    this.albumId,
    this.artistId,
    required this.title,
    this.album,
    this.artist,
    required this.location,
  });

  factory TrackModel.fromOnAudioQuery(on_audio_query.SongModel song) {
    return TrackModel(
      title: song.title,
      album: song.album,
      artist: song.artist,
      location: song.uri!, // TODO: Handle null
    );
  }

  void refresh(TrackModel other) {
    if (other.albumId != albumId) albumId = other.albumId;
    if (other.artistId != artistId) artistId = other.artistId;
    if (other.title != title) title = other.title;
    if (other.album != album) album = other.album;
    if (other.artist != artist) artist = other.artist;
  }
}
