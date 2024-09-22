import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

class DemoSnackBar extends SnackBar {
  DemoSnackBar.error({
    Key? key,
    BuildContext? context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor:
              context != null ? context.color.bgError : const Color(0xFFFFEBEB),
          content: Text(
            message,
            style: TextStyle(
              color: context != null
                  ? context.color.alert
                  : const Color(0xFFB22421),
            ),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );

  DemoSnackBar.info({
    Key? key,
    BuildContext? context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor:
              context != null ? context.color.bgInfo : const Color(0xFFE9F3FF),
          content: Text(
            message,
            style: TextStyle(
                color: context != null
                    ? context.color.info
                    : const Color(0xFF0172CB)),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );

  DemoSnackBar.success({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgSuccess,
          content: Text(
            message,
            style: TextStyle(color: context.color.success),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );

  DemoSnackBar.warning({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgWarning,
          content: Text(
            message,
            style: TextStyle(color: context.color.warning),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        );
}
