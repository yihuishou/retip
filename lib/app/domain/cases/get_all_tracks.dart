import 'package:get_it/get_it.dart';
import 'package:retip/app/domain/entities/track_entity_back.dart';
import 'package:retip/app/domain/repositories/library_repository.dart';

class GetAllTracks {
  static Future<List<TrackEntityBack>> call() async {
    return await GetIt.I.get<LibraryRepository>().getAllTracks();
  }
}
