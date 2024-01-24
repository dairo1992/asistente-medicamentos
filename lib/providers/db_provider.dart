import 'dart:io';

import 'package:asistentemedicamentos/models/medicamentosModel.dart';
import 'package:asistentemedicamentos/models/medicina.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ASISTENTE_MEDICAMENTOS.db');

    // await openDatabase(path, version: 3, onOpen: (db) {},
    //     onCreate: (Database db, int version) async {
    //   await db.execute('CREATE TABLE IF NOT EXISTS MEDICINA ('
    //       ' ID INTEGER PRIMARY KEY,'
    //       ' DESCRIPCION TEXT,'
    //       ' COMPOSICION TEXT,'
    //       ' FORMAFARMACEUTICA TEXT,'
    //       ' ESTADO INTEGER'
    //       ')');
    // });
    return await openDatabase(path, version: 4, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS MEDICAMENTO ('
          'ID INTEGER PRIMARY KEY,'
          'ID_MEDICINA INTEGER,'
          'ID_TIPO INTEGER,'
          'FRECUENCIA INTEGER,'
          'HORA TEXT,'
          'RECORDARME INTEGER,'
          'CANTIDAD INTEGER,'
          'ESTADO INTEGER,'
          ')');
    });
  }

  nuevaMedicina(Medicina nuevoScan) async {
    final db = await database;
    final res = await db!.insert('MEDICINA', nuevoScan.toJson());
    return res;
  }

  nuevaMedicamento(Medicamento nuevoScan) async {
    final db = await database;
    final res = await db!.insert('MEDICAMENTO', nuevoScan.toJson());
    return res;
  }

  // Future getMedicinas() async {
  //   final db = await database;
  //   final res = await db!.rawQuery('SELECT * FROM MEDICINA');
  //   print(res);

  // List<Medicina> list =
  //     res.isNotEmpty ? res.map((c) => Medicina.fromJson(c)).toList() : [];
  // return list;
  // }

  Future<List<Medicina>> getMedicinas() async {
    final db = await database;
    final res = await db!.query('MEDICINA');

    List<Medicina> list =
        res.isNotEmpty ? res.map((c) => Medicina.fromJson(c)).toList() : [];
    return list;
  }

  Future vaciarTabla() async {
    print("Eliminar datos...");
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM MEDICINA');
    print("Datos Eliminados");
    return res;
  }
}
