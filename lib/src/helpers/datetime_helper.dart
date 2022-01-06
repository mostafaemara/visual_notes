import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  String formatToString() {
    return DateFormat.yMd().format(this);
  }
}
