import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:objectbox/objectbox.dart';
import 'package:retip/app/domain/cases/get_all_tracks.dart';
import 'package:retip/app/domain/cases/play_audio.dart';

import '../../../../data/models/track_model.dart';

part 'tracks_event.dart';
part 'tracks_state.dart';

enum SortType {
  title,
  album,
  artist,
}

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final fetchTracks = GetAllTracks.call;
  final playTracks = PlayAudio.call;

  TracksBloc() : super(const TracksState()) {
    final store = GetIt.I.get<Store>();
    final box = store.box<Track>();
    final stream = box.query().watch(triggerImmediately: true);

    stream.listen((query) async {
      final tracks = await query.findAsync();
      add(FetchTracksEvent(tracks: tracks));
    });

    on<FetchTracksEvent>(_onFetchTracks);
    on<PlayTracksEvent>(_onPlayTracks);
    on<SortTracksEvent>(_onSortTracks);
  }

  void _onFetchTracks(FetchTracksEvent event, Emitter<TracksState> emit) async {
    // final tracks = await fetchTracks.call();
    add(SortTracksEvent(tracks: event.tracks, sortType: state.sortType));
  }

  void _onPlayTracks(PlayTracksEvent event, Emitter<TracksState> emit) async {
    if (state.tracks.isEmpty) return;
    // playTracks.call(state.tracks, index: event.index);
  }

  void _onSortTracks(SortTracksEvent event, Emitter<TracksState> emit) async {
    final tracks = event.tracks ?? state.tracks;

    switch (event.sortType) {
      case SortType.artist:
        tracks.sort((a, b) {
          int result = a.artist.compareTo(b.artist);

          if (result == 0) {
            result = a.album.compareTo(b.album);
          }

          if (result == 0) {
            result = a.index.compareTo(b.index);
          }

          return result;
        });
        break;
      case SortType.album:
        tracks.sort((a, b) {
          int result = a.album.compareTo(b.album);

          if (result == 0) {
            result = a.index.compareTo(b.index);
          }

          return result;
        });
        break;
      case SortType.title:
        tracks.sort((a, b) {
          int result = a.title.compareTo(b.title);

          if (result == 0) {
            result = a.artist.compareTo(b.artist);
          }

          if (result == 0) {
            result = a.album.compareTo(b.album);
          }

          return result;
        });
        break;
    }

    emit(state.copyWith(tracks: tracks, sortType: event.sortType));
  }
}
