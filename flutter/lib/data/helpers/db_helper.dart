import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:shopping_app/data/models/user_profile_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton()
class DbHelper {
  final String _tableName = "user_profile";
  final String _columnUsername = "username";
  final String _columnFirstName = "firstName";
  final String _columnLastName = "lastName";
  final String _columnEmail = "email";
  final String _columnAge = "age";

  static Database? _database;

  DbHelper();

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB("shopping_app.db");
    return _database;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = join(await getDatabasesPath(), dbName);

    if (kDebugMode) {
      await Sqflite.setDebugModeOn(true);
    }

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDB
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnUsername TEXT PRIMARY KEY,
        $_columnFirstName TEXT NOT NULL,
        $_columnLastName TEXT NOT NULL,
        $_columnEmail TEXT NOT NULL,
        $_columnAge INTEGER NOT NULL
      )
    ''');
  }

  Future<void> saveUserProfile(UserProfileModel user) async {
    final db = await database;
    await db?.insert(
      _tableName,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<UserProfileModel?> getUserProfile() async {
    final db = await database;
    final maps = await db?.query(_tableName, limit: 1);

    if (maps!.isNotEmpty) {
      return UserProfileModel.fromMap(maps.first);
    }
    return null;
  }

  Future<void> clearUserProfile() async {
    final db = await database;
    await db?.delete(_tableName);
  }
}