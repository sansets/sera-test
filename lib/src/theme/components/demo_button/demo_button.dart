import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/components/demo_button/icon_position.dart';
import 'package:sera_test/src/theme/components/demo_button/type_button.dart';
import 'package:sera_test/src/theme/components/demo_circular_loading.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

class DemoButton extends StatelessWidget {
  const DemoButton.primary({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  }) : _type = TypeButton.primary;

  const DemoButton.secondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  }) : _type = TypeButton.secondary;

  const DemoButton.tertiary({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  }) : _type = TypeButton.tertiary;

  const DemoButton.tertiaryDanger({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  }) : _type = TypeButton.tertiaryDanger;

  const DemoButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  }) : _type = TypeButton.text;

  final TypeButton _type;

  final bool isEnabled;

  /// onPressed function should be passed in as a required field.
  final GestureTapCallback onPressed;

  /// overrides the default button text
  final ButtonStyle? style;

  /// overrides the default text style
  final TextStyle? textStyle;

  /// text for button
  final String text;

  /// icon for button
  final Widget? icon;

  /// position icon in start or end, default IconPosition.start
  final IconPosition iconPosition;

  /// expand size button to infinity
  final bool isExpand;

  /// bool show loading
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
      height: 48,
      child: Builder(
        builder: (context) {
          switch (_type) {
            case TypeButton.primary:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : Text(text, style: textStyle),
                    icon: isLoading
                        ? DemoCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return ElevatedButton(
                onPressed: (isLoading | !isEnabled) ? null : onPressed,
                style: style,
                child: isLoading
                    ? DemoCircularLoading(
                        size: 24, color: context.color.primary)
                    : Text(text, style: textStyle),
              );
            case TypeButton.secondary:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : Text(text, style: textStyle),
                    icon: isLoading
                        ? DemoCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return OutlinedButton(
                onPressed: (isLoading | !isEnabled) ? null : onPressed,
                style: style,
                child: isLoading
                    ? DemoCircularLoading(
                        size: 24, color: context.color.primary)
                    : Text(text, style: textStyle),
              );
            case TypeButton.tertiary:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : Text(text, style: textStyle),
                    icon: isLoading
                        ? DemoCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return OutlinedButton(
                onPressed: (isLoading | !isEnabled) ? null : onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.color.primary),
                  backgroundColor: Colors.transparent,
                ),
                child: isLoading
                    ? DemoCircularLoading(
                        size: 24,
                        color: context.color.primary,
                      )
                    : Text(
                        text,
                        style: (textStyle ?? const TextStyle()).copyWith(
                          color: context.color.primary,
                        ),
                      ),
              );
            case TypeButton.tertiaryDanger:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : Text(text, style: textStyle),
                    icon: isLoading
                        ? DemoCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return OutlinedButton(
                onPressed: (isLoading | !isEnabled) ? null : onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: context.color.strokePrimary),
                  backgroundColor: Colors.transparent,
                ),
                child: isLoading
                    ? DemoCircularLoading(
                        size: 24,
                        color: context.color.primary,
                      )
                    : Text(
                        text,
                        style: (textStyle ?? const TextStyle()).copyWith(
                          color: context.color.alert,
                        ),
                      ),
              );
            default:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : Text(text, style: textStyle),
                    icon: isLoading
                        ? DemoCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return TextButton(
                onPressed: (isLoading | !isEnabled) ? null : onPressed,
                style: style,
                child: isLoading
                    ? DemoCircularLoading(
                        size: 24, color: context.color.primary)
                    : Text(text, style: textStyle),
              );
          }
        },
      ),
    );
  }
}
