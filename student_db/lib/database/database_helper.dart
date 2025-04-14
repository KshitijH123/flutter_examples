import 'package:sqflite/sqflite.dart';
import 'package:student_db/model/students_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  final tableName = 'students';

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('students.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    // final path = join(dbPath, filePath);
    final path = '$dbPath$filePath';

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      marathiMarks INTEGER NOT NULL,
      hindiMarks INTEGER NOT NULL,
      englishMarks INTEGER NOT NULL,
      scienceMarks INTEGER NOT NULL,
      historyMarks INTEGER NOT NULL
    )
  ''');
  }

  Future<int> insertStudent(StudentsModel student) async {
    final db = await database;
    try {
      int id = await db.insert(
        tableName,
        student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Student inserted successfully with ID: $id");
      return id;
    } catch (e) {
      print("Error inserting student: $e");
      return -1;
    }
  }

  Future<List<StudentsModel>> getAllStudents() async {
    final db = await instance.database;
    final result = await db.query(tableName);

    // Ensure conversion from database to model
    return result.map((map) => StudentsModel.fromMap(map)).toList();
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
