class PerfilEntity {
  late int? perfilID;
  String? nome;
  String? email;
  String? senha;

  PerfilEntity({
    this.nome,
    this.email,
    this.senha,
  });

  @override
  String toString() {
    return '$perfilID - $nome - $email';
  }
}
