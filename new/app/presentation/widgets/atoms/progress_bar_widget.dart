import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  final double? value;

  const ProgressBarWidget({
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
    );
  }
}
