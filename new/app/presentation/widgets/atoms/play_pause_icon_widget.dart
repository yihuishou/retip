import 'dart:async';

import 'package:flutter/material.dart';

class PlayPauseIconWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final Stream<bool>? stream;
  final bool isPlaying;

  const PlayPauseIconWidget({
    this.isPlaying = false,
    this.onPressed,
    this.stream,
    super.key,
  });

  @override
  State<PlayPauseIconWidget> createState() => _PlayPauseIconWidgetState();
}

class _PlayPauseIconWidgetState extends State<PlayPauseIconWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.value = widget.isPlaying ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.stream,
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? widget.isPlaying;
        isPlaying ? _controller.forward() : _controller.reverse();

        return IconButton.filled(
          onPressed: widget.onPressed,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animation,
          ),
        );
      },
    );
  }
}
