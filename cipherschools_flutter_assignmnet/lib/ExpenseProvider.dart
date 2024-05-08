import 'package:cipherschools_flutter_assignmnet/Expenses.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cipherschools_flutter_assignmnet/Expenses.dart';

class ExpenseProvider with ChangeNotifier {
  late Database _database;
  List<ExpenseScreen> _expenses = [];

  List<ExpenseScreen> get expenses => _expenses;

  ExpenseProvider() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'expenses.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY,
            category TEXT,
            amount REAL,
            description TEXT,
            wallet TEXT
          )
        ''');
      },
    );

    await _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final List<Map<String, dynamic>> maps = await _database.query('expenses');

    _expenses = List.generate(
      maps.length,
      (i) => ExpenseScreen(
        id: maps[i]['id'],
        category: maps[i]['category'],
        amount: maps[i]['amount'],
        description: maps[i]['description'],
        wallet: maps[i]['wallet'],
      ),
    );

    notifyListeners();
  }

  Future<void> addExpense(ExpenseScreen expense) async {
    await _database.insert('expenses', expense.toMap());
    await _loadExpenses();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }
}
