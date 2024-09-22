import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get s => AppLocalizations.of(this) ?? AppLocalizationsEn();
}
