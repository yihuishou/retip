part of 'library_bloc.dart';

@immutable
sealed class LibraryState {}

final class LibraryInit extends LibraryState {}

final class LibraryScanningState extends LibraryState {}

final class LibraryIdleState extends LibraryState {}
