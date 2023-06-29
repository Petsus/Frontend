
import 'package:flutter/material.dart';

enum DimenApp {
  marginDefault,
  marginSmall,
  paddingDefault,
  padding05,

  textSmall,

  borderRadius,
  borderRadius05,
}

extension SelectedDimenApp on DimenApp {

  double get size {
    switch (this) {
      case DimenApp.marginDefault: return 40.0;
      case DimenApp.marginSmall: return 16.0;
      case DimenApp.paddingDefault: return 16.0;
      case DimenApp.padding05: return 8.0;
      case DimenApp.textSmall: return 12.0;
      case DimenApp.borderRadius: return 16.0;
      case DimenApp.borderRadius05: return 8.0;
    }
  }

  EdgeInsets get all => EdgeInsets.all(size);

  BorderRadius get radius => BorderRadius.circular(size);
}