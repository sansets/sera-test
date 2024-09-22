import 'package:flutter/material.dart';

enum DemoTextTheme {
  displayLarge(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  displayMedium(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.16,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  displaySmall(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.22,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineLarge(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.25,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineMedium(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.29,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineSmall(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleLarge(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.27,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleMedium(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleSmall(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelLarge(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelMedium(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelSmall(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      height: 1.45,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodyLarge(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodyMedium(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodySmall(
    TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );

  const DemoTextTheme(this.textStyle);

  final TextStyle textStyle;

  static TextTheme get textTheme => TextTheme(
        displayLarge: DemoTextTheme.displayLarge.textStyle,
        displayMedium: DemoTextTheme.displayMedium.textStyle,
        displaySmall: DemoTextTheme.displaySmall.textStyle,
        headlineLarge: DemoTextTheme.headlineLarge.textStyle,
        headlineMedium: DemoTextTheme.headlineMedium.textStyle,
        headlineSmall: DemoTextTheme.headlineSmall.textStyle,
        titleLarge: DemoTextTheme.titleLarge.textStyle,
        titleMedium: DemoTextTheme.titleMedium.textStyle,
        titleSmall: DemoTextTheme.titleSmall.textStyle,
        labelLarge: DemoTextTheme.labelLarge.textStyle,
        labelMedium: DemoTextTheme.labelMedium.textStyle,
        labelSmall: DemoTextTheme.labelSmall.textStyle,
        bodyLarge: DemoTextTheme.bodyLarge.textStyle,
        bodyMedium: DemoTextTheme.bodyMedium.textStyle,
        bodySmall: DemoTextTheme.bodySmall.textStyle,
      );
}

class GitsText extends StatelessWidget {
  const GitsText.displayLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.displayLarge;
  const GitsText.displayMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.displayMedium;
  const GitsText.displaySmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.displaySmall;
  const GitsText.headlineLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.headlineLarge;
  const GitsText.headlineMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.headlineMedium;
  const GitsText.headlineSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.headlineSmall;
  const GitsText.titleLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.titleLarge;
  const GitsText.titleMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.titleMedium;
  const GitsText.titleSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.titleSmall;
  const GitsText.labelLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.labelLarge;
  const GitsText.labelMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.labelMedium;
  const GitsText.labelSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.labelSmall;
  const GitsText.bodyLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.bodyLarge;
  const GitsText.bodyMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.bodyMedium;
  const GitsText.bodySmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = DemoTextTheme.bodySmall;

  final String text;
  final TextStyle? style;
  final DemoTextTheme textTheme;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTheme.textStyle
          .copyWith(color: color, fontWeight: fontWeight)
          .merge(style),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
