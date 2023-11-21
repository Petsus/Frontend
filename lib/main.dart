import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/base/theme_app.dart';
import 'package:petsus/injection/injection.dart';
import 'package:petsus/main.reflectable.dart';
import 'package:petsus/util/resources/resources.dart';

// ignore:unused_import
import 'package:petsus/api/model/model.dart';

// await Configuration.load();
// configureInjection(Configuration.environment);
void main() async {
  initializeReflectable();
  configureInjection(Environment.prod);

  WidgetsFlutterBinding.ensureInitialized();
  await loadBaseResources();

  runApp(const ThemeApp());
}