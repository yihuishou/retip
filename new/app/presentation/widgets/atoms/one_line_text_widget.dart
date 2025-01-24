import 'package:flutter/material.dart';

class OneLineTextWidget extends StatelessWidget {
  final TextStyle? style;
  final String text;

  const OneLineTextWidget(
    this.text, {
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      style: style,
      maxLines: 1,
      text,
    );
  }
}
