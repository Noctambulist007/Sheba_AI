import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sheba_ai/data/model/reminder_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'reminders.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE reminders(
        id TEXT PRIMARY KEY,
        medicineName TEXT,
        dosage TEXT,
        type TEXT,
        frequency TEXT,
        time TEXT,
        isEnabled INTEGER
      )
    ''');
  }

  Future<int> insertReminder(ReminderModel reminder) async {
    Database db = await database;
    return await db.insert(
      'reminders',
      reminder.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ReminderModel>> getReminders() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reminders');
    return List.generate(maps.length, (i) {
      return ReminderModel.fromMap(maps[i]);
    });
  }

  Future<int> updateReminder(ReminderModel reminder) async {
    Database db = await database;
    return await db.update(
      'reminders',
      reminder.toMap(),
      where: 'id = ?',
      whereArgs: [reminder.id],
    );
  }

  Future<int> deleteReminder(String id) async {
    Database db = await database;
    return await db.delete(
      'reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
