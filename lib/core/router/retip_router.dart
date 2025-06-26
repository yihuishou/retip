import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/presentation/pages/album/album_page.dart';
import '../../app/presentation/pages/artist/artist_page.dart';
import '../../app/presentation/pages/dev/dev_page.dart';
import '../../app/presentation/pages/genre/genre_page.dart';
import '../../app/presentation/pages/home/home_page.dart';
import '../../app/presentation/pages/library/library_page.dart';
import '../../app/presentation/pages/player/player_page.dart';
import '../../app/presentation/pages/playlist/playlist_page.dart';
import '../../app/presentation/pages/profile/profile_page.dart';
import '../../app/presentation/pages/search/search_page.dart';
import '../../app/presentation/pages/settings/settings_page.dart';
import '../../app/presentation/pages/track/track_page.dart';
import '../../app/presentation/widgets/bottom_navigation_widget.dart';

class RetipRouter extends GoRouter {
  final List<NavigatorObserver>? observers;

  RetipRouter({this.observers})
    : super.routingConfig(
        observers: observers,
        initialLocation: '/',
        routingConfig: ValueNotifier(
          RoutingConfig(
            routes: [
              ShellRoute(
                builder: (context, state, child) {
                  return Scaffold(
                    body: child,
                    bottomNavigationBar: BottomNavigationWidget(),
                  );
                },
                routes: [
                  GoRoute(path: '/', builder: (context, state) => HomePage()),
                  GoRoute(
                    path: '/library',
                    builder: (context, state) => LibraryPage(),
                  ),
                  GoRoute(
                    path: '/search',
                    builder: (context, state) => SearchPage(),
                  ),
                  GoRoute(
                    name: '/playlist:id',
                    path: '/playlist:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return PlaylistPage(playlistId: int.parse(id!));
                    },
                  ),
                  GoRoute(
                    name: '/album:id',
                    path: '/album:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return AlbumPage(albumId: int.parse(id!));
                    },
                  ),
                  GoRoute(
                    name: '/artist:id',
                    path: '/artist:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return ArtistPage(artistId: int.parse(id!));
                    },
                  ),
                  GoRoute(
                    name: '/genre:id',
                    path: '/genre:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return GenrePage(genreId: int.parse(id!));
                    },
                  ),
                  GoRoute(
                    name: '/track:id',
                    path: '/track:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return TrackPage(trackId: int.parse(id!));
                    },
                  ),
                ],
              ),
              GoRoute(
                path: '/player',
                builder: (context, state) => PlayerPage(),
              ),
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfilePage(),
              ),
              GoRoute(
                path: '/settings',
                builder: (context, state) => SettingsPage(),
              ),
              GoRoute(path: '/dev', builder: (context, state) => DevPage()),
            ],
          ),
        ),
      );
}
