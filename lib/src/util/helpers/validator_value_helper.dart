import 'package:flutter/material.dart' show BuildContext;
import 'package:sera_test/src/theme/components/demo_text_field/show_status_message.dart';
import 'package:sera_test/src/theme/components/demo_text_field/validator_value.dart';

abstract class ValidatorValueHelper {
  static ValidatorValue? validatorUsername(BuildContext context, String value) {
    if (value.isEmpty) {
      return const ValidatorValue(
        message: "",
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorPassword(BuildContext context, String value) {
    if (value.isEmpty) {
      return const ValidatorValue(
        message: "",
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }
}
