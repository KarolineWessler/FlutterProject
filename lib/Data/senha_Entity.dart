import 'dart:html';

class SenhaEntity {
  late int? senhaID;
  String? descricao;
  String? login;
  String? senha;

  SenhaEntity({
    this.senhaID, 
    this.descricao, 
    this.login, 
    this.senha
  });

  @override
  String toString() {
    return '$senhaID - $descricao - $login';
  }
}
