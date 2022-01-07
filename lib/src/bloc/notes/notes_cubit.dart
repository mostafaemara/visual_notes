import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visual_notes/injection.dart';
import "../../helpers/note_list_helper.dart";
import 'package:visual_notes/src/data/models/note.dart';
import 'package:visual_notes/src/data/repositories/notes_repository.dart';
part "notes_state.dart";
part "notes_cubit.freezed.dart";

class NotesCubit extends Cubit<NotesState> {
  final _noteRepo = locator<NotesRepository>();
  NotesCubit() : super(const NotesState(notes: [], isLoading: true));
  void init() async {
    try {
      final notes = await _noteRepo.readAllNotes();
      emit(state.copyWith(isLoading: false, notes: notes));
    } catch (e) {
      throw Exception("Somthing Wrong Happend App Should crash!");
    }
  }

  void addNote(Note note) {
    final notes = [...state.notes, note];
    emit(state.copyWith(notes: notes));
  }

  void updateNote(Note note) {
    var notes = [...state.notes];

    notes.update(note);
    emit(state.copyWith(notes: notes));
  }

  void deleteNote(int id) {
    var notes = [...state.notes];
    notes.deleteById(id);
    emit(state.copyWith(notes: notes));
  }
}
