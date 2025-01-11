import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/artist_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';

mixin GetArtist {
  static Future<ArtistEntityBack> call(int id) async {
    return await GetIt.I.get<LibraryRepository>().getArtist(id);
  }
}
