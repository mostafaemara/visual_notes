import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visual_notes/src/bloc/new_note/new_note_cubit.dart';
import 'package:visual_notes/src/data/models/note.dart';

class ConfirmDeleteButton extends StatelessWidget {
  const ConfirmDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteId = context.read<Note>().id;
    return SizedBox(
      height: 50,
      width: 100,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            BlocProvider.of<NewNoteCubit>(context).deleteNote(noteId);
          },
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.error,
              onPrimary: Theme.of(context).colorScheme.onError),
          child: const Text("Delete", style: TextStyle())),
    );
  }
}
