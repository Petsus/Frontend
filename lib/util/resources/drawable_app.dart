
import 'package:flutter/material.dart';

enum DrawableApp {
  icon
}

extension SelectedDrawableApp on DrawableApp {

  String get name {
    switch (this) {
      case DrawableApp.icon: return 'images/icon.png';
    }
  }

  Image get image => Image.asset(name);

}