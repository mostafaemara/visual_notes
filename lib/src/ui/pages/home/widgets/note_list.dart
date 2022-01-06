import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';
import 'package:visual_notes/src/data/models/note_status.dart';
import 'package:visual_notes/src/ui/pages/home/widgets/note_list_item.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key, required this.notes}) : super(key: key);
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteListItem(note: notes[index]),
    );
  }
}
