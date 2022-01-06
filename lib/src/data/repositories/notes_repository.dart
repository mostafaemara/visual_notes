import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';

abstract class NotesRepository {
  Future<List<Note>> readAllNotes();
  Future<void> editeNote(Note note);
  Future<String> addNote(NoteData data);
  Future<void> deleteNote(String id);
}
