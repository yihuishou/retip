import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/album_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';

mixin GetAllAlbums {
  static Future<List<AlbumEntityBack>> call() async {
    return GetIt.I.get<LibraryRepository>().getAllAlbums();
  }
}
