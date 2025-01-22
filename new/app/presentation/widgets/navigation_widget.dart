import 'package:flutter/material.dart';

import '../../../core/l10n/retip_l10n.dart';

class NavigationWidget extends StatefulWidget {
  final int initialIndex;

  const NavigationWidget({
    this.initialIndex = 0,
    super.key,
  });

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = RetipL10n.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: currentIndex,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      onTap: (value) => setState(() => currentIndex = value),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: l10n.home,
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
    );
  }
}
