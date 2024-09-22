import 'package:flutter/widgets.dart';

extension DemoColorExtension on BuildContext {
  DemoColors get color => DemoColors.of(this);
}

final class DemoColors {
  static final DemoColors _instance = DemoColors._();

  factory DemoColors() {
    return _instance;
  }

  DemoColors._();

  static DemoColors of(BuildContext context) {
    return DemoColors();
  }

  Color get primary => const Color(0xFFF15A24);

  Color get primary400 => const Color(0xFFF68D59);

  Color get primary200 => const Color(0xFFFFE7DA);

  Color get primary100 => const Color(0xFFFEEAD3);

  Color get primary90 => const Color(0xFFFEF0DE);

  Color get primary80 => const Color(0xFFFEF5E4);

  Color get primary70 => const Color(0xFFFEF9ED);

  Color get primary60 => const Color(0xFFFEFCF6);

  Color get secondary90 => const Color(0xFFFFFAD8);

  Color get accent => const Color(0xFF8C7FCB);

  Color get accent100 => const Color(0xFFF4F0FE);

  Color get tertiary => const Color(0xFF6A4BE7);

  Color get rcSecondary800 => const Color(0xFF931F5D);

  Color get rcSecondary100 => const Color(0xFFFFE4E0);

  Color get rcSecondary80 => const Color(0xFFFFF1EC);

  Color get rcSecondary70 => const Color(0xFFFFF7F2);

  Color get black400 => const Color(0xFF949494);

  Color get black90 => const Color(0xFFF9F9F9);

  Color get info => const Color(0xFF0172CB);

  Color get success => const Color(0xFF12B76A);

  Color get success400 => const Color(0xFF95DC66);

  Color get success200 => const Color(0xFFE1F5DD);

  Color get success100 => const Color(0xFFEDFCD8);

  Color get warning => const Color(0xFFF79009);

  Color get warning100 => const Color(0xFFFDF4CE);

  Color get warning80 => const Color(0xFFFEFAE2);

  Color get alert => const Color(0xFFB22421);

  Color get alert200 => const Color(0xFFFDC5B1);

  Color get alert100 => const Color(0xFFFEE5D8);

  Color get alert90 => const Color(0xFFFEEDE1);

  Color get bgWindow => const Color(0xFFFFFFFF);

  Color get bgGray => const Color(0xFFEFF1F5);

  Color get bgError => const Color(0xFFFFEBEB);

  Color get bgInfo => const Color(0xFFE9F3FF);

  Color get bgSuccess => const Color(0xFFECFFEE);

  Color get bgWarning => const Color(0xFFFFF9E3);

  Color get bgCard => const Color(0xFFF5F7F9);

  Color get bgTextField => const Color(0xFFFAFAFA);

  Color get bgPinField => const Color(0xFFF5F5F5);

  Color get bgDisabled => const Color(0xFFABAEB8);

  Color get textPrimary => const Color(0xFF101828);

  Color get textPrimaryInverse => const Color(0xFFFFFFFF);

  Color get textSecondary => const Color(0xFF667085);

  Color get textHint => const Color(0xFF98A2B3);

  Color get strokePrimary => const Color(0xFFCFD3DB);

  Color get strokeSecondary => const Color(0xFFECECEC);

  Color get iconPrimary => const Color(0xFF2F384C);

  Color get iconSecondary => const Color(0xFF949494);

  Color get dash => const Color(0xFFEFF9FF);

  Color get ratingActive => const Color(0xFFFFC107);

  Color get ratingInactive => const Color(0xFFC2C2C2);
}
