
import 'package:flutter/material.dart';

enum DimenApp {
  marginDefault,
  paddingDefault,
  padding05,

  textSmall,
}

extension SelectedDimenApp on DimenApp {

  double get size {
    switch (this) {
      case DimenApp.marginDefault: return 40.0;
      case DimenApp.paddingDefault: return 16.0;
      case DimenApp.padding05: return 8.0;
      case DimenApp.textSmall: return 12.0;
    }
  }

  EdgeInsets get all => EdgeInsets.all(size);
}