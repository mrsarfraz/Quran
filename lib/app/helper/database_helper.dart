import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:quran/app/models/surah_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper? databaseHelper;
  static Database? _database;

  DatabaseHelper._createInstance();

  String surahTable = 'surah_table';
  String colNumber = 'number';
  String colName = 'name';
  String colEnglishName = 'englishName';
  String colEnglishNameTranslation = 'englishNameTranslation';
  String colNumberOfAyahs = 'numberOfAyahs';


  factory DatabaseHelper() {
    return databaseHelper ??= DatabaseHelper._createInstance();
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $surahTable($colNumber INTEGER PRIMARY KEY, '
        '$colName TEXT, $colEnglishName TEXT, $colEnglishNameTranslation TEXT, '
        '$colNumberOfAyahs INTEGER)' );
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}surah.db';

    var surahDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return surahDatabase;
  }

  Future<Database> get database async {
    return _database ??= await initializeDatabase();
  }

  //Fetch operation: Get all surahs object from database
  Future<List<Map<String, dynamic>>> getSurahMapList() async {
    Database db = await database;
    var result = await db.query(surahTable);
    return result;
  }

  Future<int> insertSurah(SurahModel surahModel) async {
    Database db = await database;
    var result = await db.insert(surahTable, surahModel.toJson());
    return result;
  }

  Future<List<SurahModel>> getSurahList() async {
    var surahMapList = await getSurahMapList();
    int count = surahMapList.length;
    List<SurahModel> surahList = <SurahModel>[];
    for(int i = 0; i < count; i++){
      surahList.add(SurahModel.fromJson(surahMapList[i]));
    }
    return surahList;
  }

// deleteSurah(int number) async {
//   Database db = await database;
//   int? result = await db.rawDelete('DELETE FROM $surahTable WHERE $colNumber = $number');
//   return result;
// }

}
