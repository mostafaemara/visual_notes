import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note_status.dart';

class StatusFormField extends StatelessWidget {
  const StatusFormField(
      {Key? key, required this.onChanged, required this.selectedStatus})
      : super(key: key);
  final void Function(NoteStatus?) onChanged;
  final NoteStatus? selectedStatus;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<NoteStatus>(
        onChanged: onChanged,
        hint: const Text("Status"),
        value: selectedStatus,
        items: const [
          DropdownMenuItem(
            child: Text("Open"),
            value: NoteStatus.open,
          ),
          DropdownMenuItem(
            child: Text("Closed"),
            value: NoteStatus.closed,
          )
        ]);
  }
}
