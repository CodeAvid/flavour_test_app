import 'package:flavour_test_app/config/flavour_config.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  FlavorManager.appFlavor = Flavor.STAGING;
  runApp(App());
}
