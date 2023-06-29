import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/app/main.reflectable.dart';
import 'package:petsus/base/theme_app.dart';
import 'package:petsus/util/resources/resources.dart';

void main() async {
  // await Configuration.load();

  initializeReflectable();
  // configureInjection(Configuration.environment);
  configureInjection(Environment.dev);

  WidgetsFlutterBinding.ensureInitialized();
  await loadBaseResources();

  runApp(const ThemeApp());
}