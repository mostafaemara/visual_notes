import 'package:flutter/material.dart';

import 'package:visual_notes/src/ui/pages/note/note_page.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(NotePage.routeName);
      },
      child: const Icon(Icons.add),
    );
  }
}
