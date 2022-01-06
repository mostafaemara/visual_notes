import 'package:visual_notes/src/data/models/note_data.dart';

class Note {
  final String id;
  final NoteData data;

  Note({
    required this.data,
    required this.id,
  });
}
