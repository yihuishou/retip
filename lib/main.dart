import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/providers/just_audio_provider.dart';
import 'app/data/providers/on_audio_query_provider.dart';
import 'app/data/providers/retip_audio.dart';
import 'app/data/providers/shared_preferences_provider.dart';
import 'app/data/repositories/audio_repository_implementation.dart';
import 'app/data/repositories/library_repository_implementation.dart';
import 'app/data/repositories/theme_repository_implementation.dart';
import 'app/domain/repositories/audio_repository.dart';
import 'app/domain/repositories/library_repository.dart';
import 'app/retip_app.dart';
import 'objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await initObjectbox();

  const icon = 'drawable/ic_stat_name';

  await JustAudioBackground.init(
    androidNotificationChannelId: 'dev.rozpo.retip.audio',
    androidNotificationIcon: icon,
    androidStopForegroundOnPause: true,
    androidNotificationOngoing: true,
  );

  // Setup the dependency injection
  final sharedPrefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(sharedPrefs);

  final packageInfo = await PackageInfo.fromPlatform();
  GetIt.I.registerSingleton<PackageInfo>(packageInfo);

  final player = GetIt.I.registerSingleton<RetipAudio>(RetipAudio());

  final sharedPrefsProvider = GetIt.I.registerSingleton(
    SharedPreferencesProvider(),
  );

  // Library repository register
  final libraryRepository = GetIt.I.registerSingleton<LibraryRepository>(
    LibraryRepositoryImplementation(
      onAudioQueryProvider: OnAudioQueryProvider(),
      sharedPreferencesProvider: sharedPrefsProvider,
    ),
  );

  GetIt.I.registerSingleton<AudioRepository>(
    AudioRepositoryImplementation(
      sharedPreferencesProvider: sharedPrefsProvider,
      libraryRepository: libraryRepository,
      justAudioProvider: JustAudioProvider(),
    ),
  );

  // TODO Refactor this temporary player manager to proper audio repository
  await player.init();

  // Run application
  runApp(RetipApp(
    audioRepository: GetIt.I.get<AudioRepository>(),
    themeRepository: ThemeRepositoryImplementation(
      provider: SharedPreferencesProvider(),
    ),
  ));
}

Future<void> initObjectbox() async {
  // Objectbox setup
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = join(appDir.path, 'objectbox');

  late Store store;
  try {
    store = await openStore(directory: dbPath);
  } catch (e) {
    final dbFile = File(join(dbPath, 'data.mdb'));
    final lockFile = File(join(dbPath, 'lock.mdb'));

    if (await dbFile.exists()) {
      dbFile.delete();
    }

    if (await lockFile.exists()) {
      lockFile.delete();
    }

    store = await openStore(directory: dbPath);
  } finally {
    GetIt.I.registerSingleton<Store>(store);

    if (kReleaseMode == false && Admin.isAvailable()) {
      GetIt.I.registerSingleton<Admin>(Admin(store));
    }
  }
}
