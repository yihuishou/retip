import 'package:objectbox/objectbox.dart';
import 'package:on_audio_query/on_audio_query.dart' as on_audio_query;

@Entity()
class TrackModel {
  @Id()
  int id;

  final String title;

  TrackModel({
    this.id = 0,
    required this.title,
  });

  factory TrackModel.fromOnAudioQuery(on_audio_query.SongModel song) {
    return TrackModel(
      title: song.title,
    );
  }
}
