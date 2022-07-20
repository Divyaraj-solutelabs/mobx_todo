import 'package:mobx_todo/feature/tasks/model/taskmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseProvider{
  static const String TABLE_TASK='tasks';
  static const String COLUMN_ID= "id";
  static const String COLUMN_TASK="Tasks";
  static const String COLUMN_COMPELETED="compeleted";

  DatabaseProvider._init();

  static final DatabaseProvider db = DatabaseProvider._init();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await createDatabase();
      return _database!;
    }
  }
  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'notes.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("creating tasks db");
        await database.execute(
          '''CREATE TABLE $TABLE_TASK (
              $COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
              $COLUMN_TASK TEXT NOT NULL,
              $COLUMN_COMPELETED TEXT
              )''',
        );
      },
    );
  }

  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    var notes = await db.query(TABLE_TASK, columns: [
      COLUMN_ID,
      COLUMN_TASK,
      COLUMN_COMPELETED
    ]);
    List<TaskModel> tasksList = <TaskModel>[];
    notes.forEach((currentTask) {
      TaskModel task = TaskModel.fromMap(currentTask);
      tasksList.add(task);
    });
    return tasksList.reversed.toList();
  }

  Future<TaskModel> insert(TaskModel task) async {
    final db = await database;
    task.id = await db.insert(TABLE_TASK, task.toMap());
    return task;
  }

  Future<int> delete(int? id) async {
    final db = await database;
    return await db.delete(TABLE_TASK, where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(TaskModel updatedTask) async {
    final db = await database;

    return await db.update(TABLE_TASK, updatedTask.toMap(),
        where: "id = ?", whereArgs: [updatedTask.id]);
  }
}

