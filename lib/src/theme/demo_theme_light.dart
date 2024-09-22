import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/demo_colors.dart';
import 'package:sera_test/src/theme/demo_theme.dart';

final class DemoThemeLight extends DemoTheme {
  @override
  DemoColors get demoColors => DemoColors();

  @override
  ThemeData get rawThemeData => ThemeData.light();

  @override
  ColorScheme get colorScheme => ColorScheme.light(
        primary: demoColors.primary,
        error: demoColors.alert,
      );
}
