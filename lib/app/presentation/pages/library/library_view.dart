import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('LibraryView'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(child: Text('Playlists')),
              Tab(child: Text('Artists')),
              Tab(child: Text('Albums')),
              Tab(child: Text('Genres')),
              Tab(child: Text('Tracks')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Playlist $index'),

                  onTap: () {
                    context.pushNamed(
                      '/playlist:id',
                      pathParameters: {'id': index.toString()},
                    );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Artist $index'),

                  onTap: () {
                    context.pushNamed(
                      '/artist:id',
                      pathParameters: {'id': index.toString()},
                    );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Album $index'),

                  onTap: () {
                    context.pushNamed(
                      '/album:id',
                      pathParameters: {'id': index.toString()},
                    );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Genre $index'),

                  onTap: () {
                    context.pushNamed(
                      '/genre:id',
                      pathParameters: {'id': index.toString()},
                    );
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Track $index'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
