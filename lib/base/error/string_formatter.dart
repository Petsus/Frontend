import 'package:flutter/material.dart';

class StringFormatter {
  final String? messageString;
  final dynamic? error;

  StringFormatter({required this.messageString, required this.error});

  StringFormatter.empty()
      : messageString = null,
        error = null;
}

extension ErrorStringFormatter on dynamic {
  StringFormatter get messageError => StringFormatter(messageString: null, error: this);
}

extension SnackbarStringFormatter on StringFormatter? {
  SnackBar get snackBar => SnackBar(content: Text(this?.messageString ?? 'Error generic'));
}
