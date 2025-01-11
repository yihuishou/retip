import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/album_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';

mixin GetAlbum {
  static Future<AlbumEntityBack> call(int id) async {
    return await GetIt.I.get<LibraryRepository>().getAlbum(id);
  }
}
