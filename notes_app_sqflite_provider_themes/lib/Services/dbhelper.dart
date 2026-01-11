
import 'package:notes_app_sqflite_provider_themes/Services/notesmodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Dbhelper._();
  static Dbhelper instance = Dbhelper._();

  Database? _db;

  static String Tablename = 'NotesTable';
  static String idColumn = 'id';
  static String titleColumn = 'title';
  static String descriptionColumn = 'description';

  Future<Database> GetDB() async{
    return _db ??= await initDB();
  }

  Future<Database> initDB() async{
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,'notes.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
             CREATE TABLE $Tablename(
             $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
             $titleColumn TEXT,
             $descriptionColumn TEXT)
           ''');
      },);
  }

  Future<List<NotesModel>> getNotes() async{
    final db = await GetDB();
    List<Map<String,dynamic>> data = await db.query(Tablename);
    return data.map((c) => NotesModel.fromJson(c)).toList();
  }

  Future<int> insertNotes(NotesModel model) async{
    final db = await GetDB();
    return db.insert(Tablename, model.toJson());
  }

  Future<int> deleteNotes(NotesModel model) async{
    final db = await GetDB();
    return db.delete(Tablename,where: 'id=?',whereArgs: [model.id]);
  }

  Future<int> updateNotes(NotesModel model) async{
    final db = await GetDB();
    return db.update(Tablename, model.toJson(),where: 'id=?',whereArgs: [model.id]);
  }
}