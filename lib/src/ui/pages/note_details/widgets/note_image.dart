import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/helpers/image_helper.dart';

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
