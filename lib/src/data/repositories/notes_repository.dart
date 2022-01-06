import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';

abstract class NotesRepository {
  Future<List<Note>> readAllNotes();
  Future<void> updateNote(Note note);
  Future<int> addNote(NoteData data);
  Future<void> deleteNote(int id);
}
