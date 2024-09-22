import 'package:flutter/material.dart';
import 'package:sera_test/src/theme/components/demo_text.dart';
import 'package:sera_test/src/theme/demo_colors.dart';

abstract base class DemoTheme {
  DemoColors get demoColors;
  ThemeData get rawThemeData;
  ColorScheme get colorScheme;

  TextTheme get _getTextTheme => DemoTextTheme.textTheme.copyWith(
        displayLarge: DemoTextTheme.displayLarge.textStyle
            .copyWith(color: demoColors.textSecondary),
        displayMedium: DemoTextTheme.displayMedium.textStyle
            .copyWith(color: demoColors.textSecondary),
        displaySmall: DemoTextTheme.displaySmall.textStyle
            .copyWith(color: demoColors.textSecondary),
        headlineLarge: DemoTextTheme.headlineLarge.textStyle
            .copyWith(color: demoColors.textSecondary),
        headlineMedium: DemoTextTheme.headlineMedium.textStyle
            .copyWith(color: demoColors.textSecondary),
        headlineSmall: DemoTextTheme.headlineSmall.textStyle
            .copyWith(color: demoColors.textSecondary),
        titleLarge: DemoTextTheme.titleLarge.textStyle
            .copyWith(color: demoColors.textPrimary),
        titleMedium: DemoTextTheme.titleMedium.textStyle
            .copyWith(color: demoColors.textPrimary),
        titleSmall: DemoTextTheme.titleSmall.textStyle
            .copyWith(color: demoColors.textPrimary),
        labelLarge: DemoTextTheme.labelLarge.textStyle
            .copyWith(color: demoColors.textSecondary),
        labelMedium: DemoTextTheme.labelMedium.textStyle
            .copyWith(color: demoColors.textSecondary),
        labelSmall: DemoTextTheme.labelSmall.textStyle
            .copyWith(color: demoColors.textSecondary),
        bodyLarge: DemoTextTheme.bodyLarge.textStyle
            .copyWith(color: demoColors.textSecondary),
        bodyMedium: DemoTextTheme.bodyMedium.textStyle
            .copyWith(color: demoColors.textSecondary),
        bodySmall: DemoTextTheme.bodySmall.textStyle
            .copyWith(color: demoColors.textSecondary),
      );

  ThemeData get themeData => rawThemeData.copyWith(
        scaffoldBackgroundColor: demoColors.bgWindow,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: demoColors.bgWindow,
          foregroundColor: demoColors.textPrimary,
          titleTextStyle: _getTextTheme.titleLarge,
          surfaceTintColor: demoColors.bgWindow,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: demoColors.textPrimary,
          unselectedLabelColor: demoColors.textSecondary,
          labelStyle: _getTextTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          unselectedLabelStyle: _getTextTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2,
              color: demoColors.primary,
            ),
            insets: const EdgeInsets.symmetric(horizontal: 24.0),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(1),
              topRight: Radius.circular(1),
            ),
          ),
        ),
        colorScheme: colorScheme,
        textTheme: _getTextTheme,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: demoColors.primary,
          foregroundColor: demoColors.bgWindow,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle:
              _getTextTheme.bodyMedium?.apply(color: demoColors.textHint),
          fillColor: demoColors.bgTextField,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: demoColors.bgTextField, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: demoColors.primary, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: demoColors.bgTextField, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: demoColors.alert, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: demoColors.bgTextField, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(44),
            minimumSize: const Size.fromHeight(44),
            textStyle: _getTextTheme.titleSmall,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            backgroundColor: demoColors.primary,
            disabledBackgroundColor: demoColors.bgDisabled,
            foregroundColor: demoColors.textPrimaryInverse,
            disabledForegroundColor: demoColors.textPrimaryInverse,
            shadowColor: demoColors.strokeSecondary.withOpacity(0.25),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: demoColors.primary.withOpacity(0.16),
            disabledBackgroundColor: demoColors.bgDisabled.withOpacity(0.16),
            fixedSize: const Size.fromHeight(44),
            side: BorderSide(
              width: 1,
              color: demoColors.primary.withOpacity(0.16),
            ),
            textStyle: _getTextTheme.titleSmall,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: _getTextTheme.labelLarge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      );
}
