import 'dart:html';

class PerfilEntity {
  late int? perfilID;
  String? nome;
  String? email;
  String? senha;
  Blob? foto;

  PerfilEntity({
    this.nome,
    this.email,
    this.senha,
    this.foto,
  });

  @override
  String toString() {
    return '$perfilID - $nome - $email';
  }
}
