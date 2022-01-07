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
              onPressed: _handleDateTimePicker,
              icon: const Icon(Icons.date_range)),
          hintText: "yyyy-MM-dd HH:mm"),
    );
  }

  void _handleDateTimePicker() async {
    var date = await _pickDate();

    if (date != null) {
      final time = await _pickTime();

      if (time != null) {
        date =
            DateTime(date.year, date.month, date.year, time.hour, time.minute);
        widget.controller.text = date.formatToString();
      }
    }
  }

  Future<DateTime?> _pickDate() async {
    return await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: DateTime.now(),
        currentDate: DateTime.now(),
        firstDate: DateTime(2022, 1, 1, 12),
        lastDate: DateTime.now());
  }

  Future<TimeOfDay?> _pickTime() async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
