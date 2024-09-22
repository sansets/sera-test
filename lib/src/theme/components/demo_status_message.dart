import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

class DemoStatusMessage extends StatelessWidget {
  DemoStatusMessage.info({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgInfo,
        color = context.color.info,
        iconData = Icons.info_outline,
        super(key: key);

  DemoStatusMessage.success({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgSuccess,
        color = context.color.success,
        iconData = Icons.check_circle_outline,
        super(key: key);

  DemoStatusMessage.error({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgError,
        color = context.color.alert,
        iconData = Icons.cancel_outlined,
        super(key: key);

  DemoStatusMessage.warning({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgWarning,
        color = context.color.warning,
        iconData = Icons.warning_amber,
        super(key: key);

  final String text;
  final Color backgroundColor;
  final Color color;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(iconData, size: 16, color: color),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
