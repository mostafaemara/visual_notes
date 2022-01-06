import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/bloc/new_note/new_note_cubit.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';
import 'package:visual_notes/src/ui/pages/new_note/widgets/note_form.dart';

class NewNotePage extends StatelessWidget {
  static const routeName = "/new-note";
  const NewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewNoteCubit(BlocProvider.of<NotesCubit>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              NoteForm(),
            ],
          )),
        ),
      ),
    );
  }
}
