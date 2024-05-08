import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'Income.dart';

class IncomeScreenProvider with ChangeNotifier {
  late Database _database;
  List<IncomeScreen> _IncomeScreens = [];

  List<IncomeScreen> get IncomeScreens => _IncomeScreens;

  IncomeScreenProvider() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'IncomeScreens.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IncomeScreens(
            id INTEGER PRIMARY KEY,
            category TEXT,
            amount REAL,
            description TEXT,
            wallet TEXT
          )
        ''');
      },
    );

    await _loadIncomeScreens();
  }

  Future<void> _loadIncomeScreens() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('IncomeScreens');

    _IncomeScreens = List.generate(
      maps.length,
      (i) => IncomeScreen(
        id: maps[i]['id'],
        category: maps[i]['category'],
        amount: maps[i]['amount'],
        description: maps[i]['description'],
        wallet: maps[i]['wallet'],
      ),
    );

    notifyListeners();
  }

  Future<void> addIncomeScreen(IncomeScreen IncomeScreen) async {
    await _database.insert('IncomeScreens', IncomeScreen.toMap());
    await _loadIncomeScreens();
  }

  Future<void> updateIncomeScreen(IncomeScreen IncomeScreen) async {
    await _database.update(
      'IncomeScreens',
      IncomeScreen.toMap(),
      where: 'id = ?',
      whereArgs: [IncomeScreen.id],
    );
    await _loadIncomeScreens();
  }

  Future<void> deleteIncomeScreen(int IncomeScreenId) async {
    await _database.delete(
      'IncomeScreens',
      where: 'id = ?',
      whereArgs: [IncomeScreenId],
    );
    await _loadIncomeScreens();
  }
}
