import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),

        actions: [
          IconButton.filledTonal(
            onPressed: () {
              context.push('/profile');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
