import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/app/main.reflectable.dart';
import 'package:petsus/base/theme_app.dart';
import 'package:petsus/util/resources/resources.dart';

// await Configuration.load();
// configureInjection(Configuration.environment);
void main() async {
  initializeReflectable();
  configureInjection(Environment.dev);

  WidgetsFlutterBinding.ensureInitialized();
  await loadBaseResources();

  runApp(const ThemeApp());
}