import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:visual_notes/src/bloc/note/note_cubit.dart';

import 'package:visual_notes/src/data/models/note.dart';

import 'confirm_delete_dialog.dart';

class DeleteNoteButton extends StatefulWidget {
  const DeleteNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteNoteButton> createState() => _DeleteNoteButtonState();
}

class _DeleteNoteButtonState extends State<DeleteNoteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showConfirmDeleteDialog();
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  _showConfirmDeleteDialog() {
    final note = context.read<Note>();
    final noteCubit = BlocProvider.of<NoteCubit>(context);
    showDialog(
        context: context,
        builder: (_) => BlocProvider<NoteCubit>.value(
              value: noteCubit,
              child: Provider.value(
                value: note,
                child: const ConfirmDeleteDialog(),
              ),
            ));
  }
}
