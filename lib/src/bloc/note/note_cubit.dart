import 'package:bloc/bloc.dart';
import 'package:visual_notes/injection.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';

import 'package:visual_notes/src/bloc/submission_state.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';
import 'package:visual_notes/src/data/repositories/notes_repository.dart';

class NoteCubit extends Cubit<SubmissionState<String>> {
  final _notesRepository = locator<NotesRepository>();
  final NotesCubit _notesCubit;

  NoteCubit(this._notesCubit) : super(const SubmissionState.idle());

  void addNote(NoteData noteData) async {
    try {
      emit(const SubmissionState.submitting());
      final noteId = await _notesRepository.addNote(noteData);
      final note = Note(data: noteData, id: noteId);
      _notesCubit.addNote(note);
      emit(const SubmissionState.success());
    } catch (e) {
      emit(const SubmissionState.failed(
          failure: "Somthing went wrong Please try again"));
    }
  }

  void updateNote(Note note) async {
    try {
      emit(const SubmissionState.submitting());
      await _notesRepository.updateNote(note);

      _notesCubit.updateNote(note);
      emit(const SubmissionState.success());
    } catch (e) {
      emit(const SubmissionState.failed(
          failure: "Somthing went wrong Please try again"));
    }
  }

  void deleteNote(int id) async {
    try {
      emit(const SubmissionState.submitting());
      await _notesRepository.deleteNote(id);

      _notesCubit.deleteNote(id);
      emit(const SubmissionState.success());
    } catch (e) {
      emit(const SubmissionState.failed(
          failure: "Somthing went wrong Please try again"));
    }
  }
}
