// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotesStateTearOff {
  const _$NotesStateTearOff();

  _NoteState call({required List<Note> notes, required bool isLoading}) {
    return _NoteState(
      notes: notes,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $NotesState = _$NotesStateTearOff();

/// @nodoc
mixin _$NotesState {
  List<Note> get notes => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res>;
  $Res call({List<Note> notes, bool isLoading});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res> implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  final NotesState _value;
  // ignore: unused_field
  final $Res Function(NotesState) _then;

  @override
  $Res call({
    Object? notes = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NoteStateCopyWith<$Res> implements $NotesStateCopyWith<$Res> {
  factory _$NoteStateCopyWith(
          _NoteState value, $Res Function(_NoteState) then) =
      __$NoteStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes, bool isLoading});
}

/// @nodoc
class __$NoteStateCopyWithImpl<$Res> extends _$NotesStateCopyWithImpl<$Res>
    implements _$NoteStateCopyWith<$Res> {
  __$NoteStateCopyWithImpl(_NoteState _value, $Res Function(_NoteState) _then)
      : super(_value, (v) => _then(v as _NoteState));

  @override
  _NoteState get _value => super._value as _NoteState;

  @override
  $Res call({
    Object? notes = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_NoteState(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteState implements _NoteState {
  const _$_NoteState({required this.notes, required this.isLoading});

  @override
  final List<Note> notes;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'NotesState(notes: $notes, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteState &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$NoteStateCopyWith<_NoteState> get copyWith =>
      __$NoteStateCopyWithImpl<_NoteState>(this, _$identity);
}

abstract class _NoteState implements NotesState {
  const factory _NoteState(
      {required List<Note> notes, required bool isLoading}) = _$_NoteState;

  @override
  List<Note> get notes;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$NoteStateCopyWith<_NoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
