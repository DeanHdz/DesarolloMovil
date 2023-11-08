import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const _databaseName = "myDataBase.db";
  static const _version = 1;
  //Nombre de la tabla
  static const table = "my_table";
  //Nombres de los atributos de la tabla
  static const id = "id"; //_id
  static const name = "name";
  static const age = "age"; //_age

  //sqflite
  late Database _db;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, _databaseName);
    //Se abre y crea la BD en el directorio
    //de la carpeta de nuestra app
    _db = await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    //Creacion de nuestra tabla
    await db.execute('''
      CREATE TABLE $table (
        $id INTEGER PRIMARY KEY, 
        $name TEXT NOT NULL, 
        $age INTEGER NOT NULL)''');
  }
}
