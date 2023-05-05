import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:petsus/util/loader_json.dart';

late Map<String, dynamic> _whiteColor;
late Map<String, dynamic> _darkColor;

Future loadColors() async {
  _whiteColor = await localJson("color.json", namespace: "resources");
  _darkColor = await localJson("night-color.json", namespace: "resources");
}

enum ColorApp {
  primary,
  primaryContainer,
  secondary,
  secondaryContainer,
  tertiary,
  tertiaryContainer,
  error,
  errorContainer,
  background,
  surface,
  surfaceVariant,
  outline,
  inverseSurface,
  inversePrimary,
  shadow,
  surfaceTint,
  onPrimary,
  onPrimaryContainer,
  onSecondary,
  onSecondaryContainer,
  onTertiary,
  onTertiaryContainer,
  onError,
  onErrorContainer,
  onBackground,
  onSurface,
  onSurfaceVariant,
  inverseOnSurface
}

extension SelectedAppColor on ColorApp {
  Color get color {
    var currentTheme = SchedulerBinding.instance.platformDispatcher.platformBrightness;

    final String colorString;
    if (currentTheme == Brightness.dark) {
      colorString = _darkColor[name]! as String;
    } else {
      colorString = _whiteColor[name]! as String;
    }

    return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
  }
}
