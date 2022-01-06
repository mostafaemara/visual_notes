import 'package:bloc/bloc.dart';
import 'package:visual_notes/injection.dart';
import 'package:visual_notes/src/bloc/notes/notes_cubit.dart';

import 'package:visual_notes/src/bloc/submission_state.dart';
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/models/note_data.dart';
import 'package:visual_notes/src/data/repositories/notes_repository.dart';

class NewNoteCubit extends Cubit<SubmissionState<String>> {
  final _notesRepository = locator<NotesRepository>();
  final NotesCubit _notesCubit;

  NewNoteCubit(this._notesCubit) : super(const SubmissionState.idle());

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
}
