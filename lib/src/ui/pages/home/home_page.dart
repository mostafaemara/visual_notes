import 'package:flutter/material.dart';
import 'package:visual_notes/src/ui/pages/home/widgets/note_list.dart';

import 'widgets/add_note_button.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddNoteButton(),
      appBar: AppBar(
        title: Text("Chair Notes"),
      ),
      body: NoteList(),
    );
  }
}