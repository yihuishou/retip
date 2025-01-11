part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchIdleState extends SearchState {}

final class SearchSearchingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<ArtistEntityBack> artists;
  final List<AlbumEntityBack> albums;
  final List<PlaylistEntityBack> playlists;
  final List<TrackEntityBack> tracks;

  final String query;

  int get mediaLength =>
      artists.length + albums.length + playlists.length + tracks.length;

  List<AbstractEntity> get media => [
        ...artists,
        ...albums,
        ...playlists,
        ...tracks,
      ];

  SearchSuccessState({
    this.artists = const [],
    this.albums = const [],
    this.playlists = const [],
    this.tracks = const [],
    this.query = '',
  });
}

final class SearchErrorState extends SearchState {}
