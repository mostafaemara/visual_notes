import 'package:visual_notes/src/helpers/note_status_helper.dart';

import 'note_status.dart';

class NoteData {
  NoteData(
      {required this.title,
      required this.picture,
      required this.description,
      required this.date,
      required this.status});

  factory NoteData.fromMap(Map<String, dynamic> map) {
    final date = DateTime.parse(map["date"]);

    final noteStatus = map["status"] as String;
    return NoteData(
        title: map["title"],
        picture: map["picture"],
        description: map["description"],
        date: date,
        status: noteStatus.mapToNoteStatus());
  }

  final String title;
  final String picture;
  final String description;
  final DateTime date;
  final NoteStatus status;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "picture": picture,
      "description": description,
      "date": date.toIso8601String(),
      "status": status.mapToString()
    };
  }
}
