part of "notes_cubit.dart";

@freezed
class NotesState with _$NotesState {
  const factory NotesState(
      {required List<Note> notes, required bool isLoading}) = _NoteState;
}
