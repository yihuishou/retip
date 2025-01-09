part of 'tracks_bloc.dart';

@immutable
final class TracksState {
  final List<TrackEntityBack> tracks;
  final SortType sortType;

  const TracksState({
    this.sortType = SortType.title,
    this.tracks = const [],
  });

  TracksState copyWith({
    List<TrackEntityBack>? tracks,
    SortType? sortType,
  }) {
    return TracksState(
      sortType: sortType ?? this.sortType,
      tracks: tracks ?? this.tracks,
    );
  }
}
