import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:visual_notes/src/bloc/new_note/new_note_cubit.dart';
import 'package:visual_notes/src/bloc/submission_state.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/helpers/datetime_helper.dart';
import 'package:visual_notes/src/helpers/note_status_helper.dart';
import 'package:visual_notes/src/ui/widgets/error_dialog.dart';
import 'package:visual_notes/src/ui/widgets/loading_dialog.dart';

import 'note_details_section.dart';
import 'note_image.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = context.read<Note>();
    return BlocListener<NewNoteCubit, SubmissionState<String>>(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const NoteImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    note.data.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  NoteDetailsSection(
                    title: "Description",
                    body: note.data.description,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  NoteDetailsSection(
                    title: "Date",
                    body: note.data.date.formatToString(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  NoteDetailsSection(
                    title: "Status",
                    body: note.data.status.mapToString(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      listener: (context, state) {
        state.whenOrNull(
          submitting: () => _showLoadingDialog(context),
          failed: (error) => _showErrorDialog(error, context),
          success: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LoadingDialog(),
    );
  }

  void _showErrorDialog(String message, BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
              title: "An error occurred",
              body: message,
            ));
  }
}
