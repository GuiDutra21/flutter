import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

// Classe com métodos estáticos relacionados ao banco de dados
class DBUtils {

  static Future<sql.Database> database() async 
  { 
    // Captura o path do banco
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'PLACES.db'), // Local onde será salvo os dados -> dentro do dispositivo que roda o app
      onCreate: (db, version) { // Apenas se o banco ainda não existir, caso exista a função retorna a instância já salva
        db.execute(
        'CREATE TABLE PLACES (id TEXT PRIMARY KEY, title TEXT, image TEXT)'
        );
      },
      version: 1,
    );
  }

  static Future<void> insert (String table, Map <String, Object> data) async
  { 
    final db = await DBUtils.database(); // Cria o banco de dados
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace); // Insere no banco
  }

}