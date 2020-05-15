import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = "todo";
final String column_id = "id";
final String column_name = "name";

class TaskModel {
  final String name;
  int id;
  TaskModel({this.name,this.id});

  Map<String, dynamic> toMap() {
    return {"name": name};
  }
}

class ToDoHelper {

  Database db;

  ToDoHelper(){
    initDatabase();
  }

  Future<void> initDatabase() async {
    db = await openDatabase(join(await getDatabasesPath(), "mydb.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tableName ($column_id INTEGER PRIMARY KEY AUTOINCREMENT,$column_name TEXT)");
    }, version: 1);
  }

  Future<void> insertData(TaskModel task) async {
    try {
      db.insert(tableName, task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }
  Future <List<TaskModel>> getAllTask() async {
    final List<Map<String, dynamic>> task = await db.query(tableName);

    return List.generate(task.length, (i){
      return TaskModel(name: task[i][column_name],id: task[i][column_id]);
    });

  }
}
