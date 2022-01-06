import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static const String id = 'id';
  static const String title = 'title';
  static const String picture = 'picture';
  static const String description = 'description';
  static const String date = 'date';
  static const String status = 'status';
  static const String table = 'notes';
  Database? _db;

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, 'visual_notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $title TEXT, $picture BLOB, $description TEXT, $date TEXT, $status TEXT)');
    }, version: 1);

    return db;
  }

  Future<Database> get db async {
    return _db ??= await _initDb();
  }
}
