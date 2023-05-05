import 'package:flutter/material.dart';
import 'package:petsus/page/login/login_page.dart';
import 'package:petsus/util/resources/app_color.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      darkTheme: _themeData(),
      home: LoginPage(),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: ColorApp.background.color,
      ),
      scaffoldBackgroundColor: ColorApp.background.color,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.outline.color),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.outline.color),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.onSurfaceVariant.color),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ColorApp.onBackground.color,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        titleMedium: TextStyle(
          color: ColorApp.onBackground.color,
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          color: ColorApp.onBackground.color,
          fontSize: 12,
        ),
        bodyLarge: TextStyle(
          color: ColorApp.onBackground.color,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyMedium: TextStyle(
          color: ColorApp.onBackground.color,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: ColorApp.onBackground.color,
          fontSize: 12,
        ),
      )
    );
  }
}
