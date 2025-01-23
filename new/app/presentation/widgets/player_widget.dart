import 'package:flutter/material.dart';

import '../../../core/constants/layout_constants.dart';
import 'atoms/artwork_atom.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LinearProgressIndicator(
            minHeight: 4,
            value: 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                const ArtworkAtom.small(),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Song Title'),
                      Text('Artist Name'),
                    ],
                  ),
                ),
                Container(
                  width: LayoutConstants.buttonSize,
                  height: LayoutConstants.buttonSize,
                  decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: IconButton(
                      // color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline),
                    ),
                  ),
                ),
                const SizedBox(width: LayoutConstants.buttonPadding),
                Container(
                  width: LayoutConstants.buttonSize,
                  height: LayoutConstants.buttonSize,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: AnimatedIcon(
                      color: Theme.of(context).colorScheme.onPrimary,
                      icon: AnimatedIcons.pause_play,
                      progress: const AlwaysStoppedAnimation(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
