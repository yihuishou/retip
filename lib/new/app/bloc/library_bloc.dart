import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../library_repository.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryRepository _libraryRepository;

  LibraryBloc({
    required LibraryRepository libraryRepository,
  })  : _libraryRepository = libraryRepository,
        super(LibraryInit()) {
    on<LibraryScanEvent>(onLibraryScan);

    add(LibraryScanEvent());
  }

  @override
  void onChange(Change<LibraryState> change) {
    log('LibraryBloc: $change');
    super.onChange(change);
  }

  void onLibraryScan(LibraryScanEvent event, Emitter<LibraryState> emit) async {
    emit(LibraryScanningState());

    await _libraryRepository.scan();

    emit(LibraryIdleState());
  }
}
