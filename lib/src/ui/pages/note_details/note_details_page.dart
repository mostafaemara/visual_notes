import 'package:flutter/material.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/ui/pages/new_note/new_note_page.dart';
import 'package:visual_notes/src/ui/pages/note_details/widgets/confirm_delete_dialog.dart';
import "../../../helpers/note_status_helper.dart";
import "../../../helpers/image_helper.dart";
import "../../../helpers/datetime_helper.dart";
import 'widgets/note_details_section.dart';
import "package:provider/provider.dart";

class NoteDetailsPage extends StatelessWidget {
  static const routeName = "/note-details";
  const NoteDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note;
    return Provider<Note>.value(
      value: note,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            EditeNoteButton(),
            DeleteNoteButton(),
          ],
        ),
        body: SingleChildScrollView(
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
      ),
    );
  }
}

class NoteImage extends StatelessWidget {
  const NoteImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = context.read<Note>().data.picture;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.memory(image.base64ToImage()),
    );
  }
}

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showConfirmDeleteDialog(context);
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  _showConfirmDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ConfirmDeleteDialog(),
    );
  }
}

class EditeNoteButton extends StatelessWidget {
  const EditeNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = context.read<Note>();
    return IconButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NewNotePage.routeName, arguments: note);
        },
        icon: const Icon(Icons.edit));
  }
}
