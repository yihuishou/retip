import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retip/app/domain/cases/favourites/get_all_favourites.dart';
import 'package:retip/app/domain/cases/playlist/get_all_playlists.dart';
import 'package:retip/app/domain/entities/playlist_entity_back.dart';
import 'package:retip/app/presentation/pages/favourites/favourites_page.dart';
import 'package:retip/app/presentation/pages/playlist/playlist_page.dart';
import 'package:retip/app/presentation/views/settings/cubit/settings_cubit.dart';
import 'package:retip/app/presentation/widgets/playlist_artwork.dart';
import 'package:retip/app/presentation/widgets/rp_text.dart';
import 'package:retip/app/presentation/widgets/widgets.dart';
import 'package:retip/core/extensions/string_extension.dart';
import 'package:retip/core/l10n/retip_l10n.dart';
import 'package:retip/core/utils/sizer.dart';

class PlaylistsView extends StatefulWidget {
  final List<PlaylistEntityBack> playlists;

  const PlaylistsView({
    this.playlists = const [],
    super.key,
  });

  @override
  State<PlaylistsView> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  static List<PlaylistEntityBack> playlists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        initialData: playlists,
        future: GetAllPlaylists.call(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done &&
              playlists.isEmpty) {
            return const Center(
              child: SpinnerWidget(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          bool hasChanged = snapshot.requireData.length != playlists.length;

          if (hasChanged == false) {
            for (int i = 0; i < playlists.length; i++) {
              final oldPlaylist = playlists[i];
              final newPlaylist = snapshot.requireData[i];

              if (oldPlaylist.tracks.length != newPlaylist.tracks.length) {
                hasChanged = true;
                break;
              }
            }
          }

          final data = hasChanged ? snapshot.requireData : playlists;

          if (hasChanged) {
            playlists = snapshot.requireData;
          }

          final columns = context.read<SettingsCubit>().state.gridViewColumns;

          final textLineHeight = 'A'.height(
              Theme.of(context).textTheme.bodySmall!,
              MediaQuery.of(context).size.width / columns);
          final textLineHeight2 = 'A'.height(
              Theme.of(context).textTheme.bodyMedium!,
              MediaQuery.of(context).size.width / columns);

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                vertical: Sizer.x1 + Sizer.x0_5, horizontal: Sizer.x1),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: Sizer.x1,
              crossAxisSpacing: Sizer.x1,
              crossAxisCount: columns,
              mainAxisExtent: MediaQuery.of(context).size.width / columns +
                  textLineHeight +
                  textLineHeight2,
            ),
            itemCount: widget.playlists.isNotEmpty
                ? widget.playlists.length
                : data.length + 1,
            itemBuilder: (context, index) {
              late final PlaylistEntityBack playlist;

              if (widget.playlists.isNotEmpty) {
                playlist = widget.playlists[index];
              } else {
                playlist = index == 0
                    ? PlaylistEntityBack(
                        id: 0,
                        name: RetipL10n.of(context).favourites,
                      )
                    : data[index - 1];
              }

              return GestureDetector(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return index == 0 && widget.playlists.isEmpty
                            ? const FavouritesPage()
                            : PlaylistPage(playlist: playlist);
                      },
                    ),
                  );

                  if (widget.playlists.isNotEmpty) {
                    final data =
                        await GetAllFavourites.call<PlaylistEntityBack>(
                            'PlaylistEntity');

                    if (data.isEmpty && context.mounted) {
                      Navigator.of(context).pop();
                      return;
                    }

                    if (data.length != widget.playlists.length) {
                      widget.playlists.clear();
                      widget.playlists.addAll(data);
                    }
                  }

                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizer.x1),
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                          final dimension = constraints.maxHeight;

                          return SizedBox.square(
                            dimension: dimension,
                            child: PlaylistArtwork(
                              images: playlist.artworks,
                              icon: index == 0 && widget.playlists.isEmpty
                                  ? Icons.favorite
                                  : null,
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizer.x0_5,
                          horizontal: Sizer.x1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RpText(
                              playlist.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            RpText(
                              index == 0 && widget.playlists.isEmpty
                                  ? RetipL10n.of(context).generatedPlaylist
                                  : RetipL10n.of(context)
                                      .tracksCount(playlist.tracks.length),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
