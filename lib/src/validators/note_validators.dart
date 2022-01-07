import 'package:intl/intl.dart';

String? titleValidator(String? value) {
  if (value == null) {
    return "Required title please enter value";
  }
  if (value.isEmpty) {
    return "Required title please enter value";
  }
  if (value.length > 50) {
    return "title too long max char is 50";
  }
}

String? descriptionValidator(String? value) {
  if (value == null) {
    return "Required  description please enter value";
  }
  if (value.isEmpty) {
    return "Required description please enter value";
  }
  if (value.length > 240) {
    return "Description is too long max char is 240";
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
    DateFormat("yyyy-MM-dd HH:mm").parse(value);
  } catch (e) {
    return "invalid Date";
  }
}
