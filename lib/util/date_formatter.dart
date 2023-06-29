
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
    String get formatted {
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return formatter.format(toUtc());
    }

    String parseFormatted({String pattern = 'dd/MM/yyyy'}) {
      final formatter = DateFormat(pattern);
      return formatter.format(toUtc());
    }
}

extension StringDateTimeExtension on String {
  String parseTime({String pattern = 'dd/MM/yyyy'}) {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final parseDate = formatter.parse(this, true);

    formatter = DateFormat(pattern);
    return formatter.format(parseDate.toLocal());
  }
}