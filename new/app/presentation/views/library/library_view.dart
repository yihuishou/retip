import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.library_music),
          title: Text(l10n.library),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(
                text: l10n.playlists,
                icon: const Icon(Icons.playlist_play),
              ),
              Tab(
                text: l10n.tracks,
                icon: const Icon(Icons.music_note),
              ),
              Tab(
                text: l10n.albums,
                icon: const Icon(Icons.album),
              ),
              Tab(
                text: l10n.artists,
                icon: const Icon(Icons.person),
              ),
              Tab(
                text: l10n.genres,
                icon: const Icon(Icons.category),
              ),
              Tab(
                text: l10n.decades,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Text(l10n.playlists),
            ),
            Center(
              child: Text(l10n.tracks),
            ),
            Center(
              child: Text(l10n.albums),
            ),
            Center(
              child: Text(l10n.artists),
            ),
            Center(
              child: Text(l10n.genres),
            ),
            Center(
              child: Text(l10n.decades),
            ),
          ],
        ),
      ),
    );
  }
}
