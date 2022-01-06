import 'package:visual_notes/src/data/models/note_status.dart';

extension NoteStatusToString on NoteStatus {
  String mapToString() {
    switch (this) {
      case NoteStatus.open:
        return "open";

      case NoteStatus.closed:
        return "closed";
    }
  }
}

extension NoteStatusfromString on String {
  NoteStatus mapToNoteStatus() {
    switch (this) {
      case "open":
        return NoteStatus.open;
      case "closed":
        return NoteStatus.closed;
      default:
        throw Exception("invalid Note status type");
    }
  }
}
