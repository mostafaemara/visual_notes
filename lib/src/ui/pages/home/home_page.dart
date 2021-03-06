import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';
import 'package:visual_notes/src/ui/pages/home/widgets/empty_notes.dart';
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
        title: const Text("Visual Notes"),
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) => state.notes.isEmpty
            ? const EmptyNotes()
            : NoteList(
                notes: state.notes,
              ),
      ),
    );
  }
}
