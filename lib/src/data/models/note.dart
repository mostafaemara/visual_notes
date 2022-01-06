import 'package:visual_notes/src/data/models/note_data.dart';

class Note {
  final int id;
  final NoteData data;

  Note({
    required this.data,
    required this.id,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(data: NoteData.fromMap(map), id: map["id"]);
  }
}
