import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// سنجيليتون
class DatabaseHelper {
  /// انشاء اوبجيكت لمره واحده
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  ///
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDabase();
    return _database!;
  }

  Future<Database> _initDabase() async {
    final path = join(await getDatabasesPath(), 'Items.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  price REAL,
  quantity INTEGER
);

  ''');
  }

  ///crud

  Future<int> insertItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert('items', item);
  }

  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await database;
    return await db.query('items');
  }

  Future<int> updateItem(Map<String, dynamic> item) async {
    final db = await database;
    return await db.update(
      'items',
      item,
      where: 'id =?',
      whereArgs: [item['id']],
    );
  }




  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      'items',
      where: 'id =?',
      whereArgs: [id]
    );
  }
}
