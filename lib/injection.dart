import 'package:get_it/get_it.dart';
import 'package:visual_notes/src/data/repositories/notes_repository.dart';

import 'src/data/repositories/sql_notes_repositoryl.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<NotesRepository>(SqlNotesRepository());
}
