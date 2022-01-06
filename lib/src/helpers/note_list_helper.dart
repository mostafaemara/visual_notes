import 'dart:developer';

import 'package:visual_notes/src/data/models/note.dart';

extension NoteListHelper on List<Note> {
  deleteById(int id) {
    removeWhere((element) => element.id == id);
  }

  update(Note note) {
    final index = indexWhere((element) => element.id == note.id);
    log("count =" + length.toString());
    removeAt(index);
    log("count =" + length.toString());
    insert(index, note);
    log("count =" + length.toString());
  }
}
