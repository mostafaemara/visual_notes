import 'package:flutter/material.dart';
import 'package:visual_notes/src/validators/note_validators.dart';
import "../../../../helpers/datetime_helper.dart";

class DateFormField extends StatefulWidget {
  const DateFormField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  _DateFormFieldState();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: dateValidator,
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: _handleDatePicker, icon: const Icon(Icons.date_range)),
          hintText: "Date"),
    );
  }

  void _handleDatePicker() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (date != null) {
      widget.controller.text = date.formatToString();
    }
  }
}
