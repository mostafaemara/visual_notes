import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';
import 'package:visual_notes/src/data/models/note_status.dart';
import 'package:visual_notes/src/ui/pages/home/widgets/note_list_item.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);
  List<Note> notes = List.generate(
      10,
      (index) => Note(
            data: NoteData(
                title: "title",
                status: NoteStatus.open,
                image: "asdasdasd",
                description: "asdasdasdasd",
                date: DateTime.now()),
            id: index.toString(),
          ));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteListItem(visualNote: notes[index]),
    );
  }
}
