import 'package:flutter_application/Data/senha_Entity.dart';
import 'dart:async';
import 'conexao.dart';
import 'data_constants.dart';

class senhaSQLiteDatasource {

  Future<void> insertPassword(String descricao, String login, String senha) async {
    final db = await Conexao.getConexaoDB();
    final senhaEntity = SenhaEntity(descricao: descricao, login: login, senha: senha);

    int? senhaID = await db.rawInsert('''
      INSERT INTO $SENHA_TABLE_NAME (
        $SENHA_COLUMN_DESCRICAO,
        $SENHA_COLUMN_LOGIN,
        $SENHA_COLUMN_SENHA
      )
      VALUES (?, ?, ?)
    ''', [senhaEntity.descricao, senhaEntity.login, senhaEntity.senha]);

    senhaEntity.senhaID = senhaID;
    print(senhaEntity);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await Conexao.getConexaoDB();
    return await db.query(SENHA_TABLE_NAME);
  }

  Future<List<SenhaEntity>>? getAllPasswords() async {
    final db = await Conexao.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('SELECT * FROM $SENHA_TABLE_NAME');

    List<SenhaEntity> passwords = [];
    for (var row in dbResult) {
      SenhaEntity password = SenhaEntity();
      password.senhaID = row['senhaID'];
      password.descricao = row['descricao'];
      password.login = row['login'];
      password.senha = row['senha'];
      passwords.add(password);
    }
    return passwords;
  }

  Future<void> deletePasswordById(senhaId) async {
    final db = await Conexao.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('DELETE FROM $SENHA_TABLE_NAME WHERE ID = ?', [senhaId]);
    });
  }

  Future<void> deletePasswords() async {
    final db = await Conexao.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('DELETE FROM $SENHA_TABLE_NAME ');
    });
  }

}