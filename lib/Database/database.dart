import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConfig {
  static Database? _database;
  static const String temperatureTable = 'temperature';
  static const String phLevelTable = 'phlevel';
  static const String feederTable = 'feeder';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'aquaponia.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    bool tableTemperatureExists =
        await _doesTableExist(db, DatabaseConfig.temperatureTable);

    if (!tableTemperatureExists) {
      await db.execute('''
        CREATE TABLE $temperatureTable(
          id INTEGER PRIMARY KEY,
          temperature_value INTEGER,
          create_at DATETIME
        )
      ''');
    }

    bool tablePhLevelExists =
        await _doesTableExist(db, DatabaseConfig.phLevelTable);

    if (!tablePhLevelExists) {
      await db.execute('''
        CREATE TABLE $phLevelTable(
          id INTEGER PRIMARY KEY,
          ph_level_value INTEGER,
          create_at DATETIME
        )
      ''');
    }

    bool tableFeederExists =
        await _doesTableExist(db, DatabaseConfig.feederTable);

    if (!tableFeederExists) {
      await db.execute('''
        CREATE TABLE $feederTable(
          id INTEGER PRIMARY KEY,
          time TEXT,
          week_days INTEGER,
          week_ends INTEGER,
          entire_week INTEGER,
          effective_at DATETIME,
          end_date DATETIME
        )
      ''');
    }
  }

  Future<bool> _doesTableExist(Database db, String tableName) async {
    var result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'");

    return result.isNotEmpty;
  }

  Future<int> insertData(Map<String, dynamic> row, table) async {
    Database db = await database;

    if (table == temperatureTable) {
      return await db.insert(temperatureTable, row);
    }

    if (table == phLevelTable) {
      return await db.insert(phLevelTable, row);
    }

    return await db.insert(feederTable, row);
  }

  Future<List<Map<String, dynamic>>> fetchAllData(String table) async {
    Database db = await database;

    if (table == phLevelTable) {
      return await db.query(phLevelTable);
    }

    if (table == temperatureTable) {
      return await db.query(temperatureTable, orderBy: 'create_at DESC');
    }

    return await db.query(feederTable);
  }

  Future<List<Map<String, dynamic>>> getLatestPHLevel(String table) async {
    Database db = await database;

    if (table == temperatureTable) {
      return await db.query(
        temperatureTable,
        orderBy: 'create_at DESC',
        limit: 1,
      );
    }

    return await db.query(
      phLevelTable,
      orderBy: 'create_at DESC',
      limit: 1,
    );
  }
}
