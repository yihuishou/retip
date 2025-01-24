import 'package:flutter/material.dart';

import '../../../../core/l10n/retip_l10n.dart';
import '../atoms/retip_icon_widget.dart';

class BottomNavigationWidget extends StatefulWidget {
  final void Function(int value, String name)? onTap;

  const BottomNavigationWidget({
    this.onTap,
    super.key,
  });

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    final names = [
      l10n.start,
      l10n.explore,
      l10n.search,
      l10n.library,
      l10n.profile,
    ];

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() => index = value);
          widget.onTap?.call(value, names[index]);
        },
        items: [
          BottomNavigationBarItem(
            icon: const RetipIconWidget(),
            activeIcon: const RetipIconWidget(),
            label: l10n.start,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore),
            label: l10n.explore,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
            label: l10n.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_music_outlined),
            activeIcon: const Icon(Icons.library_music),
            label: l10n.library,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}
