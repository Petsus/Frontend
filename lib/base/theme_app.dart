import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:petsus/app/injection.dart';
import 'package:petsus/page/login/screen/login_page.dart';
import 'package:petsus/page/tcc/tcc_page.dart';
import 'package:petsus/util/resources/app_color.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/tcc': (context) => const TccPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      darkTheme: _themeData(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.trackpad,
      }),
      home: LoginPage(
        router: getIt.get(),
        viewModel: getIt.get(),
      ),
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(ColorApp.tertiary.color.withOpacity(0.4)),
      ),
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
          labelStyle: TextStyle(
            color: ColorApp.onBackground.color,
          ),
          hintStyle: TextStyle(
            color: ColorApp.onBackground.color,
          )),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ColorApp.onBackground.color,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        titleMedium: TextStyle(
          color: ColorApp.onBackground.color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
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
      ),
      highlightColor: ColorApp.primary.color.withOpacity(0.8),
    );
  }
}
