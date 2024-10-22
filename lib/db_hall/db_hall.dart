
import 'package:get/get.dart';
import 'package:office_hall/db_hall/hall_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHall extends GetxService {
  late Database dbBase;

  Future<DBHall> init() async {
    await createHallDB();
    return this;
  }

  createHallDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'hall.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createHallTable(db);
        });
  }

  createHallTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS hall (id INTEGER PRIMARY KEY, createTime TEXT, imageData BLOB, title TEXT, totalSeat INTEGER, description TEXT, usedSeat INTEGER)');
  }

  insertHall(HallEntity entity) async {
    final id = await dbBase.insert('hall', {
      'createTime': entity.createTime.toIso8601String(),
      'imageData': entity.imageData,
      'title': entity.title,
      'totalSeat': entity.totalSeat,
      'description': entity.description,
      'usedSeat': entity.usedSeat,
    });
    return id;
  }

  updateHall(HallEntity entity) async {
    await dbBase.update(
        'hall',
        {
          'imageData': entity.imageData,
          'title': entity.title,
          'totalSeat': entity.totalSeat,
          'description': entity.description,
          'usedSeat': entity.usedSeat,
        },
        where: 'id = ?',
        whereArgs: [entity.id]);
  }

  deleteHall(HallEntity entity) async {
    await dbBase.delete('hall', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('hall');
  }

  Future<List<HallEntity>> getAllData() async {
    var result = await dbBase.query('hall', orderBy: 'createTime DESC');
    return result.map((e) => HallEntity.fromJson(e)).toList();
  }
}
