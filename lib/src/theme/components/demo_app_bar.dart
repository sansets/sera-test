import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/components/demo_back_button.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

class DemoAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DemoAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.contentColor,
    this.backgroundColor,
    this.lineColor,
    this.isHideBackButton,
    this.isHideBottomLine,
    this.isCenterContent,
    this.icon,
    this.iconColor,
    this.actions,
  });

  final String? title;
  final String? subtitle;
  final Color? contentColor;
  final Color? backgroundColor;
  final Color? lineColor;
  final Color? iconColor;
  final bool? isHideBackButton;
  final bool? isHideBottomLine;
  final bool? isCenterContent;
  final Widget? icon;
  final List<Widget>? actions;

  @override
  State<StatefulWidget> createState() => _KinderCastleAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _KinderCastleAppBarState extends State<DemoAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: widget.actions,
      leading: widget.isHideBackButton == true
          ? null
          : widget.icon ?? const DemoBackButton(),
      automaticallyImplyLeading: widget.isHideBackButton != true,
      titleSpacing: widget.isHideBackButton == true
          ? AppBarTheme.of(context).titleSpacing
          : 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.toString(),
            style: TextStyle(
              color: context.color.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          if (widget.subtitle != null) ...[
            Text(
              widget.subtitle.toString(),
              style: TextStyle(
                color: context.color.textPrimary,
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
      bottom: PreferredSize(
        preferredSize: widget.isHideBottomLine == true
            ? Size.zero
            : const Size.fromHeight(1),
        child: Container(
          color: widget.lineColor ?? context.color.strokeSecondary,
          height: widget.isHideBottomLine == true ? 0 : 1,
        ),
      ),
      centerTitle: widget.isCenterContent ?? false,
    );
  }
}
