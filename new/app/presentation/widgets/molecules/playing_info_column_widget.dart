import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';
import '../atoms/one_line_text_widget.dart';

class PlayingInfoColumnWidget extends StatelessWidget {
  final String? artist;
  final String? title;

  const PlayingInfoColumnWidget({
    this.artist,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OneLineTextWidget(
          style: Theme.of(context).textTheme.titleMedium,
          title ?? l10n.title,
        ),
        OneLineTextWidget(
          style: Theme.of(context).textTheme.bodyMedium,
          artist ?? l10n.artist,
        ),
      ],
    );
  }
}
