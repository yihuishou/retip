import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/l10n/retip_l10n.dart';
import '../pages/home/cubit/home_cubit.dart';
import '../views/search/cubit/search_cubit.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final l10n = RetipL10n.of(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: state.index,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface,
          selectedItemColor: Theme.of(context).colorScheme.onSurface,
          onTap: (value) {
            if (value != state.index) {
              cubit.changeIndex(value);
              return;
            }

            if (value == 2) {
              context.read<SearchCubit>().focus();
            }
          },
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
      },
    );
  }
}
