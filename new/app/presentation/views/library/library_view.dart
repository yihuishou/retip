import 'package:flutter/material.dart';

import '../../widgets/atoms/content_padding_widget.dart';
import '../../widgets/molecules/media_tile_widget.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 6, vsync: this);
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Playlists',
      'Artists',
      'Albums',
      'Songs',
      'Categories',
      'Decades',
    ];

    final currentTab = tabs[controller.index];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const Icon(Icons.library_music),
              title: Text(currentTab),
              pinned: true,
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
                const ContentPaddingWidget(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_view),
                ),
                const ContentPaddingWidget(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                const ContentPaddingWidget(),
              ],
              bottom: TabBar(
                controller: controller,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.fill,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.playlist_play),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    icon: Icon(Icons.album),
                  ),
                  Tab(
                    icon: Icon(Icons.music_note),
                  ),
                  Tab(
                    icon: Icon(Icons.category),
                  ),
                  Tab(
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller,
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return const MediaTileWidget();
              },
              itemCount: 100,
            ),
          ],
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     const SliverAppBar(
      //       leading: Icon(Icons.library_music),
      //       title: Text('Library'),
      //       pinned: true,
      //       floating: true,
      //       snap: true,
      //       bottom: TabBar(tabs: [
      //         Tab(
      //           // icon: Icon(
      //           //   Icons.queue_music,
      //           // ),
      //           text: 'Playlists',
      //         ),
      //         Tab(text: 'Artists'),
      //         Tab(text: 'Albums'),
      //         Tab(text: 'Songs'),
      //       ]),
      //     ),
      //     SliverFillRemaining(
      //       child: TabBarView(
      //         children: [
      //           SliverList(
      //             delegate: SliverChildBuilderDelegate(
      //               (context, index) {
      //                 return const MediaTileWidget();
      //               },
      //               childCount: 100,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
