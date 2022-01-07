import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/ui/pages/note/note_page.dart';

class EditeNoteButton extends StatelessWidget {
  const EditeNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = context.read<Note>();
    return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NotePage.routeName, arguments: note);
        },
        icon: const Icon(Icons.edit));
  }
}
