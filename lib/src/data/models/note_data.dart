import 'note_status.dart';

class NoteData {
  final String title;
  final String image;
  final String description;
  final DateTime date;
  final NoteStatus status;

  NoteData(
      {required this.title,
      required this.image,
      required this.description,
      required this.date,
      required this.status});
}
