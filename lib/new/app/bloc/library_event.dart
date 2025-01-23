part of 'library_bloc.dart';

@immutable
sealed class LibraryEvent {}

class LibraryScanEvent extends LibraryEvent {}

class LibraryRefreshEvent extends LibraryEvent {
  final List<TrackModel> tracks;

  LibraryRefreshEvent(this.tracks);
}
