import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database? _database;
  static const String DATABASE_NAME = "NoteDatabase.db";
  static const String TABLE_NAME = 'note_table';
  static const DATABASE_VERSION = 1;
  static const COLUMN_ID = 'id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_CONTENT = 'content';
  static const COLUMN_CATEGORY = 'category';

  ///singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = "$docDirectory$DATABASE_NAME";
    return await openDatabase(path, version: DATABASE_VERSION,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $TABLE_NAME(
            $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_TITLE TEXT NOT NULL,
            $COLUMN_CONTENT TEXT NOT NULL,
            $COLUMN_CATEGORY TEXT
          )
          ''');
    });
  }

  Future<int> insertNote(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(TABLE_NAME, row);
  }

  Future<List<Map<String, dynamic>>> queryAllNotes() async {
    Database? db = await instance.database;
    return await db!.query(TABLE_NAME);
  }

  Future<int> deleteNote(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(TABLE_NAME, where: '$COLUMN_ID = ?', whereArgs: [id]);
  }
}
