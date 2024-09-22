import 'package:flutter/material.dart' show BuildContext, ValueKey;
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/theme/components/demo_snackbar.dart';

import 'snackbar_extension.dart';

extension DemoFailureExtension on DemoFailure {
  void showSnackbar(BuildContext context) => context.showSnackBar(
        DemoSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: message,
        ),
      );
}
