import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:visual_notes/src/bloc/note/note_cubit.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';
import 'package:visual_notes/src/data/models/note.dart';

import 'widgets/body.dart';
import 'widgets/delete_note_button.dart';
import 'widgets/edite_note_button.dart';

import "package:provider/provider.dart";

class NoteDetailsPage extends StatelessWidget {
  static const routeName = "/note-details";
  const NoteDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note;
    return Provider<Note>.value(
      value: note,
      child: BlocProvider(
        create: (context) => NoteCubit(BlocProvider.of<NotesCubit>(context)),
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              EditeNoteButton(),
              DeleteNoteButton(),
            ],
          ),
          body: const Body(),
        ),
      ),
    );
  }
}
