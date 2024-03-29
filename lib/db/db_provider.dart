import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

class DBProvider {
  DBProvider._(); //Create the constructor of the class

  static final DBProvider dataBase = DBProvider._();
  static Database? _database;

//create getter for the class
  Future<Database?> get database async {
    //we check if already a db
    if (_database != null) {
      return _database;
    }
    //else we create a batabase
    _database = await initDatabase();
    return _database;
  }

  //creat the db initialiser
  initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'todo_app_db.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE tasks (ID INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, creationDate TEXT)
''');
    }, version: 1);
  }

  addNewTask(Task newTask) async {
    final db = await database;
    db!.insert('tasks', newTask.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getTask() async {
    final db = await database;
    var res = await db!.query('tasks');
    if (res.length == 0) {
      return Null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : Null;
    }
  }
}
