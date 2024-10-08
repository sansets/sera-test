import 'package:flutter/material.dart';
import 'package:sera_test/src/locator.dart';

import 'src/app.dart';

void main() async {
  setupLocator();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const MyApp());
}
