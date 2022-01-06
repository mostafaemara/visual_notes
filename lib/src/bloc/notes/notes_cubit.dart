import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visual_notes/src/data/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  void addNote(Note note) {}
  void updateNote(Note note) {}
  void deleteNote(String id) {}
}
