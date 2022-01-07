import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/bloc/note/note_cubit.dart';

import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';
import 'package:visual_notes/src/data/models/note.dart';

import 'widgets/note_form.dart';

class NotePage extends StatelessWidget {
  static const routeName = "/new-note";
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note?;
    return BlocProvider(
      create: (context) => NoteCubit(BlocProvider.of<NotesCubit>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: note == null ? const Text("New Note") : Text(note.data.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              NoteForm(
                note: note,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
