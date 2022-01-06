import 'dart:developer';

import 'package:visual_notes/src/data/data_sources/sqlite_helper.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';

import 'notes_repository.dart';

class SqlNotesRepository implements NotesRepository {
  final _dbHelper = SqliteHelper();

  @override
  Future<int> addNote(NoteData noteData) async {
    final db = await _dbHelper.db;
    final id = await db.insert(SqliteHelper.table, noteData.toMap());
    return id;
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteVisualNote
    throw UnimplementedError();
  }

  @override
  Future<void> editeNote(Note visualNote) {
    // TODO: implement editeVisualNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> readAllNotes() async {
    try {
      final db = await _dbHelper.db;
      final maps = await db.query(SqliteHelper.table);
      return _mapListToNotes(maps);
    } catch (e) {
      log("readallNotes error: " + e.toString());
      rethrow;
    }
  }

  List<Note> _mapListToNotes(List<Map<String, dynamic>> maps) {
    final List<Note> notes = [];
    for (final map in maps) {
      notes.add(Note.fromMap(map));
    }
    return notes;
  }
}
