import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retip/core/constants/assets_constants.dart';

class RetipIconWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const RetipIconWidget({
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsConstants.retipMonochrome,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}
