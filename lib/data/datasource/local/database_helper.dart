import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sheba_ai/domain/model/reminder/reminder.dart';
import 'package:sheba_ai/domain/model/skin_analysis/skin_analysis_record.dart';

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
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
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
    await db.execute('''
      CREATE TABLE skin_analysis_history(
        id TEXT PRIMARY KEY,
        imagePath TEXT,
        analysis TEXT NOT NULL,
        confidence TEXT,
        summary TEXT,
        severity TEXT,
        analyzedAt TEXT NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE skin_analysis_history(
          id TEXT PRIMARY KEY,
          imagePath TEXT,
          analysis TEXT NOT NULL,
          confidence TEXT,
          summary TEXT,
          severity TEXT,
          analyzedAt TEXT NOT NULL
        )
      ''');
    }
  }

  Future<int> insertReminder(Reminder reminder) async {
    Database db = await database;
    return await db.insert(
      'reminders',
      reminder.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Reminder>> getReminders() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('reminders');
    return List.generate(maps.length, (i) {
      return Reminder.fromMap(maps[i]);
    });
  }

  Future<int> updateReminder(Reminder reminder) async {
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

  Future<int> insertSkinAnalysisRecord(SkinAnalysisRecord record) async {
    Database db = await database;
    return await db.insert(
      'skin_analysis_history',
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SkinAnalysisRecord>> getSkinAnalysisHistory() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'skin_analysis_history',
      orderBy: 'analyzedAt DESC',
    );
    return maps.map((m) => SkinAnalysisRecord.fromMap(m)).toList();
  }

  Future<int> deleteSkinAnalysisRecord(String id) async {
    Database db = await database;
    return await db.delete(
      'skin_analysis_history',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
