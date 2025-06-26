import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/settings');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
