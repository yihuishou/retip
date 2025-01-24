import 'package:flutter/material.dart';

import '../../widgets/atoms/content_padding_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = RetipL10n.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: const Text('Hi, Peter!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          const ContentPaddingWidget(),
        ],
      ),
      // body: ListView(
      //   children: const [
      //     SafeArea(
      //       child: CircleAvatar(
      //         radius: 50,
      //         child: Icon(Icons.person),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
