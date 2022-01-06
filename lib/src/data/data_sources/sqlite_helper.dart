// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class SqliteHelper {
//   static const String id = 'id';
//   static const String title = 'title';
//   static const String picture = 'picture';
//   static const String description = 'description';
//   static const String date = 'date';
//   static const String status = 'status';
//   static const String table = 'notes';
//   Database? _db;

//   Future<Database> _readDb() async {
  
//       final dbPath = await getDatabasesPath();
//       _db = await openDatabase(
//         join(dbPath, 'visual_notes.db'),
//         onCreate: (db, version) {
//           return db.execute(
//               "'CREATE TABLE $table($id INTEGER PRIMARY KEY, $title TEXT, $picture TEXT, $description TEXT, $date TEXT, $status TEXT)'");
//         },
//       );
 
//   }
// }
