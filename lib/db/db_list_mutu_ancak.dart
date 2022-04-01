import 'package:mobile_test_adji/model/mutu_ancak_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MutuAncakDataBase {
  static final MutuAncakDataBase instance = MutuAncakDataBase._init();

  static Database? _database;

  MutuAncakDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mutuancak.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);

  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableMutuAncak  (
    ${MutuAncakFields.id} $idType, 
  ${MutuAncakFields.nameBlock} $textType,
  ${MutuAncakFields.typeBlock} $textType,
  ${MutuAncakFields.isiBaris} $textType
    )
''');
  }

  Future<MutuAncak> create(MutuAncak mutuAncak) async {
    final db = await instance.database;

    final id = await db.insert(tableMutuAncak, mutuAncak.toJson());
    return mutuAncak.copy(id: id);
  }

  Future<int> delete(int? id) async {
    final db = await instance.database;

    return await db.delete(
      tableMutuAncak,
      where: '${MutuAncakFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<MutuAncak>> readAllList() async {
    print('masuk readall');
    final db = await instance.database;

    print(db);
    final orderBy = '${MutuAncakFields.id}';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    print(orderBy);
    final result = await db.query(tableMutuAncak, orderBy: orderBy);
    print(result);

    return result.map((json) => MutuAncak.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
