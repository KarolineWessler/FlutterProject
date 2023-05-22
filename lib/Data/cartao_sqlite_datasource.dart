import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'cartao_Entity.dart';
import 'conexao.dart';
import 'data_constants.dart';

class cartaoSQLiteDatasource {
  Future<void> insertCard(String descricao, String numero, String validade, String cvv, String senha) async {
    final db = await Conexao.getConexaoDB();
    final cartaoEntity = CartaoEntity(
      descricao: descricao,
      numero: numero,
      validade: validade,
      cvv: cvv,
      senha: senha,
    );

    int? cartaoID = await db.rawInsert('''
    INSERT INTO $CARTAO_TABLE_NAME (
      $CARTAO_COLUMN_DESCRICAO,
      $CARTAO_COLUMN_NUMERO,
      $CARTAO_COLUMN_VALIDADE,
      $CARTAO_COLUMN_CVV,
      $CARTAO_COLUMN_SENHA
    )
    VALUES (?, ?, ?, ?, ?)
  ''', [
      cartaoEntity.descricao,
      cartaoEntity.numero,
      cartaoEntity.validade,
      cartaoEntity.cvv,
      cartaoEntity.senha,
    ]);

    cartaoEntity.cartaoID = cartaoID;
    print(cartaoEntity);
  }

  Future<List<CartaoEntity>> getAllCards() async {
    Database db = await Conexao.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('SELECT * FROM $CARTAO_TABLE_NAME');

    List<CartaoEntity> cartoes = [];
    for (var row in dbResult) {
      CartaoEntity cartao = CartaoEntity();
      cartao.cartaoID = row['cartaoID'];
      cartao.descricao = row['descricao'];
      cartao.numero = row['numero'];
      cartao.validade = row['validade'];
      cartao.senha = row['senha'];
      cartoes.add(cartao);
    }
    return cartoes;
  }

  Future<void> deleteCard(cartaoID) async {
    Database db = await Conexao.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('DELETE FROM $CARTAO_TABLE_NAME WHERE ID = ?', [cartaoID]);
    });
  }

  Future<void> deleteAllCards() async {
    Database db = await Conexao.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate('DELETE FROM $CARTAO_TABLE_NAME');
    });
  }
}
