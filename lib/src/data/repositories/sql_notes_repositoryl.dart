import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';

import 'notes_repository.dart';

class SqlNotesRepository implements VisualNotesRepository {
  Database? _db;

  static const String id = 'id';
  static const String title = 'title';
  static const String picture = 'picture';
  static const String description = 'description';
  static const String date = 'date';
  static const String status = 'status';
  static const String table = 'notes';

  @override
  Future<void> addVisualNote(NoteData visualNote) async {
    return;
  }

  @override
  Future<void> deleteVisualNote(String id) {
    // TODO: implement deleteVisualNote
    throw UnimplementedError();
  }

  @override
  Future<void> editeVisualNote(Note visualNote) {
    // TODO: implement editeVisualNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> readAllVisualNotes() {
    // TODO: implement readAllVisualNotes
    throw UnimplementedError();
  }

  void _initDb() async {
    if (_db == null) {
      final dbPath = await getDatabasesPath();
      _db = await openDatabase(
        join(dbPath, 'visual_notes.db'),
        onCreate: (db, version) {
          return db.execute(
              "'CREATE TABLE $table($id INTEGER PRIMARY KEY, $title TEXT, $picture TEXT, $description TEXT, $date TEXT, $status TEXT)'");
        },
      );
    }
  }

  // void _closeDb() {
  //   _db?.close();
  // }

  // void _insert(VisualNoteData data) async{

  //   await _db.
  // }
}
