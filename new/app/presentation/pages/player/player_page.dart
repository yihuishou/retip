import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy > 0) {
          context.go('/');
        }
      },
      child: Container(
        color: Colors.purple,
      ),
    );
  }
}
