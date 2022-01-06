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
  final date = DateTime.tryParse(value);
  if (date == null) {
    return "invalid Date";
  }
}
