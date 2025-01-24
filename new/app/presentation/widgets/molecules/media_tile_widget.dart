import 'package:flutter/material.dart';

import '../atoms/artwork_image_widget.dart';

class MediaTileWidget extends StatelessWidget {
  final String? path;

  const MediaTileWidget({
    this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ArtworkImageWidget(path ?? ''),
      title: const Text('Title'),
      subtitle: const Text('Artist'),
      onLongPress: () {},
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}
