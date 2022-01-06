import 'package:intl/intl.dart';

String? fieldValidator(String? value) {
  if (value == null) {
    return "Required field please enter value";
  }
  if (value.isEmpty) {
    return "Required field please enter value";
  }
}

String? dateValidator(String? value) {
  if (value == null) {
    return "please select Date";
  }
  if (value.isEmpty) {
    return "please select Date";
  }
  try {
    DateFormat.yMd().parse(value);
  } catch (e) {
    return "invalid Date";
  }
}
