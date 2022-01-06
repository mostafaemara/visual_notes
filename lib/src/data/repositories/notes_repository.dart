import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';

abstract class VisualNotesRepository {
  Future<List<Note>> readAllVisualNotes();
  Future<void> editeVisualNote(Note visualNote);
  Future<void> addVisualNote(NoteData data);
  Future<void> deleteVisualNote(String id);
}
