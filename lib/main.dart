import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:petsus/base/app.dart';
import 'package:petsus/injection.dart';
import 'package:petsus/main.reflectable.dart';
import 'package:petsus/util/resources/resources.dart';

void main() async {
  initializeReflectable();
  configureInjection(Environment.dev);

  WidgetsFlutterBinding.ensureInitialized();
  await loadBaseResources();

  runApp(const ThemeApp());
}