import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  String formatToString() {
    return DateFormat("yyyy-MM-dd HH:mm").format(this);
  }
}
