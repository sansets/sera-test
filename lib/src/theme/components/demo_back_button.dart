import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sera_test/src/theme/assets/demo_icons.dart';

class DemoBackButton extends StatelessWidget {
  const DemoBackButton({
    super.key,
    this.size = 24,
    this.onTap,
    this.iconColor,
  });

  final double size;
  final Function()? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap?.call() ?? context.pop();
      },
      icon: SvgPicture.asset(
        DemoIcons.icArrowBack,
        width: size,
        height: size,
        colorFilter: iconColor == null
            ? null
            : ColorFilter.mode(
                iconColor!,
                BlendMode.srcIn,
              ),
        fit: BoxFit.cover,
      ),
    );
  }
}
