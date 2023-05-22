import 'package:flutter_application/Data/perfil_Entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:async';
import 'perfil_Entity.dart';
import 'conexao.dart';
import 'data_constants.dart';

class perfilSQLiteDatasource {
  Future<void> insertProfile(String nome, String email, String senha) async {
    final db = await Conexao.getConexaoDB();
    final perfilEntity = PerfilEntity(
      nome: nome,
      email: email,
      senha: senha,
    );

    int? perfilID = await db.rawInsert('''
    INSERT INTO $PERFIL_TABLE_NAME (
      $PERFIL_COLUMN_NOME,
      $PERFIL_COLUMN_EMAIL,
      $PERFIL_COLUMN_SENHA
    )
    VALUES (?, ?, ?)
  ''', [
      perfilEntity.nome,
      perfilEntity.email,
      perfilEntity.senha,
    ]);

    perfilEntity.perfilID = perfilID;
    print(perfilEntity);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await Conexao.getConexaoDB();
    return await db.query(PERFIL_TABLE_NAME);
  }

  Future<List<PerfilEntity>> getAllProfiles() async {
    Database db = await Conexao.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('SELECT * FROM $PERFIL_TABLE_NAME');

    List<PerfilEntity> perfis = [];
    for (var row in dbResult) {
      PerfilEntity perfil = PerfilEntity();
      perfil.perfilID = row['perfilID'];
      perfil.nome = row['nome'];
      perfil.email = row['email'];

      perfis.add(perfil);
    }
    return perfis;
  }

  Future<bool> getLogin(login, senha) async {
    Database db = await Conexao.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('''
              SELECT * FROM $PERFIL_TABLE_NAME
              WHERE $PERFIL_COLUMN_EMAIL = '$login' AND $PERFIL_COLUMN_SENHA = '$senha'
              ''');
    if (dbResult.isEmpty)
      return false;
    else
      return true;
  }

  Future<String> getLoggedUsed(email) async {
    Database db = await Conexao.getConexaoDB();
    String nome = "";
    List<Map> dbResult = await db.rawQuery(
        '''SELECT * FROM $PERFIL_TABLE_NAME WHERE $PERFIL_COLUMN_EMAIL = '$email' ''');

    for (var row in dbResult) {
      nome = row['nome'];
    }
    return nome;
  }
}
